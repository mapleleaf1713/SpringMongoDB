<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>MongoDB Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="static/css/admin.css" type="text/css" title="no title" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="static/css/main.css"/>
<script type='text/javascript'>
	function confirmDelete() {
		return confirm("Are you sure you want to delete this person?");
	}
</script>
</head>
<body>


<br>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">HOMEPAGE</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/signin">Sign In</a></li>
					<li><a href="/register">New Registration</a></li>
					<li><a href="/show-users">All Users</a></li>
					<li><a href="/signout">Sign Out</a></li>
				</ul>
			</div>
		</div>
	</div>	
	</nav>
	<br>

	<c:choose>
		<c:when test="${mode=='MODE_HOME' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome to Spring User Database</h1>
					<h3>This is the User Database Home Page</h3>
					<h4><c:out value="${message }"></c:out></h4>
				</div>
			</div>
					</c:when>

				<c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>Please Enter your Username And Password</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="login-user">
					<c:if test="${not empty error }">
						<div class="alert alert-danger">
							<c:out value="${error }"></c:out>
						</div>
					</c:if>
					<c:if test="${not empty userlogin }">
						<div class="alert alert-success">
							<div class="container text-center">
								<c:out value="${userlogin }"></c:out>
							</div>
						</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
				</form>
			</div>
		</c:when>

		

	</c:choose>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>