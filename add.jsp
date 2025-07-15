<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Inventory Item</title>

    <!-- Google Font & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Fredoka', sans-serif;
            background: url('https://www.transparenttextures.com/patterns/cartographer.png') repeat;
            background-color: #ffecd2;
            margin: 0;
            padding: 20px;
            animation: fadeIn 0.8s ease;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        h2 {
            color: #2d3436;
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .form-container {
            max-width: 440px;
            margin: 0 auto;
            background-color: #fff9f3;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            animation: popIn 0.7s ease;
        }

        @keyframes popIn {
            0% { transform: scale(0.95); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #636e72;
            font-size: 15px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 2px solid #ffeaa7;
            border-radius: 10px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: #fffaf3;
            transition: border 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #fd79a8;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #00b894;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #019875;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #0984e3;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .form-container i {
            margin-right: 6px;
            color: #fd79a8;
        }
    </style>
</head>
<body>

    <h2><i class="fas fa-plus-circle"></i> Add New Inventory Item</h2>

    <div class="form-container">
        <form action="add" method="post">
            <label for="name"><i class="fas fa-tag"></i> Item Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter item name" required />

            <label for="quantity"><i class="fas fa-boxes"></i> Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="0" placeholder="Enter quantity" required />

            <label for="threshold"><i class="fas fa-triangle-exclamation"></i> Threshold:</label>
            <input type="number" id="threshold" name="threshold" min="0" placeholder="Enter threshold" required />

            <input type="submit" value="🎉 Add Item" />
        </form>
        <a class="back-link" href="./"><i class="fas fa-arrow-left"></i> Back to Inventory</a>
    </div>

</body>
</html>
