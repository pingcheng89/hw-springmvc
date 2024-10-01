<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已成功註冊</title>
<link href="<%= request.getContextPath() %>/style/MyStyle.css" rel="stylesheet"></link>
</head>
<body>
	<h1>${user.username} 註冊成功！</h1>
	<a href="login">去登入</a>
</body>
</html>