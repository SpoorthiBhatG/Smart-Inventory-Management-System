<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Inventory List</title>
    <style>
        /* Cartoonish and colorful style */
        body {
            background: linear-gradient(135deg, #ffd6e8, #a0e9fd);
            font-family: 'Comic Sans MS', cursive, sans-serif;
            color: #333;
            padding: 40px;
            text-align: center;
        }

        h1 {
            color: #ff4c6d;
            font-size: 3em;
            text-shadow: 2px 2px #ffcad4;
            margin-bottom: 30px;
        }

        table {
            margin: 0 auto;
            border-collapse: separate;
            border-spacing: 15px 10px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(255, 76, 109, 0.3);
            animation: fadeIn 1.5s ease forwards;
            width: 80%;
            max-width: 800px;
        }

        th, td {
            padding: 12px 20px;
            font-size: 1.2em;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(160, 233, 253, 0.4);
            transition: transform 0.3s ease;
        }

        th {
            background: #ff4c6d;
            color: white;
            text-transform: uppercase;
            letter-spacing: 2px;
            box-shadow: 0 5px 15px #ff4c6d;
        }

        td {
            background: #a0e9fd;
            color: #0d3b66;
        }

        /* Hover animation on rows */
        tbody tr:hover td {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(255, 76, 109, 0.6);
            cursor: pointer;
            background: #ffb3c6;
            color: #fff;
        }

        /* Zebra stripe for rows */
        tbody tr:nth-child(odd) td {
            background: #b3e5fc;
        }

        /* Animated fade in */
        @keyframes fadeIn {
            0% {opacity: 0; transform: translateY(20px);}
            100% {opacity: 1; transform: translateY(0);}
        }

        /* Responsive */
        @media (max-width: 600px) {
            body {
                padding: 20px;
            }

            table {
                width: 100%;
                border-spacing: 10px 8px;
            }

            th, td {
                font-size: 1em;
                padding: 8px 12px;
            }
        }
    </style>
</head>
<body>
    <h1>Inventory Items</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Threshold</th>
        </tr>
        </thead>
        <tbody>
        <%
            String dbURL = "jdbc:mysql://localhost:3306/sims?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "password";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT id, name, quantity, threshold FROM inventory");

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int threshold = rs.getInt("threshold");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= quantity %></td>
            <td><%= threshold %></td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='4' style='color:red; font-weight:bold;'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
</body>
</html>
