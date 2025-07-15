package com.sims;

import javax.servlet.*;
import java.sql.*;

public class InitServlet extends GenericServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/sims?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "password";

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", DB_USER, DB_PASS);
                 Statement stmt = conn.createStatement()) {

                stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS sims");

                try (Connection dbConn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                     Statement dbStmt = dbConn.createStatement()) {

                    String sql = "CREATE TABLE IF NOT EXISTS inventory (" +
                            "id INT AUTO_INCREMENT PRIMARY KEY, " +
                            "name VARCHAR(100) NOT NULL, " +
                            "quantity INT NOT NULL, " +
                            "threshold INT NOT NULL" +
                            ")";
                    dbStmt.executeUpdate(sql);
                    System.out.println("Database and table initialized.");
                }

            }
        } catch (Exception e) {
            throw new ServletException("Failed to initialize DB/table", e);
        }
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) {
        // This servlet is only used for init
    }
}
