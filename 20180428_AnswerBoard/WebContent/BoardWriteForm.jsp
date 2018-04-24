<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
</head>
<style type="text/css">
    table, tr, th, td {
        border: 1px solid blue;
        border-collapse: collapse;
        padding: 10px 10px 10px 10px;
    }
    table {
        margin-left: 10px;
    }
</style>
<body>
<%@ include file = "./Header.jsp" %>
<div id="container">
    <h2>게시글 작성하기</h2>
    <form action="./answerboardCtrl.jsp" method="post">
       <input type="hidden" name="command" value="write">
        <table>
           <col width="100px"><col width="200px">
           <col width="500px"><col width="100px">
            <tr>
                <th>아이디</th>
                <th>제목</th>
                <th>내용</th>
                <th>비밀번호</th>
            </tr>
            <tr>
                <td><input type="text" name="id" required="required"></td>
                <td><input type="text" name="title" required="required"></td>
                <td><textarea cols="50" name="content" rows="5" required="required"></textarea></td>
                <th><input type="password" name="password" maxlength="4" required="required"></th>
            </tr>
        </table>
        <tr>
            <td colspan="4">
                <input type="submit" value="글입력">
                <input type="reset" value="재작성">
            </td>
        </tr>
    </form>
</div>
</body>
</html>