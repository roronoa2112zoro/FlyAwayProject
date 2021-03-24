package com.flyaway.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.impl.FlightDaoImpl;
import com.flyaway.model.Flights;
import com.flyaway.model.Seats;

@WebServlet("/PaymentProcess")
public class PaymentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlightDaoImpl flightDaoImpl = new FlightDaoImpl();
	
    public PaymentProcess() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		String card = request.getParameter("card");
		String cvv = request.getParameter("cvv");
		boolean result =validateCardAndCvv(card,cvv);
		if(result) {
			HttpSession httpSession = request.getSession(true);
			if(httpSession!=null) {
				request.getRequestDispatcher("BookingSummary.jsp").include(request, response);
			}
		}
		else {
			request.getRequestDispatcher("PaymentMethod.jsp").include(request, response);
			writer.println("<h2 style = 'text-align : center; color:red'>Invalid Card Details</h2>");
		}
		
	
		
	}

	private boolean validateCardAndCvv(String card, String cvv) {
		String cardExp = "^[0-9]{16}$";
		String cvvExp = "^[0-9]{3}$";
		Pattern p = Pattern.compile(cardExp);
		Matcher m = p.matcher(card);
		if(m.matches())
		{
			p = Pattern.compile(cvvExp);
			m = p.matcher(cvv);
			if(m.matches())
				return true;
        }
		return false;
	}

}
