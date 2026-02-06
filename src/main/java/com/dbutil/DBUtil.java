package com.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	private static String url = "jdbc:mysql://localhost:3306/studentmanagement";
	private static String user = "root";
	private static String password = "Teja@2004";
	
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(url, user, password);
			
		}catch (Exception e) {
			e.printStackTrace();// prints where and why the error happened
		}
		
		return null;
		
	}
	
}
