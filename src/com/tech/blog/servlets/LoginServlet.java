package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	public void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException{
    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	
    	out.println("<!Doctype html>");
    	out.println("<html>");
    	out.println("<head>");
    	out.println("<title>Login Servlet</title>");
    	out.println("</head>");
    	out.println("<body>");
    	
//    	fetch user name and password from request
    	String userEmail = request.getParameter("email");
    	String userPassword = request.getParameter("password");
    	
    	UserDao dao = new UserDao(ConnectionProvider.getConnection());
    	User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
    	
    	out.println(u);
    	 if(u == null) {
    		 //login error......
//    		 out.println("Invalid details try again...");
    		 Message msg = new Message("Invalid details try with another","error","alert-danger");
    		 HttpSession s = request.getSession();
    		 s.setAttribute("msg", msg);
    		 
    		 response.sendRedirect("profile.jsp");
    	 }else {
//    		 login success......
    		 HttpSession s = request.getSession();
    		 s.setAttribute("currentUser",u);
    		 response.sendRedirect("profile.jsp");
    	 }
    	
    	out.println("</body>");
    	out.println("</html>");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

}
