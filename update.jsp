<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Inventory Item</title>
    <!-- Google Fonts and Font Awesome for cartoonish appeal -->
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Fredoka', sans-serif;
            background: url('https://www.transparenttextures.com/patterns/cartoon-clouds.png') repeat;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .container {
            max-width: 500px;
            margin: 80px auto;
            padding: 25px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(52, 152, 219, 0.13);
            border: 3px dashed #74b9ff;
            animation: popIn 0.9s cubic-bezier(.23,1.02,.67,1);
        }
        @keyframes popIn {
            0% { transform: scale(0.8); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }
        h2 {
            text-align: center;
            color: #2d3436;
            margin-bottom: 20px;
            font-weight: 600;
            letter-spacing: 1px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 15px;
            font-weight: 600;
            color: #0984e3;
            font-size: 1.08em;
        }
        input[type="text"],
        input[type="number"] {
            padding: 10px;
            margin-top: 5px;
            border: 2px solid #dfe6e9;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.2s;
            background: #f8faff;
        }
        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #74b9ff;
            box-shadow: 0 0 6px #81ecec;
            outline: none;
        }
        button {
            margin-top: 25px;
            padding: 12px;
            font-size: 16px;
            background: linear-gradient(90deg, #00b894 60%, #00cec9 100%);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            box-shadow: 0 2px 8px #00b89422;
            transition: background 0.3s;
        }
        button:hover {
            background: linear-gradient(90deg, #00cec9 60%, #00b894 100%);
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #0984e3;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: color 0.2s;
        }
        .back-link:hover {
            text-decoration: underline;
            color: #00b894;
        }
        .icon {
            margin-right: 7px;
            color: #fdcb6e;
            text-shadow: 0 2px 6px #fdcb6e33;
        }
        @media (max-width: 600px) {
            .container { margin: 40px 6px; padding: 18px 6px; }
        }
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-pencil-alt icon"></i>Update Item Quantity</h2>
    <form method="POST" action="update">
        <label for="id"><i class="fas fa-barcode icon"></i>Item ID</label>
        <input type="text" id="id" name="id" required placeholder="Enter item ID">

        <label for="quantity"><i class="fas fa-boxes icon"></i>New Quantity</label>
        <input type="number" id="quantity" name="quantity" min="0" required placeholder="Enter new quantity">

        <button type="submit"><i class="fas fa-save icon"></i>Update</button>
    </form>
    <a class="back-link" href="inventory.jsp"><i class="fas fa-arrow-left icon"></i>Back to Inventory</a>
</div>

</body>
</html>
