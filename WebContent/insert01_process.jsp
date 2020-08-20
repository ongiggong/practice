<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String no = request.getParameter("no");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		PreparedStatement pstmt = null;
		
		try {
		      String sql = "insert into members(id, pw, name, age) values(?,?,?,?)";
		      pstmt = conn.prepareStatement(sql);
		      
		      pstmt.setString(1, id);
		      pstmt.setString(2, pw);
		      pstmt.setString(3, name);
		      pstmt.setString(4, age);
		     
		      pstmt.executeUpdate();
	%>
		<script>
		alert("회원가입 되었습니다.");
		location.href='login.jsp';
		</script>
		     
		      
	<%
		} catch (SQLException ex) {
			  out.println("Member 테이블 삽입이 실패했습니다.<br>");
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