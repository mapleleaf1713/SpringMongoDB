<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>MongoDB Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type='text/javascript'>
	function confirmDelete() {
		return confirm("Are you sure you want to delete this person?");
	}
</script>
</head>
<body>
	<div role="navigation">
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

	
			<div class="container text-center">
				<h3>Update User</h3>
				<hr>
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
				<form class="form-horizontal" method="POST" action="update-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Age </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${user.age }" />
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
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>