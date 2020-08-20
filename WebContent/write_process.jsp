<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>write_process</title>
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
		      String sql = "insert into board(idx, id, title, text, uploadtime) values(?,?,?,?,?)";
		      pstmt = conn.prepareStatement(sql);
		      
		      pstmt.setString(1, idx);
		      pstmt.setString(2, id);
		      pstmt.setString(3, title);
		      pstmt.setString(4, text);
		      pstmt.setString(5, uploadtime);
		     
		      pstmt.executeUpdate();
	%>
		<script>
		alert("글이 등록되었습니다.");
		location.href='board.jsp';
		</script>
		     
		      
	<%
		} catch (SQLException ex) {
			  out.println("글 등록을 실패했습니다.<br>");
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