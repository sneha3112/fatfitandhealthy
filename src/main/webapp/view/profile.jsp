<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page isELIgnored="false" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/facebook/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css">
  <script src="/facebook/resources/bootstrap-3.3.6-dist/jquery.min.js"></script>
  <script src="/facebook/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid Sans">
  <link rel="stylesheet" href="/facebook/css/profile.css">
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Welcome <%=session.getAttribute("uname") %></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="profile">Your Profile</a></li>
      <li><a href="#">Manage Profile</a></li>
      <li><a href="crud">CRUD</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>LogOut</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-remove"></span> Delete Account</a></li>
    </ul>
  </div>
</nav>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			
			<img src="image/${user.image}" class="img-thumbnail" alt="Cinque Terre" width="150" height="150">
			<div style="disolay:block; float:center;">
			<h3><b>Email:</b>${user.email}
			<br><b>Firstname:</b>${user.firstname}</h3>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>