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
            margin-top: 10px;
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
        <h2 class="text-center mb-4">登入會員</h2>
        <h5 class="text-center">一般登入</h5>
        <% String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
        <% } %>

        <form:form action="/lotterygame/login" method="post" modelAttribute="login">
            <div class="mb-3">
                <form:label path="username" cssClass="form-label">帳號</form:label>
                <form:input path="username" cssClass="form-control" placeholder="請輸入帳號" required="true"/>
            </div>
            <div class="mb-3">
                <form:label path="password" cssClass="form-label">密碼</form:label>
                <form:password path="password" cssClass="form-control" placeholder="請輸入密碼" required="true"/>
            </div>
            <div class="text-center">
                <input type="submit" class="btn custom-btn-login" value="登入"/>
                
            </div>
        </form:form>
        <div class="text-center">
            <a href="register" class="text-decoration-none">沒有帳號，請註冊</a>
            <a href="loginajax" class="btn custom-btn-login1 btn-lg">點我去AJAX登入</a>
        </div>
    </div>

   
