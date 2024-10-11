<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>已成功註冊</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #FFFAF4;
        }
        .container {
            max-width: 400px;
            margin-top: 100px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .text-center a {
            margin-top: 20px;
        }
        .custom-btn-ajax {
            background-color: #A9B7AA;
            color: white;
        }
        .custom-btn-login {
            background-color: #71879E;
            color: white;
        }
        .btn {
            margin: 10px;
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h1 class="mt-4">${user.username} 註冊成功！</h1>
        
        <a href="login" class="btn custom-btn-login">一般登入</a>
        <a href="/lotterygame/loginajax" class="btn custom-btn-ajax">AJAX 登入</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
