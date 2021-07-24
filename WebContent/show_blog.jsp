<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ page import="com.tech.blog.entities.User" %>
  <%@ page import="com.tech.blog.entities.Post" %>
  <%@ page import="com.tech.blog.entities.Category" %>
  <%@ page import="com.tech.blog.dao.PostDao" %>
  <%@ page import="com.tech.blog.helper.ConnectionProvider" %>
  <%@ page import="java.util.*" %>
  <%@ page errorPage="error_page.jsp" %>
 
 <%
       User user = (User)session.getAttribute("currentUser");
       if(user == null){
    	   response.sendRedirect("login_page.jsp");
       }
    %>
     
  <%
      int postId = Integer.parseInt(request.getParameter("post_id"));
      PostDao d = new PostDao(ConnectionProvider.getConnection());
      
      Post p = d.getPostByPostId(postId);
  %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getpTitle() %></title>
<!-- Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- css file linked -->
<link href="css/myStyle.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
    body{
    background-color:#e8faf2;
    }
    
    .post-title{
      font-weight:100;
      font-size:30px;
    }
    .post-content{
      font-weight:100;
      font-size:25px;
    }
</style>
</head>
<body>
      <!--Navbar  -->
  <nav class="navbar navbar-expand-lg navbar-dark text-light primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-desktop">&nbsp;</span>TechBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fas fa-chalkboard-teacher">&nbsp;</span>Let's learnCoding <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-id-card"></span>Contact us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-share"></span>Do Post</a>
      </li>
    </ul>
   
    <ul class="navbar-nav mr-right">
       <li class="nav-item">
         <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
        </li>
      <li class="nav-item">
         <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
        </li>
    </ul>
    
  </div>
</nav>
<!-- navbar ends -->

    <!--main content of body starts  -->
    <div class="container mt-3">
      <div class="row">
        <div class="col-md-6 offset-3">
           
            <div class="card">
            
               <div class="card-header primary-background text-light">
                <h4 class="post-title"><%=p.getpTitle()%></h4>
               </div>
               <div class="card-body">
                 <img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
                <p class="post-content"><%=p.getpContent()%></p>
                <br>
                <br>
                 <div class="post-code">
                   <pre><%=p.getpCode() %></pre>
                 </div>
               </div>
               <div class="card-footer primary-background text-center p-3">
               
               </div>
               
            </div>
        </div>
      </div>
    </div>
    <!--main content of body ends  -->

 <!--profile modal starts here -->
<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-success text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel ">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
          <img src="pics/<%= user.getProfile() %>" class="img-fluid mt-3" style="border-radius:50%;max-width:125px">
          <h5 class="modal-title text-center" id="exampleModalLabel "><%= user.getName() %></h5>
            <!-- details.... -->
             <div id="profile-details">
              <table class="table mt-2">
				  <tbody>
				    <tr>
				      <th scope="row">ID:</th>
				      <td><%=user.getId() %></td>			      
				    </tr>
				    <tr>
				      <th scope="row">Email:</th>
				      <td><%= user.getEmail()%></td>				      				      
				    </tr>
				    <tr>
				      <th scope="row">Gender:</th>
				      <td><%= user.getGender() %></td>				     
				    </tr>
				    <tr>
				      <th scope="row">Status:</th>
				      <td><%= user.getAbout() %></td>				     
				    </tr>
				    <tr>
				      <th scope="row">Registered on:</th>
				      <td><%= user.getDateTime().toLocaleString() %></td>				     
				    </tr>
				  </tbody>
				</table>
              </div>
              
             <!--     profile edit -->
               <div id="profile-edit"style="display:none">
                  <h4 class="mt-2">Please Edit Carefully</h4>
                    <form action="EditServlet" method="post" enctype="multipart/form-data">
                      <table class="table text-left">
                         <tr>
                            <td>ID:</td>
                            <td><%=user.getId() %></td>                            
                         </tr>
                         <tr>
                            <td>Name:</td>
                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"/></td>                           
                         </tr>
                         <tr>
                            <td>Email:</td>
                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"/></td>                           
                         </tr>
                         <tr>
                            <td>Password:</td>
                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"/></td>                           
                         </tr>                
                         <tr>
                            <td>Gender:</td>
                            <td><%=user.getGender() %></td>                            
                         </tr>
                         <tr>
                            <td>About:</td>
                            <td>
                              <textarea rows="3" class="form-control" name="user_about">
                                <%= user.getAbout() %>
                              </textarea>
                            </td>                            
                         </tr>
                         <tr>
                            <td>NewProfile:</td>
                            <td><input type="file" name="image" class="form-control"/></td>                            
                         </tr>
                      </table>
                      <div class="container">
                        <button type="submit" class="btn btn-outline-success">Save</button>
                      </div>
                    </form>
               </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-success">Edit</button>
      </div>
    </div>
  </div>
</div>
    <!--profile modal ends here -->
    
                 <!--  add post modal -->

		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        
		          <form id="add-post-form" action="AddPostServlet" method="post">
		          
		              <div class="form-group">
		                <select class="form-control" name="cid">
		                  <option selected disabled>---Select Category---</option>
		                  
		                  <%
		                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
		                     ArrayList<Category> list = postd.getAllCategories();
		                     for(Category c : list)
		                      {
		                    %>
			                  <option value="<%=c.getCid()%>"><%= c.getName() %></option>
			                  
		                    <%
		                      }
		                    %> 
		                 
		                </select>
		              </div>
		            
		             <div class="form-group">
		               <input name="pTitle" type="text"placeholder="Enter post Title" class="form-control"/>
		             </div>
		             <div class="form-group">
		               <textarea name="pContent" placeholder="Enter your content" class="form-control" style="height:200px"></textarea>
		             </div>
		             <div class="form-group">
		               <textarea name="pCode" placeholder="Enter your code(if any)" class="form-control" style="height:200px"></textarea>
		             </div>
		             <div class="form-group">
		               <label>Select the picture :</label>
		               <br>
		               <input type="file" name="pic"/>
		             </div>
		             <div class="container text-center">
		               <button type="submit" class="btn btn-outline-success">Post</button>
		             </div>
		          </form>
		        
		      </div>
		    </div>
		  </div>
		</div>

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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
  
    <script>
      $(document).ready(function(){
    	  let editStatus = false;
    	$("#edit-profile-button").click(function(){
    		
    		if(editStatus == false){
    		  $("#profile-details").hide();
    		  $("#profile-edit").show();
    		  editStatus = true;
    		  $(this).text("Back");
    		}
    		else{
    		  $("#profile-details").show();
        	  $("#profile-edit").hide();
        	  editStatus = false;
        	  $(this).text("Edit");
    		}
    	});
      });
    </script>
    
    <!--Add post JS  -->
    <script>
      $(document).ready(function(e){
    	 
    	  $("#add-post-form").on("submit",function(event){
    		  //this code gets called when form is submitted
    		  event.preventDefault();
    		  console.log("clicked on submit")
    		  
    		  let form = new FormData(this);
    		  
    		  //now requesting to server
    		  $.ajax({
    			 url: "AddPostServlet",
    			 type: 'POST',
    			 data: form,
    			 success: function (data, textStatus, jqXHR){
    				console.log(data); 
    				if(data.trim() == "done"){
    				   swal("Good job!", "saved successfully", "success");
    				}else{
    					swal("Error!!", "Something went wrong try again...", "error");
    				}
    			 },
    			 error: function (jqXHR, textStatus, errorThrown){
    				 //error
    				 swal("Error!!", "Something went wrong try again...", "error");
    			 },
    			 processData: false,
    			 contentType: false
    		  });
    	  });
      });
    </script>
    
</body>
</html>