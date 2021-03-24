package com.flyaway.services.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.impl.FeaturesDaoImpl;
import com.flyaway.dao.impl.FlightDaoImpl;
import com.flyaway.dao.impl.UsersDaoImpl;
import com.flyaway.model.Features;
import com.flyaway.model.Flights;
import com.flyaway.model.Users;

@WebServlet("/ValidateUser")
public class ValidateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private FlightDaoImpl flightDaoImpl = new FlightDaoImpl();
	private FeaturesDaoImpl featuresDao = new FeaturesDaoImpl();
	private UsersDaoImpl userDaoImpl = new UsersDaoImpl();
    public ValidateUser() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		String userName = request.getParameter("name");
		String password = request.getParameter("password");
		Users user = userDaoImpl.getUserById(userName, password);
		if(user != null){
			
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(250);
			
			List<Flights> flightList = flightDaoImpl.getAllFlights();
			 
			List<Features> features = featuresDao.getAllFeatures();
	         
	        session.setAttribute("features", features);      
			request.setAttribute("flightList", flightList);
			session.setAttribute("flights", flightList);
			
			request.getRequestDispatcher("FlightsSummary.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("Login.jsp").include(request, response);
			writer.println("<h2 style = 'text-align : center; color:red'>Invalid Credentials</h2>");
		}
		
	}

}
