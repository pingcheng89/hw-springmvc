<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>歡迎來到 Lottery Game</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #FFFAF4;
        }
        .container {
            margin-top: 50px;
            text-align: center;
        }
        .btn {
            margin: 15px;
        }
        .custom-btn-lottery {
            background-color: #71879E;
            color: white;
        }
        .custom-btn-logout {
            background-color: #A9B7AA;
            color: white;
        }
        .custom-btn-register {
            background-color: #BEBEBE;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="display-4">歡迎來到 Lottery Game！</h2>
        <br/>
        <p class="lead">請選擇</p>
        <a href="lottery" class="btn custom-btn-lottery btn-lg">玩樂透遊戲！</a>
        <p class="mt-4">或是</p>
        <a href="logout" class="btn custom-btn-logout btn-lg">登出</a>
        
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>