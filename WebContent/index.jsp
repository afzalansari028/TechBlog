<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider"%>


<!DOCTYPE html>
<html>  
<head>
<meta charset="ISO-8859-1">
<title>TechBlog</title>
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
	<style>
	  .banner-background{
	   clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 86%, 75% 93%, 51% 93%, 23% 93%, 0 85%, 0% 35%, 0 0);   
	  }
	</style>
</head>
<body>
	<!--  navbar-->
	<%@ include file="normal_navbar.jsp"%>

	<!-- Banner -->
	<div class="container-fluidm-0 p-0 banner-background">
		<div class="jumbotron bg bg-success">
			<div class="container text-white">
				<h2 class="display-3">Welcome to Technical blog</h2>
				<p>Programming is the process of creating a set of instructions
					that tell a computer how to perform a task. Programming can be done
					using a variety of computer programming languages, such as
					JavaScript, Python, and Java.</p>
				<p>Computer programming is important today because so much of
					our world is automated. Humans need to be able to control the
					interaction between people and machines. Since computers and
					machines are able to do things so efficiently and accurately</p>
			    
			    <button class="btn btn-outline-light"><span class="fa fa-smile-o"></span>Start its free</button>&nbsp;		
			    <a href="login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span>Login</a>		
			</div>
		</div>

	</div>
	<br>

     <!-- cards -->
     <div class="container">
       <div class="row">
          <div class="col-md-4">
            <div class="card">
               <div class="card-body">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary text-white primary-background">Read more</a>
				  </div>
				</div>            
               </div>
            </div>
          <div class="col-md-4">
            <div class="card">
               <div class="card-body">
				  <div class="card-body">
				    <h5 class="card-title">Python Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary text-white primary-background">Read more</a>
				  </div>
				</div>            
               </div>
            </div>
          <div class="col-md-4">
            <div class="card">
               <div class="card-body">
				  <div class="card-body">
				    <h5 class="card-title">JS Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary text-white primary-background">Read more</a>
				  </div>
				</div>            
               </div>
            </div>
          </div>
          <br>
       <div class="row">
          <div class="col-md-4">
            <div class="card">
               <div class="card-body">
				  <div class="card-body">
				    <h5 class="card-title">C Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary text-white primary-background">Read more</a>
				  </div>
				</div>            
               </div>
            </div>
          <div class="col-md-4">
            <div class="card">
               <div class="card-body">
				  <div class="card-body">
				    <h5 class="card-title">C++ Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary text-white primary-background">Read more</a>
				  </div>
				</div>            
               </div>
            </div>
          <div class="col-md-4">
            <div class="card">
               <div class="card-body">
				  <div class="card-body">
				    <h5 class="card-title">Kotlin Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary text-white primary-background">Read more</a>
				  </div>
				</div>            
               </div>
            </div>
            
           <br>
	<!-- javaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

	<script>
		
	</script>
</body>
</html>