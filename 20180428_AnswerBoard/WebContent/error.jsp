<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지 입니다.</title>
</head>
<%
    String errMsg = (String)request.getAttribute("errMsg");
    String url = (String)request.getAttribute("url");
%>
<body>
    <div>
        <img src="./image/error-prod.png">
        <h1><%=errMsg%></h1>
        <h1><a href="<%=url%>">처음페이지 이동하기</a></h1>
    </div>
</body>
</html>