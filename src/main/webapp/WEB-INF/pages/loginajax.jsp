<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登入會員</title>
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
            display: block;
            margin-top: 15px;
        }
        .custom-btn-login {
            background-color: #BEBEBE;
            color: white;
        }
        h5 {
            color: #93939B;
        }
        .custom-btn-login1 {
            background-color: #A9B7AA;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <% String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
        <% } %>

        <h2 class="text-center mb-4">登入會員</h2>
        <h5 class="text-center">AJAX登入</h5>
        <form id="loginForm">
            <div class="mb-3">
                <label for="username" class="form-label">帳號</label>
                <input id="username" name="username" type="text" class="form-control" placeholder="請輸入帳號" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">密碼</label>
                <input id="password" name="password" type="password" class="form-control" placeholder="請輸入密碼" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn custom-btn-login">登入</button>
            </div>
        </form>
        <div class="text-center">
            <a href="/lotterygame/register" class="text-decoration-none">沒有帳號，請註冊</a>
            <a href="login" class="btn custom-btn-login1 btn-lg">點我去一般登入</a>
        </div>
        
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault(); // 阻止表單提交、頁面更新

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            // 發送AJAX請求，使用fetch和JSON格式
            fetch('/lotterygame/loginajax', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    username: username,
                    password: password
                })
            })
            .then(response => response.json()) // 解析返回的JSON資料
            .then(data => {
                if (data.success) {
                    window.location.href = '/lotterygame/index.jsp'; // 登入成功，跳轉到首頁
                } else {
                    alert('登入失敗: ' + data.message); // 顯示登入失敗提示
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    </script>
</body>
</html>
