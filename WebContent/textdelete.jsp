<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>글 삭제</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String idx = request.getParameter("idx");	
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		if(id.equals((String)session.getAttribute("id"))) {
			
			try {
		      String sql = "delete from board where idx = ?";
		      pstmt = conn.prepareStatement(sql);
		  	 
		      pstmt.setString(1, idx);
		     
		      pstmt.executeUpdate();
	 %>
	  <script>
	  alert('글이 삭제되었습니다.');
	  location.href="board.jsp"
	  </script>
	 <%          
	 	 
			} catch (SQLException ex) {
			  	out.println("글 삭제를 실패하였습니다.<br>");
			 	 out.println("SQLException: " + ex.getMessage());
			  } finally {
			  	if (pstmt != null)
			       pstmt.close();
				if (conn != null)
			   		conn.close();
			    }
			
		} else {
%>
<script>
alert('접근권한이 없습니다.');
location.href="/JSPBook/board.jsp";
</script>
<%

		}
		
	%>
	
	
</body>
</html>