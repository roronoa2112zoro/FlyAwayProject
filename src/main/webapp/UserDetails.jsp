<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.flyaway.model.Flights"%>
<%@page import="com.flyaway.model.Features"%>
<%@page import="com.flyaway.dao.impl.FeaturesDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<title>User Details</title>
</head>

<body
	style="background: (rgb(118, 10, 138background : ( rgb(118, 10, 138)))); height: 100%; min-height: 100%; margin: 0; padding: 0;">

	<nav class="navbar navbar-expand-lg navbar-light">
	<div class="collapse navbar-collapse"
		style="display: inline !important;" id="navbarCollapse">
		<ul class="navbar-nav mr-auto nav nav-justified">
			</li>
			<li class="nav-item"><a class="nav-link" href="index.jsp"
				style="color: #ff0000; font-size: large;">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="Login"
				style="color: #ff0000; font-size: large;">Admin Login</a></li>
			<li class="nav-item"><a class="nav-link" href="BookFlight"
				style="color: #ff0000; font-size: large;">Book Flight</a>
		</ul>
	</div>
	</nav>
	<br />
	<br />
	<div class="container">
		<h3 style='text-align: center'>User Details</h3>
		<form action="CurrentBooking" method="Post">
			<div class="form-group">
				<label for="firstName">First Name</label> <input required
					type="text" class="form-control" name="firstName" required />
			</div>
			<div class="form-group">
				<label for="lastName">Last Name</label> <input required type="text"
					class="form-control" name="lastName" required />
			</div>
			<div class="form-group">
				<label for="email">Email</label> <input type="email"
					class="form-control" name="email" required />
			</div>

			<div class="form-group">
				<label for="number">Phone</label> <input required type="text"
					class="form-control" name="phone" required />
			</div>
			<%
			FeaturesDaoImpl featuresDao = new FeaturesDaoImpl();
			String flightId = request.getParameter("flight_id");
			int people = Integer.parseInt(request.getParameter("people"));
			String className = request.getParameter("class_name");
			List<Features> f = featuresDao.getFeaturesForFlight(flightId, className);

			int price = f.get(0).getPrice() * people;

			out.print("<input type = 'hidden' name ='flight_id' value = '" + flightId + "'/>");
			out.print("<input type = 'hidden' name ='class_name' value = '" + className + "'/>");
			out.print("<input type = 'hidden' name ='people' value = '" + people + "'/>");
			out.print("<input type = 'hidden' name ='price' value = '" + price + "'/>");
			%>
			<input type="submit" class="btn btn-primary" value="Continue" />

		</form>
	</div>
</body>
</html>