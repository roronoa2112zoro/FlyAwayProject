<%@page import="com.flyaway.model.Seats"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.flyaway.model.Flights"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>Current Booking</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
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
	<h1 style="color: white; text-align: center;">Current Bookings</h1>
	<br>
	<br>
	<div class="container">
		<form action='PaymentMethod.jsp' method='post'>
			<%
			ArrayList<Seats> results = (ArrayList<Seats>) (request.getAttribute("seats"));
			out.print("<table border='2' class='table table-striped table-hover'>");
			out.print("<thead>");
			out.print("<tr>");
			out.print("<th>Flight Number</th>");
			out.print("<th>Flight Name</th>");
			out.print("<th>Departure</th>");
			out.print("<th>Arrival</th>");
			out.print("<th colspan= " + results.size() + ">Seat Number</th>");
			out.print("<th>Price</th>");
			out.print("</tr>");
			out.print("</thead>");
			out.print("<tbody>");

			Flights flight = results.get(0).getSeatPk().getFlights();
			int price = Integer.parseInt(request.getParameter("price"));
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("flight", flight);

			httpSession.setAttribute("price", price);

			out.print("<tr>");
			out.print("<td>" + flight.getFlightId() + "</td>");
			out.print("<td>" + flight.getFlightName() + "</td>");
			out.print("<td>" + flight.getDeparture() + "</td>");
			out.print("<td>" + flight.getArrival() + "</td>");

			Iterator<Seats> iterator = results.iterator(); // Iterator interface

			while (iterator.hasNext()) // iterate through all the data until the last record
			{
				Seats seat = iterator.next();
				out.print("<td>" + seat.getSeatPk().getSeatNumber() + "</td>");

			}
			out.print("<td>" + price + "</td>");

			out.print("</tr>");
			out.print("</tbody>");
			out.print("</table>");
			%>
			<input type='submit' class='btn btn-primary flex-row-reverse'
				value='Proceed To Payment' />
			</td>

		</form>
	</div>
</body>

</html>