<%@ page import="java.util.LinkedList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>樂透選號</title>
    <link href="<%= request.getContextPath() %>/style/mystyle.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lottery</h1>
        <p class="text-center" style="font-size: 14px;">請輸入要跑出的組數及要排除的數字，</p>
        <p class="text-center" style="font-size: 14px;">若沒輸入要排除的數字則預設為沒有要排除的數字跑出結果。</p>
        
        <%-- Error Report --%>
	<% LinkedList<String> errors = (LinkedList<String>) request.getAttribute("errors"); %>
	<% if (errors != null && !errors.isEmpty()) { %>
    <div class="alert alert-danger" role="alert">
        <ul style=" margin-bottom: 0;">
            <% for (String error : errors) { %>
                <li><%= error %></li>
            <% } %>
        </ul>
    </div>
	<% } %>
	<%-- End Error Report --%>
        
        <form action="/lotterygame/lotteryresult" method="post">
            <div class="mb-3">
                <label for="group" class="form-label">組數</label>
                <input type="text" class="form-control" id="group" name="group" value="${param.group}" />
            </div>
            <div class="mb-3">
                <label for="exclude" class="form-label">排除數字</label>
                <input type="text" class="form-control" id="exclude" name="exclude" value="${param.exclude}" />
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-primary" value="開始選號！" />
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
