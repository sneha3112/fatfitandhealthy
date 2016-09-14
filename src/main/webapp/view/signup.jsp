<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/facebook/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css">
  <script src="/facebook/resources/bootstrap-3.3.6-dist/jquery.min.js"></script>
  <script src="/facebook/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid Sans">
  
</head>
<body>
	<div class="container-fluid">
		<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<form method="post" action="signup" class="form-horizontal" enctype="multipart/form-data" role="form">
  		<div class="form-group">
    		<label class="control-label col-sm-2">Email address:</label>
    		<div class="col-sm-10">
    			<input type="email" class="form-control col-sm-8" name="email" id="email">
    		</div>
  		</div>
  		<div class="form-group">
    		<label class="control-label col-sm-2">Password:</label>
    		<div class="col-sm-10">
    			<input type="password" class="form-control" name="password" id="password">
    		</div>
  		</div>
  		<div class="form-group">
    		<label class="control-label col-sm-2">Confirm Password:</label>
    		<div class="col-sm-10">
    			<input type="password" class="form-control" name="confirmpassword">
    		</div>
  		</div>
  		<div class="form-group">
    		<label class="control-label col-sm-2">First Name:</label>
    		<div class="col-sm-10">
    			<input type="text" class="form-control col-sm-10" name="firstname">
    		</div>
  		</div>
  		<div class="form-group">
    		<label class="control-label col-sm-2">image:</label>
    		<div class="col-sm-3">
      			<input type="file" class="form-control text-input file" name="file" size="60">
    		</div>
    	</div>
    	<input type="hidden" name="image" value="" class="image">
  		<div class="form-group"> 
    		<div class="col-sm-offset-2 col-sm-10">
      			<button type="submit" class="btn btn-default">Signup</button>
    		</div>
  		</div>
	</form>
	</div>
	<div class="col-sm-2"></div>
	</div>
	</div>
</body>
<script>
  $(document).ready(function(){
		$("#email").val("");
		$("#password").val("");
		$(".file").change(function(){
				var filename=$(this).val();
				alert(filename);
				$(".image").val(filename);
			});
	  });
  </script>
</html>