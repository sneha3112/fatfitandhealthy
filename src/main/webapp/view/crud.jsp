<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/facebook/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css">
  <script src="/facebook/resources/bootstrap-3.3.6-dist/jquery.min.js"></script>
  <script src="/facebook/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid Sans">
  <link rel="stylesheet" href="/facebook/css/profile.css">
  <script src="/facebook/js/crud.js"></script>
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
			<div style="display: none;" id="rootpath">${pageContext.request.contextPath }</div>
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>C_ID</th>
							<th>U_ID</th>
							<th>POST_ID</th>
							<th>C_TEXT</th>
							<th>C_TIME</th>
							<th>U_TIME</th>
							<th>update</th>
							<th>delete</th>
						</tr>
					</thead>
					<tbody class="ajax">
						<div id="ajax">
						<c:forEach items="${comment}" var="comment">
							<tr>
								<td>${comment.CId}</td>
								<td>${comment.user.id}</td>
								<td>${comment.postId}</td>
								<td>${comment.CText}</td>
								<td>${comment.CTime}</td>
								<td>${comment.UTime}</td>
								<td><a href="edit/${comment.CId}"><span class="glyphicon glyphicon-pencil"></span></a></td>
								<td><a href="javascript:;" onclick="d(${comment.CId});"><span class="glyphicon glyphicon-remove"></span></a></td>
							</tr>
						</c:forEach>
						</div>
					</tbody>
				</table>
			</div>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>