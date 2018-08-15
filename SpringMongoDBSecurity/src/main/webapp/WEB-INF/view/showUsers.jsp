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
<title>MongoDB Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="static/css/admin.css" type="text/css"
	title="no title" />
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


	<div class="container text-center" id="tasksDiv">
		<h3>All Users Via Display Tag</h3>
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
		<div>
		<display:table name="people" uid="user" requestURI="/show-users" sort="list" pagesize="7" class="table table-striped table-bordered">
				
				<display:column property="username" />
				<display:column property="firstname" sortName="firstname"
					sortable="true" />
				<display:column property="lastname" />
				<display:column property="age" sortName="dob" sortable="true" />
				<c:if test="${role }">
					<display:column title="Delete">
						<a href="/delete-user?id=${user.id }"
							onclick="return confirmDelete()"><span
							class="glyphicon glyphicon-trash"></span></a>
					</display:column>
					<display:column title="Edit">
						<a href="/find-user?id=${user.id }"><span
							class="glyphicon glyphicon-pencil"></span></a>
					</display:column>
				</c:if>
				<display:setProperty name="paging.banner.placement" value="bottom" />
			</display:table>
		
		</div>
		<br>
		<br>
<%-- 		<h3>All Users</h3>
		<div class="table-responsive">
			
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<!-- <th>Id</th> -->
						<th>UserName</th>
						<th>First Name</th>
						<th>LastName</th>
						<th>Age</th>
						<c:if test="${role }">
							<th>Delete</th>
							<th>Edit</th>
						</c:if>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users }">
						<tr>
							<td>${user.id}</td>
							<td>${user.username}</td>
							<td>${user.firstname}</td>
							<td>${user.lastname}</td>
							<td>${user.age}</td>
							<c:if test="${role }">
								<td><a href="/delete-user?id=${user.id }"
									onclick="return confirmDelete()"><span
										class="glyphicon glyphicon-trash"></span></a></td>
								<td><a href="/find-user?id=${user.id }"><span
										class="glyphicon glyphicon-pencil"></span></a></td>
							</c:if>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> --%>
	</div>

	

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>