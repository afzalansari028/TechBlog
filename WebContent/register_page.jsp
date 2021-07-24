<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
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
     <!-- navbar -->
     <%@ include file="normal_navbar.jsp" %>

     <main class="primary-background banner-background" style="padding-bottom:80px">
       <div class="container md-6">
         <div class="col-md-6 offset-3 ">
            <div class="card">
              <div class="card-header primary-background text-white text-center p-1">
              <span class="fa fa-user-plus fa-3x"></span>
                <p>Register here</p>
              </div>
              <div class="card-body">
                <form id="reg-form" action="RegisterServlet" method="POST">
                  <div class="form-group">
				    <label for="exampleInputEmail1">User Name</label>
				    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="User Name">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				  </div>
				  
				  <div class="form-group">
				    <label for="gender">Select Gender</label>
				    <br>
				    <input type="radio" name="gender" value="male">Male&nbsp;
				    <input type="radio" name="gender" value="female">Female
				  </div>
				  
				  <div class="form-group">
				    <textarea  name="about" class="form-control" rows="4" placeholder="Enter something about yourself"></textarea>
				  </div>
				  
				  <div class="form-check">
				    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
				    <label  class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
				  </div>
				  <br>
				 <div class="container text-center" id="loader" style="display:none">
				    <span  class="fa fa-refresh fa-spin fa-2x"></span>
				    <h5>Please wait...</h5>
				 </div>
				  <br>
				  <div class="container text-center" id="loader" style="display:none">
				   <span class="fa fa-refresh fa-spin fa-2x"></span>
				   <h5>Please wait...</h5>
				  </div>
				  <button id="submit-btn" type="submit" class="btn btn-success">Submit</button>
				</form>
              </div>
            </div>
         </div>
       </div>
     </main>
  
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	   $(document).ready(function(){
		   console.log("loaded");
		   
		   $("#reg-form").on("submit",function(event){
			  event.preventDefault();
			  
			  let form = new FormData(this);
			  
			  $("#submit-btn").hide();
			  $("#loader").show();
			  
			  //send register servlet
			  $.ajax({
				 url: "RegisterServlet",
				 type: "Post",
				 data: form,
				 success: function (data, textStatus, jqXHR){
					 console.log(data);
					  $("#submit-btn").show();
					  $("#loader").hide();
					  
					  if(data.trim() == "done"){
					  
					  swal("Registered successfully... Welcome to login page")
					  .then((value) => {
					    window.location="login_page.jsp";
					  });
					 }else{
						 swal(data);
					 }
				 },
				 error: function (jqXHR, textStatus, errorThrown){
					 console.log(jqXHR);
					  $("#submit-btn").show();
					  $("#loader").hide();
					  swal("Something went wrong.. tyrp again")
				 },
				 processData: false,
				 contentType: false
			  });
		   });
	   });
	</script>
</body>
</html>