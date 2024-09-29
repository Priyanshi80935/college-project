package com.tech.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/airlinesystem";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Priyanshi@2005";
    
	private static Connection connection = null;

	public static Connection getConnection() throws SQLException {
		if(connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		}
		return connection;
	}
}
