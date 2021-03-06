package com.flyaway.services.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Logout() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession(true);
		if(session != null) {
			
			session.invalidate();
			
			request.getRequestDispatcher("Login.jsp").include(request, response);
			writer.println("<h2 style = 'text-align : center; color:red'>Logged out successfully</h2>");
		}
		else {
			writer.println("Session expired");
		}
	}
}
