<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>樂透結果</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #FFFAF4;
        }
        .container {
            max-width: 600px;
            margin-top: 100px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        h1 {
            color: black;
        }
        h2 {
            color: #93939B;
        }
        .table {
            margin-top: 20px;
        }
        .logout-link {
            margin-top: 20px;
            text-align: center;
        }
        .custom-btn-logout {
            background-color: #BEBEBE;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Lottery</h1>
        <h2 class="text-center">選號結果出來了！</h2>
        
        <table class="table table-bordered mt-4">
            <tbody>
                <tr>
                    <td>輸入組數：</td>
                    <td>${lot.group}</td>
                </tr>
                <tr>
                    <td>輸入排除數字：</td>
                    <td>${lot.exclude}</td>
                </tr>
                <tr>
                    <td>樂透號碼：</td>
                    <td>
                        <div style="height: 150px; overflow-y: auto;">
                            <% 
                            ArrayList<LinkedList<Integer>> resultArray = (ArrayList<LinkedList<Integer>>) request.getAttribute("resultArray");
                            if (resultArray != null) {
                                for (List<Integer> list : resultArray) {
                                    String result = " ";
                                    for (Integer num : list) {
                                        result += num + " ,\t";
                                    }
                                    if (result.length() > 0) {
                                        result = result.substring(0, result.length() - 2);
                                    }
                                    out.println(result + "<br>");
                                }
                            }
                            %>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div class="logout-link">
            <a href="index.jsp" class="btn custom-btn-logout">回首頁</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
