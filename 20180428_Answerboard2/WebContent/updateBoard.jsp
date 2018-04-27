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
        <form action="answerboardCtrl.jsp" method="post">
           <input type="hidden" name="command" value="updateCommit">
           <input type="hidden" name="seq" value="<%=dto.getSEQ()%>">
            <table>
                <tbody>
                    <tr>
                        <th colspan="2">제목: <%=dto.getTITLE()%></th>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <th>비밀번호</th>
                    </tr>
                    <tr>
                        <td><%=dto.getID()%></td>
                        <td><input type="text" name="pw" maxlength="4"></td>
                    </tr>
                    <tr>
                        <th colspan="2">내용</th>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea cols="50" rows="5" name="content"><%=dto.getCONTENT()%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2" style="border-bottom: none;"><input type="submit" value="수정"></th>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>