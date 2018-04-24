<%@page import="min.edu.dtos.Answerboard_Dto"%>
<%@page import="java.util.List"%>
<%@page import="min.edu.comm.DataBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>전체글 보기</title>
    <style type="text/css">
        table, tr, th, td {
            border: 2px solid black;
            margin-top: 30px;
            border-collapse: collapse;
        }
    </style>
</head>
<script type="text/javascript">
    function newWriteForm() {
        // alert('작동');
        location.href = "./answerboardCtrl.jsp?command=writeForm";
    }
    
    function allCheck(val){
        // var obj = prompt("힘을내요 어떻게?", "예)자바의 세계로");
        // console.log(obj);
        var obj = document.getElementsByName("chk");
        // alert(val);
        for(var i = 0; i < obj.length; i++) {
            obj[i].checked = val;
        }
    }
    
    function checkForm(){
        var obj = document.getElementsByName("chk");
        var cnt = 0;
        for(var i = 0; i < obj.length; i++){
            if(obj[i].checked == true){
                cnt++;
            }
        }
        if(cnt > 0) {
            return true;
        } else {
            alert("최소 한개 이상은 체크해 주세요");
            return false;
        }
    }
</script>
<%!
public String dateChange(String date){
    String str = "";
    // SimpleDateFormat simple = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
    // simple.format(date); // date타입으로 입력시 변경 사용가능
    str = date.substring(0, date.indexOf(" "));
    return str;
}

public String picArrow(int depth){
    String str = "";
    String empty = "&nbsp;&nbsp;&nbsp;&nbsp;";
    String image = "<img alt=\"답글\" src=\"./image/if_down_right_308966.png\">";
    for(int i = 0; i < depth; i++) {
        str += empty;
    }
    return (depth > 0) ? str + image : str;
}
%>
<%
Object obj = request.getAttribute("lists");
List<Answerboard_Dto> lists = (List<Answerboard_Dto>)obj;
%>
<body>
<%@ include file = "./Header.jsp"%>
    <form action="./answerboardCtrl.jsp" method="post" onsubmit="return checkForm()">
        <input type="hidden" name="command" value="multiDelete">
        <table>
            <col width="100px">
            <col width="100px">
            <col width="100px">
            <col width="100px">
            <col width="100px">
            <col width="100px">
            <tr>
                <th><input type="checkbox" onclick="allCheck(this.checked)"></th>
                <th>SEQ</th>
                <th>아이디</th>
                <th>제목</th>
                <th>REF</th>
                <th>STEP</th>
                <th>DEPT</th>
                <th>READCOUNT</th>
                <th>REGDATE</th>
            </tr>
            <%
            if(lists.size()==0){
            %>
            <tr>
                <td colspan="9">작성된 글이 없습니다</td>
            </tr>
            <%
            } else {
                for(Answerboard_Dto dto : lists){
            %>
            <tr>
                <th><input type="checkbox" name="chk" value="<%= dto.getSEQ() %>"></th>
                <th>
                    <%= dto.getSEQ() %>
                </th>
                <th>
                    <%=dto.getID()%>
                </th>
                <th style="text-align:left">
                    <%=picArrow(dto.getDEPTH())%><%=dto.getTITLE()%>
                </th>
                <th>
                    <%=dto.getREF()%>
                </th>
                <th>
                    <%=dto.getSTEP()%>
                </th>
                <th>
                    <%=dto.getDEPTH()%>
                </th>
                <th>
                    <%=dto.getREADCOUNT()%>
                </th>
                <th>
                    <%=dateChange(dto.getREGDATE())%>
                </th>
            </tr>
            <%
                }
            }
            %>
        </table>
        <div>
            <input type="submit" value="다중삭제">
        </div>
    </form>
    <div>
        <input type="button" value="새글작성" onclick="newWriteForm()">
    </div>
</body>
</html>