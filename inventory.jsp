<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Items</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
        }

        th, td {
            padding: 14px 20px;
            text-align: left;
        }

        thead {
            background-color: #2980b9;
            color: white;
        }

        tbody tr {
            border-bottom: 1px solid #ccc;
            transition: background-color 0.2s ease-in-out;
        }

        tbody tr:hover {
            background-color: #f4faff;
        }

        .status-active {
            color: green;
            font-weight: bold;
        }

        .status-inactive {
            color: red;
            font-weight: bold;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 0.9em;
            color: #888;
        }

        .delete-button {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            th, td {
                font-size: 0.9em;
                padding: 10px;
            }

            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Inventory Items</h2>

    <%
        String url = "jdbc:mysql://localhost:3306/sims";
        String username = "root";
        String password = "Sp00rthi@27";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();

            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS items (" +
                    "id VARCHAR(10) PRIMARY KEY, " +
                    "name VARCHAR(100), " +
                    "quantity INT, " +
                    "status VARCHAR(10), " +
                    "last_updated DATETIME)");

            ResultSet rs = stmt.executeQuery("SELECT * FROM items");
    %>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Status</th>
            <th>Last Updated</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
                String status = rs.getString("status");
        %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td class="status-<%= status.equals("active") ? "active" : "inactive" %>"><%= status %></td>
            <td><%= rs.getTimestamp("last_updated") %></td>
            <td>
                <form action="delete.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this item?');">
                    <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                    <button type="submit" class="delete-button">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
            rs.close();
            conn.close();
        } catch (Exception e) {
        %>
        <tr>
            <td colspan="6" style="color:red; text-align:center;">Error: <%= e.getMessage() %></td>
        </tr>
        <%
        }
        %>
        </tbody>
    </table>

    <div class="footer">
        &copy; 2025 Simple Inventory System
    </div>
</div>
</body>
</html>
