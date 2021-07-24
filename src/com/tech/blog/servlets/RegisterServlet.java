package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException{
    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	
//    	out.println("<!Doctype html>");
//    	out.println("<html>");
//    	out.println("<head>");
//    	out.println("<title>Register Servlet</title>");
//    	out.println("</head>");
//    	out.println("<body>");
  	
//    	fetch all form data
    	String check = request.getParameter("check");
    	if(check == null) {
    		out.println("please check terms and conditions");
    	}else {
    		String name = request.getParameter("user_name");
    		String email = request.getParameter("user_email");
    		String password = request.getParameter("user_password");
    		String gender = request.getParameter("gender");
    		String about = request.getParameter("about");
    	
//    		create user object and set all data to that object
    		User user = new User(name,email,password,gender,about);
    		
    		//create a user dao object
    		UserDao dao = new UserDao(ConnectionProvider.getConnection());
    		  if(dao.saveUser(user)) {
    		    out.println("done");
    		  }else {
    			  out.println("error");
    		  }
    		
    	}
    	
    	
//    	out.println("</body>");
//    	out.println("</html>");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

}
