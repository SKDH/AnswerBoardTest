<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    <%
        response.setContentType("text/html; charset=UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<%
    String command = request.getParameter("command");
%>
<%
    if(command.equalsIgnoreCase("")){ // 화면에서 null은 존재하지않음
        request.setAttribute("errMsg", "관리자에게 문의하세요");
        request.setAttribute("url", "./index.jsp");
        pageContext.forward("./error.jsp");
    }
%>
<body>
</body>
</html>