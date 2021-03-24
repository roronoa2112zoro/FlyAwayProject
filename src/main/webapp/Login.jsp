<!DOCTYPE html>
<html lang="en">

<head>

<title>Login &amp Register</title>

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
	<h2 style="text-align: center">Login Page</h2>
	<div class="container">
		<form action="ValidateUser" method="post">

			<div class="form-group">
				<label for="name">User Name</label> <input type="email"
					placeholder="abc@domain.com" class="form-control" name="name" />
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" name="password" />
			</div>
			<button type="submit" class="btn btn-primary">Login</button>

		</form>
	</div>

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