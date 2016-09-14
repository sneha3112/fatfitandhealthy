<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<div class="container-fluid">
	<div class="row">
		
	</div>
	<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
	<%-- <%=request.getAttribute("error") %> --%>
	
	<%if(request.getAttribute("error").equals("1")){ %>
		<div class="alert alert-warning">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Username or password is incorrect.</strong>
		</div>
	<%} %>
	<%if(request.getAttribute("error").equals("mustlogin")){ %>
		<div class="alert alert-warning">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>You must logged in</strong>
		</div>
	<%} %>
	<%-- <c:out value="${error}"></c:out>
	<c:set var="e" value="${error}" ></c:set>
	<c:if test="${e==1}">
		<div class="alert alert-warning">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Username or password is incorrect.</strong>
		</div>
	</c:if> --%>
	<!-- uparni method thi pan model attribute access thay 6 -->
	 <form method="post" action="login">
  		<div class="form-group">
    		<label>Email address:</label>
    		<input type="email" class="form-control" name="email">
  		</div>
  		<div class="form-group">
    		<label>Password:</label>
    		<input type="password" class="form-control" name="password">
  		</div>
  		<div class="checkbox">
    		<label><input type="checkbox"> Remember me</label>
  		</div>
  		<p>Not Registered? Register <a href="signup">Here</a></p>
  		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	</div>
	<div class="col-sm-2"></div>
	</div>
	</div>
</body>
</html>