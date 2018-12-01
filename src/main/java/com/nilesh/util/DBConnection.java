package com.nilesh.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public DBConnection() {
		
	}
	
	public Connection getDBConnection(String user,String pass){
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/utility",user, pass);
		}catch(Exception e) {
			System.out.println("Exception occured While Creating mysql Connection");
		}
		
		return con;
	}
}
