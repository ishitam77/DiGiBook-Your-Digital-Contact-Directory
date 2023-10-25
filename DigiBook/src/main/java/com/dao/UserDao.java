package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.conn.DbConnect;
import com.entity.User;

public class UserDao {
	
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean userRegister(User u) {
		boolean f=false;
		try {
			String sql="insert into user(name,email,password) values(?,?,?) ";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User loginUser(String e,String p) {
		User user=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				user=new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
		}catch(Exception ee) {
			ee.printStackTrace();
		}
		return user;
	}
	
	 public boolean updateUser(User user) {
	        boolean f = false;
	        try {
	            String sql = "update user set name=?, email=?, password=? where id=?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, user.getName());
	            ps.setString(2, user.getEmail());
	            ps.setString(3, user.getPassword());
	            ps.setInt(4, user.getId());

	            int i=ps.executeUpdate();
				
				if(i==1) {
					f=true;
				}

			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
	    }

}
