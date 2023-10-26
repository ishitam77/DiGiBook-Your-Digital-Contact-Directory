package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDao {

	private Connection conn;

	public ContactDao(Connection conn) {
		super();
		this.conn=conn;
	};
	
	// Method to add contacts of user
	public boolean saveContact(Contact c) {
		boolean f=false;
		try {
			String sql="insert into contact(name,email,address,phone,about,userid) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getAddress());
			ps.setString(4, c.getPhone());
			ps.setString(5, c.getAbout());
			ps.setInt(6, c.getUserId());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	// Method to fetch a user contacts by their ID
	public List<Contact> getAllContact(int uId){
		List<Contact> list=new ArrayList<Contact>();
		Contact c=null;
		try {
			String sql="select * from contact where userid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setAddress(rs.getString(4));
				c.setPhone(rs.getString(5));
				c.setAbout(rs.getString(6));
				list.add(c);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// Method to fetch a user contacts by their userID
	public Contact getContactByID(int cid) {
		Contact c=new Contact();
		try {
			String sql="select * from contact where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setAddress(rs.getString(4));
				c.setPhone(rs.getString(5));
				c.setAbout(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	// Method to update a contact by their ID
	public boolean updateContact(Contact c) {
		boolean f=false;
		try {
			String sql="update contact set name=?,email=?,address=?,phone=?,about=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getAddress());
			ps.setString(4, c.getPhone());
			ps.setString(5, c.getAbout());
			ps.setInt(6, c.getId());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	// Method to delete a contact by their ID
	public boolean deleteContactById(int id) {
		boolean f=false;
		try {
			String sql="delete from contact where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	// Method to delete a contacts associated by userID
	 public boolean deleteContactsByUserId(int userId) {
	        boolean success = false;
	        try {
	            String sql = "DELETE FROM contact WHERE userid = ?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, userId);

	            int rowsAffected = ps.executeUpdate();

	            if (rowsAffected >= 0) {
	                success = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return success;
	    }
}