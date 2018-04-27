<%@ page import="java.util.Date" %>
<%@ page import="min.edu.dtos.Answerboard_Dto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
    Answerboard_Dto dto = (Answerboard_Dto)request.getAttribute("dto");
%>
<script type="text/javascript">
    function contentChk(){
        var obj1 = document.getElementById("hidcontent").value;
        var obj2 = document.getElementById("txtArea").value;
        var obj3 = obj2.replace("원본글>","");
        
        if(obj1===obj3){
            document.getElementById("txtArea").value = "";
            document.getElementById("conTxt").innerHTML = "답&nbsp;&nbsp;&nbsp;글: ";
        }
    }
</script>
<body>
<%@ include file = "./Header.jsp" %>
    <form action="answerboardCtrl.jsp" method="post">
       <input type="hidden" name="seq" value="<%=dto.getSEQ()%>">
       <input type="hidden" name="command" value="reply">
        <table>
           <tr>
               <td colspan="2"><a href="./index.jsp"><img src="./image/if_Streamline-18_185038.png" alt="home"></a></td>
           </tr>
            <tr>
                <td>아이디: </td>
                <td><input type="text" name="id" required="required"></td>
            </tr>
            <tr>
                <td>제&nbsp;&nbsp;&nbsp;목: </td>
                <td><input type="text" name="title" required="required"></td>
            </tr>
            <tr>
                <td id="conTxt">내용(원본): </td>
                <td>
                    <input type="hidden" id="hidcontent" value="<%=dto.getCONTENT()%>">
                    <textarea onclick="contentChk()" id="txtArea" name="content" cols="50" rows="5" required="required">원본글&gt;<%=dto.getCONTENT()%></textarea>
                </td>
            </tr>
            <tr>
                <td>날&nbsp;&nbsp;&nbsp;짜: </td>
                <td><%= new SimpleDateFormat("YYYY-MM-dd").format(new Date())%></td>
            </tr>
            <tr>
               <td>비밀번호: </td>
                <td>
                    <input type="password" name="password">
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="전송"></td>
                <td><input type="reset" value="초기화"></td>
            </tr>
        </table>
    </form>
</body>
</html>