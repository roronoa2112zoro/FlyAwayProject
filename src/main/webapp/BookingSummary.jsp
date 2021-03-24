<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@page import="com.flyaway.model.Seats"%>
<%@page import="com.flyaway.model.Flights"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Summary</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light">
	<div class="collapse navbar-collapse"
		style="display: inline !important;" id="navbarCollapse">
		<ul class="navbar-nav mr-auto nav nav-justified">
			<li class="nav-item"><a class="nav-link" href="index.jsp"
				style="color: #ff0000; font-size: large;">Home</a></li>
		</ul>
	</div>
	</nav>
	<h2 style="text-align: center;">Payment Successful</h2>
	<br />
	<br />
	<h2 style="text-align: center;">Booking Details</h2>
	<div class="container">
		<%
		HttpSession httpSession = request.getSession(true);
		if (httpSession != null) {
			List<Seats> seats = (List<Seats>) httpSession.getAttribute("seats");
			Flights flight = (Flights) httpSession.getAttribute("flight");

			out.print("<table class='table table-striped table-hover' border = '1'>");

			out.print("<thead>");
			out.print("<tr>");
			out.print("<th style= 'text-align:center'>Flight Name</th>");
			out.print("<th style= 'text-align:center'>Departure City</th>");
			out.print("<th style= 'text-align:center'>Arrival City</th>");
			out.print("<th style= 'text-align:center'>Departure Date</th>");
			out.print("<th style= 'text-align:center'>Arrival Date</th>");
			out.print("<th colspan= " + seats.size() + " style= 'text-align:center'>Seat Number</th>");
			out.print("</tr>");
			out.print("</thead>");
			out.print("<tbody>");
			out.print("<tr>");
			out.print("<td style= 'text-align:center'><input type = 'text' name ='flight_name' size = '4' value = '"
			+ flight.getFlightName() + "'/></td>");
			out.print(
			"<td style= 'text-align:center'><input type = 'text' style= 'text-align:center' size = '15' name ='departure' value = '"
					+ flight.getDeparture() + "'/></td>");
			out.print(
			"<td style= 'text-align:center'><input type = 'text' style= 'text-align:center' size = '15' name ='departureDte' value = '"
					+ flight.getDepartureDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) + "'/></td>");
			out.print(
			"<td style= 'text-align:center'><input type = 'text' style= 'text-align:center' size = '15' name ='arrival' value = '"
					+ flight.getArrival() + "'/></td>");
			out.print(
			"<td style= 'text-align:center'><input type = 'text' style= 'text-align:center' size = '15' name ='arrivalDate' value = '"
					+ flight.getArrivalDate() + "'/></td>");

			Iterator<Seats> iterator = seats.iterator();
			while (iterator.hasNext()) {
				Seats seat = iterator.next();
				out.print(
				"<td style= 'text-align:center'><input type = 'text' style= 'text-align:center' size = '8' name ='seat' value = '"
						+ seat.getSeatPk().getSeatNumber() + "'/></td>");
			}
			out.print("</tr>");
			out.print("</tbody>");
			out.print("</table>");
		}
		%>
	</div>

</body>
</html>