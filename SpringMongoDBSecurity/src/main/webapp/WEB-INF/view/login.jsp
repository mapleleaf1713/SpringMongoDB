<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
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
<link rel="stylesheet" href="static/css/admin.css" type="text/css" title="no title" />
</head>
<body>

	<div class="container text-center">
		<h3>User Login Page</h3>
		<hr>
		<form class="form-horizontal" method="POST" action="/login">
			<c:if test="${not empty error }">
				<div class="alert alert-danger">
					<c:out value="${error }"></c:out>
				</div>
			</c:if>
			<c:if test="${not empty success }">
				<div class="alert alert-success">
					<div class="container text-center">
						<c:out value="${success }"></c:out>
					</div>
				</div>
			</c:if>

			<div class="form-group">
				<label class="control-label col-md-3">Username</label>
				<div class="col-md-7">
					<input type="text" class="form-control" id="username"
						name="username" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3">Password</label>
				<div class="col-md-7">
					<input type="password" class="form-control" id="password"
						name="password" />
				</div>
			</div>
			<div class="form-group ">
				<input type="submit" class="btn btn-primary" value="Login" />
			</div>
		</form>

		<div class="form-group ">
			<form id="home" action="/">
				<input type="submit" class="btn btn-primary" value="HOME" />
			</form>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>