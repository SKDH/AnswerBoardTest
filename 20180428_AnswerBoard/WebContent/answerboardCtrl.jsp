<%@page import="min.edu.dtos.Answerboard_Dto"%>
<%@page import="java.util.List"%>
<%@page import="min.edu.service.AnswerboardServiceImpl"%>
<%@page import="min.edu.service.IAnswerboardService"%>
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
    IAnswerboardService service = new AnswerboardServiceImpl();
%>
<%
    if(command.equalsIgnoreCase("")){ // 화면에서 null은 존재하지않음
        request.setAttribute("errMsg", "관리자에게 문의하세요");
        request.setAttribute("url", "./index.jsp");
        pageContext.forward("./error.jsp");
    } else if (command.equalsIgnoreCase("list")) { // list -> BoardList
        List<Answerboard_Dto> list = service.selectAll();
        request.setAttribute("lists", list);
        pageContext.forward("./BoardList.jsp");
    } else if(command.equalsIgnoreCase("writeForm")){
        response.sendRedirect("./BoardWriteForm.jsp");
    } else if(command.equalsIgnoreCase("write")) {
        // System.out.println(command);
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String password = request.getParameter("password");
        Answerboard_Dto dto = new Answerboard_Dto();
        dto.setID(id);
        dto.setTITLE(title);
        dto.setCONTENT(content);
        dto.setPASSWORD(Integer.parseInt(password));
        boolean isc = service.insertBoard(dto);
        if(isc) {
            pageContext.forward("./answerboardCtrl.jsp?command=list");
        } else {
            request.setAttribute("errMsg", "게시글을 입력하지 못하였습니다.<br>관리자에게 문의하세요");
            request.setAttribute("url", "./index.jsp");
            pageContext.forward("./error.jsp");
        }
    } else if(command.equalsIgnoreCase("multiDelete")){
        String[] seqs = request.getParameterValues("chk");
        // System.out.println(Arrays.toString(seqs));
        boolean isc = service.deleteBoardMulti(seqs);
        if(isc){
            pageContext.forward("./answerboardCtrl.jsp?command=list");
        } else {
            request.setAttribute("errMsg", "게시글을 삭제하지 못하였습니다.<br>관리자에게 문의하세요");
            request.setAttribute("url", "./index.jsp");
            pageContext.forward("./error.jsp");
        }
    } else if(command.equalsIgnoreCase("detail")) {
        String seq = request.getParameter("seq");
        Answerboard_Dto dto = service.selectOne(seq);
        request.setAttribute("dto", dto);
        pageContext.forward("./detailBoard.jsp");
    } else if(command.equalsIgnoreCase("delete")) {
        String pw = request.getParameter("pw");
        String seq = request.getParameter("seq");

        boolean isc = service.deleteBoardOne(seq);
        if(isc) {
            pageContext.forward("./answerboardCtrl.jsp?command=list");
        } else {
            Answerboard_Dto dto = service.selectOne(seq);
            request.setAttribute("dto", dto);
            pageContext.forward("./detailBoard.jsp");
        }
    } else if(command.equalsIgnoreCase("modifyForm")){
        String seq = request.getParameter("seq");
        Answerboard_Dto dto = service.selectOne(seq);
        request.setAttribute("dto", dto);
        pageContext.forward("updateBoard.jsp");
    } else if(command.equalsIgnoreCase("updateCommit")) {
        String seq = request.getParameter("seq");
        String content = request.getParameter("content");
        String pw = request.getParameter("pw");

        Answerboard_Dto dto = new Answerboard_Dto();
        dto.setSEQ(Integer.parseInt(seq));
        dto.setCONTENT(content);
        dto.setPASSWORD(Integer.parseInt(pw));
        boolean isc = service.updateBoard(dto);
        if(isc) {
            Answerboard_Dto dto1 = service.selectOne(seq);
            request.setAttribute("dto", dto1);
            pageContext.forward("./detailBoard.jsp");
        } else {
            pageContext.forward("./answerboardCtrl.jsp?command=list");
        }
    } else if(command.equalsIgnoreCase("replyForm")) {
        String seq = request.getParameter("seqone");
        Answerboard_Dto dto1 = service.selectOne(seq);
        request.setAttribute("dto", dto1);
        pageContext.forward("./replyForm.jsp");
    } else if(command.equalsIgnoreCase("reply")){
        String seq = request.getParameter("seq");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String password = request.getParameter("password");
        Answerboard_Dto dto = new Answerboard_Dto();
        dto.setSEQ(Integer.parseInt(seq));
        dto.setID(id);
        dto.setTITLE(title);
        dto.setCONTENT(content);
        dto.setPASSWORD(Integer.parseInt(password));
        boolean isc = service.replyBoard(dto);
        response.sendRedirect("./answerboardCtrl.jsp?command=list");
    }
%>
<body>

</body>
</html>