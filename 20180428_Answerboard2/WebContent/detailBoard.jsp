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
<script>
    window.onload = function(){
        var obj = document.getElementById("etc");
        obj.style.display = "none";
    }
    
    function viewOption(){
        var obj = document.getElementById("etc");
        obj.style.display = "block";
    }
    
    function deleteCmd(){
        var obj = document.forms[0];
        document.getElementById("pw").value = prompt("비밀번호를 입력해 주세요", "예)1234");
        
        document.getElementById("command").value = "delete";
        obj.submit();
    }
    
    function modifyCmd(){
        var obj = document.forms[0];
        document.getElementById("command").value = "modifyForm";
        obj.submit();
    }
    
    function replyCmd(val){
        location.href = "./answerboardCtrl.jsp?command=replyForm&seqone="+val;
    }
</script>

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
                    <tr>
                        <th colspan="2" style="border-bottom: none">
                            <input type="button" value="추가작업" onclick="viewOption()">
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="etc">
            <form action="answerboardCtrl.jsp" method="post">
              <input type="hidden" id="pw" value=""     name="pw">
              <input type="hidden" id="command" value=""     name="command">
               <input type="hidden" value="<%=dto.getSEQ()%>" name="seq">
                <input type="button" value="삭제" onclick="deleteCmd()">
                <input type="button" value="수정" onclick="modifyCmd()">
                <input type="button" value="답글" onclick="replyCmd(<%=dto.getSEQ()%>)">
            </form>
        </div>
</body>
</html>