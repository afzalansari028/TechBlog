<%@ page import="com.tech.blog.dao.PostDao"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.entities.Post"%>
<%@ page import="java.util.*" %>

<div class="row">

<%
   PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    
     if(cid == 0){
    	 posts = d.getAllPosts();
     }else{
    	 posts = d.getPostByCatId(cid);
     }
      
     if(posts.size() == 0){
    	 out.println("<h4 class='display-3 text-center'>No Posts in this category</h4>");
     }
     
    for(Post p : posts){
    %>
     <div class="col-md-6 mt-2">
       <div class="card">
        <img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
         <div class="card-body">
          <b><%= p.getpTitle() %></b>  
          <p><%= p.getpContent() %> </p> 
       </div>
       <div class="card-footer text-center bg-primary">
         <a href="show_blog.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
       </div>
      </div>
     </div>
    <%
    }
    %> 
    	
</div>
