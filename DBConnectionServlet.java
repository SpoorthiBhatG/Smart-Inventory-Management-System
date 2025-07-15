package com.sims;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test-db")
public class DBConnectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "jdbc:mysql://localhost:3306/sims";
        String username = "root";
        String password = "Sp00rthi@27";

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                out.println("<h2>Connected to database successfully!</h2>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("<h2>Database connection failed!</h2>");
            out.println("<pre>" + e.getMessage() + "</pre>");
        }
    }
}
