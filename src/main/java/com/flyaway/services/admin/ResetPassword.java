package com.flyaway.services.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.impl.UsersDaoImpl;
import com.flyaway.model.Users;

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsersDaoImpl userDaoImpl = new UsersDaoImpl();
       
    public ResetPassword() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newPassword = request.getParameter("new_password");
	//	String confirmPassword = request.getParameter("confirm_password");
		Users user = new Users();
		HttpSession session = request.getSession(true);
		if(session != null) {
			user = (Users) session.getAttribute("user");
			user.setPassword(newPassword);
			userDaoImpl.updateUser(user);
			response.sendRedirect("FlightsSummary.jsp");
		}
		
	}

}

