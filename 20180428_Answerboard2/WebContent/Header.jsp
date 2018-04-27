<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
<style>
    header {
        background-color: aqua;
        height: 100%;
        text-align: center;
    }
    
    #home {
        position: absolute;
        left: 10px;
        opacity: 1;
        cursor: pointer;
    }
</style>
<script>
    function back(){
        history.back(-1);
    }
</script>
</head>
<body>
    <header>
        <img id="home" src="./image/if_Streamline-18_185038.png" alt="home" onclick="back()">
        <h1>게시판 구현하기</h1>
    </header>
</body>
</html>