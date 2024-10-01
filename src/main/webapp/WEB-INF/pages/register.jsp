<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>註冊會員</title>
    <link href="<%= request.getContextPath() %>/style/MyStyle.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-4">註冊會員</h2>
        <form:form action="/lotterygame/registerdone" modelAttribute="user" method="post">
        <tr>
    		<td>
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div class="alert alert-danger">
                <%= error %>
            </div>
        <% 
            } 
        %>
    		</td>
		</tr>
			<div class="form-group">
                <form:label path="username" cssClass="form-label">帳號</form:label>
                <form:input path="username" cssClass="form-control" autocomplete="off"/>
            </div>
            <div class="form-group">
                <form:label path="password" cssClass="form-label">密碼</form:label>
                <form:password path="password" cssClass="form-control"/>
            </div>
            <br/>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="新增"/>
            </div>
        </form:form>
        <a href="login">已有帳號，請登入</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
