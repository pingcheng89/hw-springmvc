<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊會員</title>
    <link href="<%= request.getContextPath() %>/style/MyStyle.css" rel="stylesheet">
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
            margin-top: 20px;
        }
        
        .custom-btn-register {
            background-color: #BEBEBE;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-4">註冊會員</h2>
        <form:form action="/lotterygame/registerdone" modelAttribute="user" method="post">
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null && !error.isEmpty()) {
            %>
                <div class="alert alert-danger" role="alert">
                    <%= error %>
                </div>
            <% 
                } 
            %>
            <div class="form-group mb-3">
                <form:label path="username" cssClass="form-label">帳號</form:label>
                <form:input path="username" cssClass="form-control" autocomplete="off" required="true"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="password" cssClass="form-label">密碼</form:label>
                <form:password path="password" cssClass="form-control" required="true"/>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn custom-btn-register" value="註冊"/>
            </div>
        </form:form>
        <div class="text-center">
            <a href="login" class="text-decoration-none">已有帳號，請登入</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
