<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>spring Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container text-center">
		<h3>Would You Like Sign Out</h3>
		<hr>
		<div class="form-group ">
			<form id="logoutForm" method="POST" action="/logout">
				<input type="submit" class="btn btn-primary" value="LOGOUT" />
			</form>
		</div>

		<div class="form-group ">
			<form id="home" action="/">
				<input type="submit" class="btn btn-primary" value="HOME" />
			</form>
		</div>
		<!-- <div>
					<a onclick="document.forms['logoutForm'].submit()"><h4>SignOut</h4></a>
				</div>
				<div>
					<form id="logoutForm" method="POST" action="/logout"></form>
				</div> -->
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>