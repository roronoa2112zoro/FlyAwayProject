<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.flyaway.model.Flights"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<title>Flight Details</title>
</head>
<body>
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

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("user") == null) {
		response.sendRedirect("Login.jsp");
	}
	%>
	<%
	HttpSession httpSession = request.getSession(true);
	ArrayList<Flights> flights = (ArrayList<Flights>) httpSession.getAttribute("flights");
	out.print("<table border = '1' class='table table-striped table-hover'>");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>FlightId</th> ");
	out.print("<th colspan='3' style='text-align: center'>Seating type</th>");
	out.print("<th>Price</th>");
	out.print("</tr> ");
	out.print("<tr>");
	out.print("<td></td>");
	out.print("<th>Economy</td=h>");
	out.print("<th>Business</th> ");
	out.print("<th>First</th>");
	out.print("</tr>");

	for (Flights flight : flights) {
		int flightId = Integer.parseInt(request.getParameter("flight_id"));
		if (flightId == flight.getFlightId()) {
			out.print("<thbody>");
			out.print("<tr>");
			out.print("<td><input type = 'text' name ='flight_id' size = '5' readonly value = '" + flight.getFlightId()
			+ "'/></td>");
			out.print("<td><input type = 'text' name ='class' size = '5' readonly value = '" + flight.getBusiness()
			+ "'/></td>");
			out.print("<td><input type = 'text' name ='class' size = '5' readonly value = '" + flight.getEconomy()
			+ "'/></td>");
			out.print("<td><input type = 'text' name ='class' size = '5' readonly value = '" + flight.getFirst()
			+ "'/></td>");
			out.print("<td><input type = 'text' name ='class' size = '5' readonly value = '" + flight.getFirst()
			+ "'/></td>");
		}
		System.out.println(flight);

	}
	%>
	</table>
</body>
</html>