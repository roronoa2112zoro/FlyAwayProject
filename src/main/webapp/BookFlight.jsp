<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Flight Search</title>

<link rel="icon"
	href="https://www-turkishairlines.akamaized.net/theme/img/icons/favicon.ico">

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">

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
	<br>
	<div class="container">
		<form role="form" action="SearchFlight" method="post"
			class="flight-search-form">
			<div class="row">
				<div class="form-group col-lg-4 ui-widget">
					<label for="from">From</label> <input type="text"
						required="required" name="from" placeholder="Departure City"
						class="form-control" id="osearch"
						style="height: 50px; margin: 0; padding: 0 20px; vertical-align: middle; background: #fff; border: 3px solid #fff; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: 300; line-height: 50px; color: #888;">
				</div>

				<div class="form-group col-lg-4 ui-widget">
					<label for="to">To</label> <input required type="text" name="to"
						placeholder="Destination City" class="form-control" id="dsearch"
						style="height: 50px; margin: 0; padding: 0 20px; vertical-align: middle; background: #fff; border: 3px solid #fff; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: 300; line-height: 50px; color: #888;">
				</div>

				<div class="form-group col-lg-4">
					<label for="depart">Departure Date</label> <input required
						type="date" name="depart" class="form-control" id="form-depart"
						style="height: 50px; margin: 0; padding: 0 20px; vertical-align: middle; background: #fff; border: 3px solid #fff; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: 300; line-height: 50px; color: #888;">
				</div>
			</div>

			<div class="row">
				<div class="form-group col-lg-4">
					<label for="class">Class</label> <select required name="class"
						class="form-control" id="form-class"
						style="height: 50px; margin: 0; padding: 0 20px; vertical-align: middle; background: #fff; border: 3px solid #fff; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: 300; line-height: 50px; color: #888;">
						<option value="Economy"
							style="height: 50px; margin: 0; padding: 0 20px; vertical-align: middle; background: #fff; border: 3px solid #fff; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: 300; line-height: 50px; color: #888;">
							Economy</option>
						<option value="Business"
							style="height: 50px; margin: 0; padding: 0 20px; vertical-align: middle; background: #fff; border: 3px solid #fff; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: 300; line-height: 50px; color: #888;">
							Business</option>
						<option value="First Class"
							style="height: 50px; margin: 0; padding: 0 20px; vertical-align: middle; background: #fff; border: 3px solid #fff; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: 300; line-height: 50px; color: #888;">
							First Class</option>
					</select>
				</div>

				<div class="form-group col-lg-4">
					<label for="people">No. of People</label> <input required
						type="number" min="1" placeholder="Number of People.."
						name="people" class="form-control" id="form-adults">
				</div>

			</div>
			<div style="text-align: center;">
				<button style="margin-top: 5%;" type="submit" style=""
					class="btn btn-primary flex-row-reverse">Search Flights</button>
			</div>
		</form>
	</div>
</body>

</html>


