<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>글 수정</title>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%		String idx = request.getParameter("idx");
		String id = request.getParameter("id");
		ResultSet rs = null;
		Statement stmt = null;
				
		if(id.equals((String)session.getAttribute("id"))) {
			
			try {
				String sql = "select * from board where idx="+idx;
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery(sql);
						
				while (rs.next()) {
					String title = rs.getString("title");
					String text = rs.getString("text");
						
%>
		<form method="post" action="textupdate_process.jsp">
		<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
		<input type="hidden" name="idx" value="<%=idx%>">
		<p><h3>제목:&nbsp;&nbsp;<input type="text" name="title" value="<%=title%>"></p>
		<p>내용:</p> 
		<p><textarea name="text" rows="50" cols="50"><%=text%></textarea></p>
		
		<input type="submit" value="등록">
		</form>

		
		
<%
				} 
			} catch (SQLException ex) {
				out.println("board 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} finally {
				if (rs != null)
						rs.close();
			 	if (stmt != null)
			 	  	 	stmt.close();
			 	if (conn != null)
			 			conn.close();		
		 	}

		} else {
%>
<script>
alert('접근권한이 없습니다.');
location.href="/JSPBook/board.jsp";
</script>

<% } %>
</body>
</html>