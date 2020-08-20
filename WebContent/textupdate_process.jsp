<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>글 수정</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String idx= request.getParameter("idx");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String uploadtime = request.getParameter("uploadtime");
		
		
		PreparedStatement pstmt = null;
		
				
		try {
			  String sql = "update board set id = ?, title= ?, text = ?, uploadtime = ? where idx = ?";
		      pstmt = conn.prepareStatement(sql);
		      
		      pstmt.setString(1, id);
		      pstmt.setString(2, title);
		      pstmt.setString(3, text);
		      pstmt.setString(4, uploadtime);
		      pstmt.setString(5, idx);
		     
		      pstmt.executeUpdate();
	%>
		<script>
		alert("글이 수정되었습니다.");
		location.href='board.jsp';
		</script>
		     
		      
	<%	
		} catch (SQLException ex) {
			  out.println("글 수정을 실패했습니다.<br>");
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