<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>Main</title>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<h3><%=session.getAttribute("name")%></h3>
<style>
.btn-space {
	margin-left: 50px;
}
</style>
<form>
<br>
<br>
<input type= "button" value = "로그아웃"  id="btn-logout"><input type= "button" value = "회원정보변경 " id="btn-update" class="btn-space"><br><br><br>
<input type= "button" value = "게시판보기" id= "btn-board">
</form>
<script>
$(function () {

	$(document).on('click', '#btn-logout', function () {
		location.href = "/JSPBook/logout.jsp";
	});

	$(document).on('click', '#btn-update', function () {
		location.href = "/JSPBook/update01.jsp?no=<%=session.getAttribute("no")%>";
	});

	$(document).on('click', '#btn-board', function () {
		location.href = "/JSPBook/board.jsp";
	});
	
});
</script>
<%@ include file="tale.jsp" %>