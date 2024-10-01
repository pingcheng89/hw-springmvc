<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登入會員</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">登入會員</h2>
        <form:form action="/lotterygame/login2" method="post" modelAttribute="login">
            <div class="mb-3">
                <form:label path="username" cssClass="form-label">帳號</form:label>
                <form:input path="username" cssClass="form-control" placeholder="請輸入帳號" required="true"/>
            </div>
            <div class="mb-3">
                <form:label path="password" cssClass="form-label">密碼</form:label>
                <form:password path="password" cssClass="form-control" placeholder="請輸入密碼" required="true"/>
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-primary" value="登入"/>
            </div>
        </form:form>
        <a href="register">沒有帳號，請註冊</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
