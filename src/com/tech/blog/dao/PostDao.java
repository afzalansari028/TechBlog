package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {

	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<Category>();
		
		try {
			String q = "select * from categories";
			Statement st = con.createStatement();
			ResultSet set = st.executeQuery(q);
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				
				Category c = new Category(cid,name,description);
				list.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
	
	public boolean savePost(Post p) {
		boolean f = false;
		try {
			String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, p.getpTitle());
				pstmt.setString(2, p.getpContent());
				pstmt.setString(3, p.getpCode());
				pstmt.setString(4, p.getpPic());
				pstmt.setInt(5, p.getCatId());
				pstmt.setInt(6, p.getUserId());
				
			  pstmt.executeUpdate();
			  f = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
//	get all the post
	public List<Post> getAllPosts(){

		List<Post> list = new ArrayList<>();
        //fetch all the post	
		try {
			String query = "select * from posts order by pid desc";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) { 
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");				
				int catId = set.getInt("catId"); 
				int userId = set.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				
				list.add(post);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;		
	}
	
	public List<Post> getPostByCatId(int catId){
		// fetch all post by id
		List<Post> list = new ArrayList<>();
		try {
			String query = "select * from posts where catId = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, catId);
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) { 
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");				
				int userId = set.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				
				list.add(post);
			  }	
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	public Post getPostByPostId(int postId) {
		Post post = null;
		try {
		String q = "select * from posts where pid=?";
		PreparedStatement pstmt = con.prepareStatement(q);
		pstmt.setInt(1,postId);
		
		ResultSet set = pstmt.executeQuery();
		if(set.next()) {
			int pid = set.getInt("pid");
			String pTitle = set.getString("pTitle");
			String pContent = set.getString("pContent");
			String pCode = set.getString("pCode");
			String pPic = set.getString("pPic");
			Timestamp date = set.getTimestamp("pDate");	
			int cid = set.getInt("catId");
			int userId = set.getInt("userId");
			
			 post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
			
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	  return post;
	}
	
}
