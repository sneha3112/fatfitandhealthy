<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page isELIgnored="false" %>
<title>Insert title here</title>
<link rel="stylesheet" href="/facebook/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css">
  <script src="/facebook/resources/bootstrap-3.3.6-dist/jquery.min.js"></script>
  <script src="/facebook/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid Sans">
</head>
<body>
	
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Welcome <%=session.getAttribute("uname") %></a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="profile">Your Profile</a></li>
	      <li><a href="#">Manage Profile</a></li>
	      <li class="active"><a href="crud">CRUD</a></li>
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
		<form:form modelAttribute="Comment" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/edit">
			
			<form:input path="CId" type="hidden" class="form-control" />
				
			<div class="form-group">
			<label class="col-sm-2 control-label">UId</label>
				<div class="col-sm-10">
					<form:input path="user.id" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">postId</label>
				<div class="col-sm-10">
					<form:input path="postId" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">CText</label>
				<div class="col-sm-10">
					<form:input path="CText" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">CTime</label>
				<div class="col-sm-10">
					<form:input path="CTime" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">UTime</label>
				<div class="col-sm-10">
					<form:input path="UTime" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default">Update</button>
		</div>
		</div>
		</form:form>
		</div>
		<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>