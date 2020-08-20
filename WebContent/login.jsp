<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title> 로그인 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h3>로그인</h3>
	<form action = "login_process.jsp" method="post">
		<p> 아이디 : <input type="text" name="id"></p>
		<p> 비밀번호: <input type="password" name="pw"></p>
		<p> <input type="submit" value="로그인">  <input type="button" value="회원가입" id="btn-join"></P>
	
	</form>
<script>
$(function () {

	$(document).on('click', '#btn-join', function () {
		location.href = "/JSPBook/insert01.jsp";
	});
	
});
</script>
</body>
</html>

