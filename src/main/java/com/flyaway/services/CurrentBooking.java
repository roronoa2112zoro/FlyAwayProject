package com.flyaway.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.SeatDao;
import com.flyaway.dao.impl.SeatDaoImpl;
import com.flyaway.model.Flights;
import com.flyaway.model.Seats;

@WebServlet("/CurrentBooking")
public class CurrentBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CurrentBooking() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SeatDao seatDaoImpl = new SeatDaoImpl();
		List<Seats>  seats = new ArrayList<Seats> ();
		
		ArrayList<Flights> flights = new ArrayList<Flights>();
		List<Seats> result = new ArrayList<Seats>();
		
		
		int flightId = Integer.parseInt(request.getParameter("flight_id"));
		int people = Integer.parseInt(request.getParameter("people"));
		String className = request.getParameter("class_name");
		
		HttpSession session = request.getSession(true);
		session.setAttribute("user", request.getParameter("firstName"));
		if(session != null) {
			flights = (ArrayList<Flights>) session.getAttribute("flightDetails");
				
			for(Flights flight:flights) {
				if(flight.getFlightId() == Integer.parseInt(request.getParameter("flight_id")))		
					seats = seatDaoImpl.getSeats(flightId,className);
			}
		}
		
		for(Seats seat:seats) {
			if(people >0) {
				
				result.add(seat);
				people--;
			}
		}
		System.out.println("Seat size: " + seats.size());
		
			session.setAttribute("seats", result);
			request.setAttribute("seats", result);
			request.getRequestDispatcher("CurrentBooking.jsp").forward(request,response);
		
	}
}
