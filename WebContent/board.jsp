<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Board List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<table width="1000" border="1">
	<h2>자유 게시판</h2> <div style="text-align:center"><p><input type="button" value="글쓰기" id=btn-write></p></div>
	
		<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>날짜</th>
		</tr>
		<%
				ResultSet rs = null;
				Statement stmt = null;
				
				try {
						String sql = "select * from board";
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery(sql);
						
						while (rs.next()) {
							int idx = rs.getInt("idx");
							String id = rs.getString("id");
							String title = rs.getString("title");
							String uploadtime = rs.getString("uploadtime");
		%>
		<tr>
				<th><%=idx%></th>
				<th><%=id%></th>
				<th><a href="/JSPBook/board_process.jsp?idx=<%=idx%>&id=<%=id%>"><%=title%></a></th>
				<th><%=uploadtime%></th>
				
		</tr>
		<%
					}
			} catch (SQLException ex) {
					out.println("Member 테이블 호줄이 실패했습니다.<br>");
					out.println("SQLException: " + ex.getMessage());
			} finally {
					if (rs != null)
							rs.close();
				 	if (stmt != null)
				 	   		stmt.close();
				 	if (conn != null)
				 	  		conn.close();
			}
		%>
	
	</table>
	<script>
$(function () {

	$(document).on('click', '#btn-write', function () {
		location.href = "/JSPBook/write.jsp";
	});
	
});
</script>

</body>
</html>