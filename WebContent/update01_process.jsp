<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>회원정보수정</title>
</head>
<body>
<%
String htmlTitle = "회원정보수정"; 
%>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String no = request.getParameter("no");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
		      String sql = "update members set id = ?, pw= ?, name = ?, age = ? where no = ?";
		      pstmt = conn.prepareStatement(sql);
		  	  pstmt.setString(1, id);
		      pstmt.setString(2, pw);
		      pstmt.setString(3, name);
		      pstmt.setString(4, age);
		      pstmt.setString(5, no);
		     
		      pstmt.executeUpdate();
	%>
	<script>
		alert('회원정보를 수정하였습니다.');
		location.href='main.jsp'
	</script>
	<% 
		     /*  out.println("회원정보를 수정하였습니다."); */
		} catch (SQLException ex) {
			  out.println("Member 테이블 수정을 실패했습니다.<br>");
			  out.println("SQLException: " + ex.getMessage());
		} finally {
			  if (pstmt != null)
			       pstmt.close();
			  if (conn != null)
			  		conn.close();
		}
	%>
	
</body>
</html>