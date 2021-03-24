<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.flyaway.model.Flights"%>
<%@page import="com.flyaway.model.Features"%>
<%@page import="com.flyaway.model.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
</head>

<body>
	<div class="container">
		<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		if (session.getAttribute("user") == null) {
			response.sendRedirect("Login.jsp");
		}
		%>
		<br />
		<nav class="navbar navbar-expand-md" style="float: right"> <a
			class="navbar-brand" href="ResetPassword.jsp">Update Password</a>
		<form action="Logout" method="post">
			<input type="submit" class="btn btn-secondary" value="Logout" />
		</form>

		</nav>
		<br /> <br />


		<h3 style="text-align: center">Flight List</h3>
		<br />

		<table class="table table-striped table-hover" border="1">
			<thead>
				<tr>
					<th style='text-align: center'>Flight Id</th>
					<th style='text-align: center'>Flight Name</th>
					<th style='text-align: center'>Departure</th>
					<th style='text-align: center'>Arrival</th>
					<th style='text-align: center'>Date</th>
					<th style='text-align: center' colspan="2">Economy</th>
					<th style='text-align: center' colspan="2">Business</th>
					<th style='text-align: center' colspan="2">First</th>
				</tr>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th style='text-align: center'>Seats</th>
					<th style='text-align: center'>Price</th>
					<th style='text-align: center'>Seats</th>
					<th style='text-align: center'>Price</th>
					<th style='text-align: center'>Seats</th>
					<th style='text-align: center'>Price</th>
				</tr>
			</thead>

			<tbody>
				<%
				HttpSession httpSession = request.getSession(true);
				ArrayList<Flights> results = (ArrayList<Flights>) httpSession.getAttribute("flights");
				//ArrayList<Flights> results = (ArrayList<Flights>)(request.getAttribute("flightList"));

				for (int i = 0; i < results.size(); i++) {
					out.print("<form method='post'>");
					out.print("<tr>");
					out.print(
					"<td style= 'text-align:center'><input type = 'text' name ='flight_id' size = '1' style= 'text-align:center' readonly value = '"
							+ results.get(i).getFlightId() + "'/></td>");
					out.print(
					"<td style= 'text-align:center'> <input name='flight_name' size = '5'  style= 'text-align:center' readonly value='"
							+ results.get(i).getFlightName() + "'/></td>");
					out.print(
					"<td style= 'text-align:center'> <input name='depart_city' size = '8' style= 'text-align:center' readonly value='"
							+ results.get(i).getDeparture() + "'/></td>");
					out.print(
					"<td style= 'text-align:center'> <input name='arrival_city' size = '8' style= 'text-align:center' readonly value='"
							+ results.get(i).getArrival() + "'/></td>");
					out.print(
					"<td style= 'text-align:center'> <input name='depart_date' size = '12' style= 'text-align:center' readonly value='"
							+ results.get(i).getDepartureDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) + "'/></td>");

					ArrayList<Features> features = (ArrayList<Features>) httpSession.getAttribute("features");
					for (Features feature : features) {
						if (feature.getFeaturesId().getFlightId() == results.get(i).getFlightId()
						&& feature.getFeaturesId().getClassName().equals("Economy")) {
					out.print(
							"<td style= 'text-align:center'> <input name='economy_seat' style= 'text-align:center' size = '4' readonly value='"
									+ results.get(i).getEconomy() + "'/></td>");
					out.print(
							"<td style= 'text-align:center'> <input name='economy_price' style= 'text-align:center' size = '4' readonly value='"
									+ feature.getPrice() + "'/></td>");
						} else if (feature.getFeaturesId().getFlightId() == results.get(i).getFlightId()
						&& feature.getFeaturesId().getClassName().equals("Business")) {
					out.print(
							"<td style= 'text-align:center'> <input name='business_seat' style= 'text-align:center' size = '4' readonly value='"
									+ results.get(i).getBusiness() + "'/></td>");
					out.print(
							"<td style= 'text-align:center'> <input name='business_price' style= 'text-align:center' size = '4' readonly value='"
									+ feature.getPrice() + "'/></td>");
						} else if (feature.getFeaturesId().getFlightId() == results.get(i).getFlightId()
						&& feature.getFeaturesId().getClassName().equals("First")) {
					out.print(
							"<td style= 'text-align:center'> <input name='first_seat' style= 'text-align:center' size = '4' readonly value='"
									+ results.get(i).getFirst() + "'/></td>");
					out.print(
							"<td style= 'text-align:center'> <input name='first_price' style= 'text-align:center' size = '4' readonly value='"
									+ feature.getPrice() + "'/></td>");
						}

					}

					out.print("</tr>");
					out.print("</form>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>

</html>