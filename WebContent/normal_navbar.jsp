<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar Page</title>
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
      
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-id-card"></span>Contact us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span>Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span>SignUp</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
</body>
</html>