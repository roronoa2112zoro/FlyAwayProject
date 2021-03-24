
<%@page import="com.flyaway.model.Flights"%>
<%@page import="com.flyaway.model.Features"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>

<%-- <jsp:include page="Templates/HeadMetaInfo.jsp"/> --%>
<title>Show Flights</title>
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
	<br />
	<br />
	<h3 style='text-align: center'>Flight List</h3>
	<br />
	<br />
	<div class="container">

		<div class="row">

			<!-- Table -->
			<section class="col--lg-9" style="margin-left: 2%;">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th style='text-align: center'>Flight</th>
							<th style='text-align: center'>Departure City</th>
							<th style='text-align: center'>Arrival City</th>
							<th style='text-align: center'>Departure Date</th>
							<th style='text-align: center'>Arrival Date</th>
							<th style='text-align: center'>Class</th>
							<th style='text-align: center'>Price</th>
						</tr>
					</thead>
					<tbody>
						<%
						HttpSession httpSession = request.getSession(true);
						if (httpSession != null) {
							ArrayList<Flights> results = (ArrayList<Flights>) (httpSession.getAttribute("flightDetails"));
							ArrayList<Features> features = (ArrayList<Features>) (httpSession.getAttribute("features"));
							for (int i = 0; i < results.size(); i++) {
								out.print("<form action='UserDetails.jsp' method='post'>");

								out.print("<tr>");
								out.print("<input type = 'hidden' name ='flight_id' value = '" + results.get(i).getFlightId() + "'/>");
								out.print("<input type = 'hidden' name ='people' value = '" + request.getParameter("people") + "'/>");
								out.print(
								"<td style= 'text-align:center'> <input name='flight_name' size = '10' style= 'text-align:center' readonly value='"
										+ results.get(i).getFlightName() + "'/></td>");
								out.print(
								"<td style= 'text-align:center'> <input name='depart_city' size = '10'  style= 'text-align:center' readonly value='"
										+ results.get(i).getDeparture() + "'/></td>");
								out.print(
								"<td style= 'text-align:center'> <input name='arrival_city' size = '10' style= 'text-align:center' readonly value='"
										+ results.get(i).getArrival() + "'/></td>");
								out.print(
								"<td style= 'text-align:center'> <input name='depart_date' size = '10' style= 'text-align:center' readonly value='"
										+ results.get(i).getDepartureDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"))
										+ "'/></td>");
								out.print(
								"<td style= 'text-align:center'> <input name='arrival_date' size = '10' style= 'text-align:center' readonly value='"
										+ results.get(i).getArrivalDate() + "'/></td>");
								out.print(
								"<td style= 'text-align:center'> <input name='class_name' size = '8' style= 'text-align:center' readonly value='"
										+ request.getParameter("class") + "'/></td>");
								for (Features feature : features) {
							if (results.get(i).getFlightId() == feature.getFeaturesId().getFlightId()
									&& request.getParameter("class").equals(feature.getFeaturesId().getClassName())) {
								out.print(
										"<td style= 'text-align:center'> <input name='economy_price' style= 'text-align:center' size = '4' readonly value='"
												+ feature.getPrice() + "'/></td>");
								break;
							} else if (feature.getFeaturesId().getFlightId() == results.get(i).getFlightId()
									&& feature.getFeaturesId().getClassName().equals(feature.getFeaturesId().getClassName())) {
								out.print(
										"<td style= 'text-align:center'> <input name='business_price' style= 'text-align:center' size = '4' readonly value='"
												+ feature.getPrice() + "'/></td>");
								break;
							} else if (feature.getFeaturesId().getFlightId() == results.get(i).getFlightId()
									&& feature.getFeaturesId().getClassName().equals(feature.getFeaturesId().getClassName())) {
								out.print(
										"<td style= 'text-align:center'> <input name='first_price' style= 'text-align:center' size = '4' readonly value='"
												+ feature.getPrice() + "'/></td>");
								break;
							}

								}
								out.print(
								"<td style= 'text-align:center'><input type='submit' class='btn btn-primary flex-row-reverse' value ='Select'></td>");
								out.print("</tr>");
								out.print("</form>");
							}
						}
						%>


					</tbody>
				</table>
			</section>
		</div>
</body>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
</body>
</html>