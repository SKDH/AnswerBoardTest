<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
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
</head>
<script>
    function formChk(){
        var id = document.getElementById("id");
        var title = document.getElementById("title");
        var content = document.getElementById("content");
        var password = document.getElementById("password");
        // alert(password.value);
        if(id.value == "") {
            id.focus();
            return false;
        } else if(title.value == "") {
            title.focus();
            return false;
        } else if(content.value == "") {
            content.focus();
            return false;
        } else if(password.value == "" || isNaN(password.value)) {
            alert("숫자만 입력해 주세요");
            password.value="";
            password.focus();
            return false;
        }
        content.value.replace("<", "&lt");
        content.value.replace(">", "&gt");
        return true;
    }
</script>
<body>
<%@ include file = "./Header.jsp" %>
<div id="container">
    <h2>게시글 작성하기</h2>
    <form action="./answerboardCtrl.jsp" method="post" onsubmit="return formChk()">
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
                <td><input type="text" id="id" name="id"></td>
                <td><input type="text" id="title" name="title"></td>
                <td><textarea cols="50" id="content" name="content" rows="5"></textarea></td>
                <th><input type="password" id="password" name="password" maxlength="4"></th>
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