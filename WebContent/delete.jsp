<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>회원탈퇴</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		
		String no = (String)session.getAttribute("no");	
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		
		try {
		      String sql = "delete from members where no = ?";
		      pstmt = conn.prepareStatement(sql);
		  	 
		      pstmt.setString(1, no);
		     
		      pstmt.executeUpdate();
	 %>
	  <script>
	  alert('탈퇴 되었습니다.');
	  location.href="login.jsp"
	  </script>
	 <%          
	 	 
		} catch (SQLException ex) {
			  out.println("선택 회원 삭제를 실패하였습니다.<br>");
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