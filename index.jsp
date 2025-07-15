<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Inventory Dashboard</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Fredoka', sans-serif;
            background: url('https://www.transparenttextures.com/patterns/cartoon-clouds.png') repeat;
            background-color: #f0f8ff;
            margin: 20px auto;
            max-width: 960px;
            color: #333;
            animation: fadeIn 1s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1.2px;
            animation: bounceIn 1s ease-out;
        }

        @keyframes bounceIn {
            0% { transform: scale(0.5); opacity: 0; }
            60% { transform: scale(1.1); opacity: 1; }
            100% { transform: scale(1); }
        }

        a {
            display: inline-block;
            margin-bottom: 15px;
            background-color: #fd79a8;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 600;
            transition: background-color 0.3s ease;
            animation: slideIn 0.8s ease;
        }

        a:hover {
            background-color: #e84393;
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 18px;
            text-align: left;
        }

        th {
            background-color: #6c5ce7;
            color: #ecf0f1;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.05em;
        }

        tr:nth-child(even) {
            background-color: #f9f9ff;
        }

        tr:hover {
            background-color: #dfe6e9;
        }

        td form {
            margin: 0;
        }

        input[type="number"] {
            width: 60px;
            padding: 6px 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.2s ease;
        }

        input[type="number"]:focus {
            border-color: #6c5ce7;
            outline: none;
        }

        input[type="submit"] {
            background-color: #00b894;
            border: none;
            color: white;
            padding: 7px 15px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-left: 8px;
        }

        input[type="submit"]:hover {
            background-color: #019875;
        }

        .status-icon {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <h1><i class="fas fa-boxes-stacked"></i> Inventory Dashboard</h1>
    <a href="add.jsp"><i class="fas fa-plus-circle"></i> Add New Item</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Qty</th>
                <th>Threshold</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.quantity}</td>
                    <td>${item.threshold}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.quantity lt item.threshold}">
                                <span style="color:#e74c3c; font-weight:700;">
                                    <i class="fas fa-exclamation-triangle status-icon"></i> Restock Needed
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span style="color:#27ae60; font-weight:700;">
                                    <i class="fas fa-check-circle status-icon"></i> OK
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <form action="update" method="post">
                            <input type="hidden" name="id" value="${item.id}" />
                            <input type="number" name="quantity" value="${item.quantity}" min="0" />
                            <input type="submit" value="Update" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
