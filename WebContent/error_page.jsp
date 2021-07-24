<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry something went wrong</title>
<!-- Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- css file linked -->
<link href="css/myStyle.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
</head>
<body>
 <div class="container text-center">
   <img src="img/critical.png" class="img-fluid">
   <p class="display-4">Sorry ! something went wrong...</p>
   <%= exception %>
   <br>
   <a href="index.jsp" class="btn bg-primary text-white mt-2">Home</a>
 </div>
</body>
</html>