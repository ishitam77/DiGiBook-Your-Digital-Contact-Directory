package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
	
	private static Connection conn;
	
	public static Connection getConn() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/digibook","root","Root@123");
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return conn;
	}

}
