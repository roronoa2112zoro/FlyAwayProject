package com.flyaway.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.impl.FeaturesDaoImpl;
import com.flyaway.dao.impl.FlightDaoImpl;
import com.flyaway.model.Features;
import com.flyaway.model.Flights;

@WebServlet("/SearchFlight")
public class SearchFlight extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private FlightDaoImpl flightDao = new FlightDaoImpl();
	private List<Flights> results = new ArrayList<Flights>();
	private FeaturesDaoImpl featuresDao = new FeaturesDaoImpl();
	
    public SearchFlight() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String departure = request.getParameter("from");
		String arrival = request.getParameter("to");
	
		List<Flights> flights = flightDao.getFlights(departure, arrival);
		if(flights.isEmpty()) {
			PrintWriter writer = response.getWriter();
			request.getRequestDispatcher("BookFlight.jsp").include(request, response);
			writer.print("<h2 style = 'text-align : center; color:red'>Flight not available for the requested source-destination</h2>");
		}
		else {
			addFlights(flights, request, response);
			List<Features> features = featuresDao.getAllFeatures();
			
			if(results.isEmpty()) {
				PrintWriter writer = response.getWriter();
				request.getRequestDispatcher("BookFlight.jsp").include(request, response);
				writer.print("<h2 style = 'text-align : center; color:red'>Requested number of seats not available</h2>");
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("flightDetails", results);
				session.setAttribute("features", features);
				request.setAttribute("flights", results);
				request.getRequestDispatcher("ShowFlights.jsp").forward(request,response);
			}
		}
	}
	
	void addFlights(List<Flights> flights, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Iterator<Flights> iterator = flights.iterator();
		String className = request.getParameter("class");
		
		while(iterator.hasNext())  {
			Flights flight = iterator.next();
	     	
			switch(className) {
	     		case "Economy": if(flight.getEconomy()>= Integer.parseInt(request.getParameter("people")))
	     						results.add(flight); 
	     						break;
	     		case "Business": if(flight.getBusiness()>= Integer.parseInt(request.getParameter("people")))
	     						results.add(flight); 
	     						break;
	     		case "First": if(flight.getFirst()>= Integer.parseInt(request.getParameter("people")))
	     					  results.add(flight); 
	     						break;
			}
		}
	}
}
