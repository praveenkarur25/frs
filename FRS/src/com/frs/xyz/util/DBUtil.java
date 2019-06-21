package com.frs.xyz.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;



public class DBUtil {
	
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@10.209.61.33:1521:orcl","team7","team7");
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		return connection;
		
	}
	
	public static void close(Connection connection, Statement statement, ResultSet rs) {
		try {
			if(connection != null) {
				connection.close();
			}
			if(statement != null) {
				statement.close();
			}
			if(rs != null) {
				rs.close();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
