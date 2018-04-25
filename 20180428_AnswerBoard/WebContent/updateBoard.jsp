<%@ page import = "min.edu.dtos.Answerboard_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Answerboard_Dto dto = (Answerboard_Dto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=dto.getTITLE()%></title>
    <style>
        #content{
            width: 720px;
            margin: auto;
        }
        
        table {
            border: 1px solid black;
            margin: auto;
            text-align: center;
        }
        
        th {
            border-bottom: 1px solid black;
        }
    </style>
</head>

<body>
    <%@ include file = "Header.jsp"%>
        <div id="content">
            <table>
                <tbody>
                    <tr>
                        <th colspan="2">제목: <%=dto.getTITLE()%></th>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                    <tr>
                        <td><%=dto.getID()%></td>
                        <td><%=dto.getREGDATE()%></td>
                    </tr>
                    <tr>
                        <th colspan="2">내용</th>
                    </tr>
                    <tr>
                        <td colspan="2"><%=dto.getCONTENT()%></td>
                    </tr>
                </tbody>
            </table>
        </div>
</body>
</html>