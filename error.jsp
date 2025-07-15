<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Fredoka+One|Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            background: #f6f8fc;
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }
        .container {
            max-width: 420px;
            margin: 80px auto;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(60,72,88,0.12);
            padding: 40px 30px 30px 30px;
            text-align: center;
            animation: floatIn 1s cubic-bezier(.23,1.02,.67,1) both;
        }
        @keyframes floatIn {
            0% { opacity: 0; transform: translateY(40px) scale(0.95);}
            100% { opacity: 1; transform: translateY(0) scale(1);}
        }
        /* Cartoon Robot */
        .robot {
            margin: 0 auto 18px auto;
            width: 120px;
            height: 120px;
            position: relative;
        }
        .robot-head {
            background: #f9d949;
            border: 4px solid #222;
            width: 100px;
            height: 70px;
            border-radius: 50px 50px 40px 40px/50px 50px 60px 60px;
            position: absolute;
            left: 10px;
            top: 30px;
            z-index: 2;
        }
        .robot-eye {
            width: 16px;
            height: 16px;
            background: #fff;
            border: 3px solid #222;
            border-radius: 50%;
            position: absolute;
            top: 48px;
            left: 28px;
            box-shadow: 30px 0 #fff, 30px 0 0 3px #222;
            z-index: 3;
            animation: blink 3s infinite;
        }
        @keyframes blink {
            0%, 92%, 100% { height: 16px; }
            95% { height: 2px; }
        }
        .robot-mouth {
            width: 32px;
            height: 8px;
            background: #fff;
            border: 2px solid #222;
            border-radius: 0 0 16px 16px;
            position: absolute;
            top: 78px;
            left: 34px;
            z-index: 4;
        }
        .robot-antenna {
            width: 6px;
            height: 32px;
            background: #222;
            position: absolute;
            left: 57px;
            top: 0;
            border-radius: 3px;
            z-index: 1;
            transform-origin: bottom center;
            animation: swing 2s infinite ease-in-out;
        }
        @keyframes swing {
            0%, 100% { transform: rotate(-10deg);}
            50% { transform: rotate(15deg);}
        }
        .robot-antenna-ball {
            width: 18px;
            height: 18px;
            background: #f15b6c;
            border: 3px solid #222;
            border-radius: 50%;
            position: absolute;
            left: 48px;
            top: -15px;
            z-index: 2;
        }
        h2 {
            color: #f15b6c;
            font-family: 'Fredoka One', cursive;
            font-size: 1.6em;
            margin-bottom: 8px;
            font-weight: 700;
            letter-spacing: 1px;
        }
        .error-message {
            background: #ffeaea;
            color: #c0392b;
            border-left: 5px solid #e74c3c;
            padding: 14px;
            margin: 20px 0 10px 0;
            border-radius: 5px;
            font-size: 1em;
            word-break: break-all;
            animation: popIn 0.7s 0.5s backwards;
        }
        @keyframes popIn {
            0% { opacity: 0; transform: scale(0.7);}
            100% { opacity: 1; transform: scale(1);}
        }
        .tip {
            margin-top: 30px;
            color: #888;
            font-size: 0.98em;
        }
        .tip a {
            color: #3498db;
            text-decoration: none;
            transition: color 0.2s;
            font-weight: 500;
        }
        .tip a:hover {
            color: #217dbb;
            text-decoration: underline;
        }
        @media (max-width: 600px) {
            .container { padding: 24px 6px; margin: 40px 6px; }
            .robot { width: 90px; height: 90px;}
            .robot-head { width: 70px; height: 50px; left: 10px; top: 20px;}
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="robot">
            <div class="robot-antenna"></div>
            <div class="robot-antenna-ball"></div>
            <div class="robot-head"></div>
            <div class="robot-eye"></div>
            <div class="robot-mouth"></div>
        </div>
        <h2>Go check your mysql terminal.</h2>
        
        <div class="tip">
            &larr; <a href="javascript:history.back();">Go Back</a>
        </div>
    </div>
</body>
</html>
