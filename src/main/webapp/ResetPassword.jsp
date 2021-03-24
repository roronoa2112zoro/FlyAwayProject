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

<script>
	function validateform() {
		var newPassword = document.resetPassword.new_password.value;
		var confirmPassword = document.resetPassword.confirm_password.value;

		if (newPassword != confirmPassword) {
			alert("Password do not match");
			return false;
		}
	}
</script>


<body>


	<h2 style="text-align: center">Login Page</h2>
	<div class="container">
		<form name="resetPassword" action="ResetPassword" method="post"
			onsubmit="return validateform()">
			<div class="form-group">
				<label for="password">New Password</label> <input type="password"
					id="new_password" class="form-control" name="new_password" required />
			</div>
			<div class="form-group">
				<label for="password">Confirm Password</label> <input
					type="password" id="confirm_password" class="form-control"
					name="confirm_password" required /> <span id='message'></span>
			</div>
			<button type="submit" class="btn btn-primary">Reset Password</button>

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