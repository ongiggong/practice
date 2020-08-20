<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<% String idx = request.getParameter("idx");
	   String id = null;
				ResultSet rs = null;
				Statement stmt = null;
				
				try {
						String sql = "select * from board where idx="+idx;
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery(sql);
						
						while (rs.next()) {
							id = rs.getString("id");
							String title = rs.getString("title");
							String text = rs.getString("text");
							String uploadtime = rs.getString("uploadtime");
							
							
	%>
<title><%=title%></title>		
		<table width="1000">
		
		<h1><%=title%>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">작성자: <%=id%>&nbsp;&nbsp;&nbsp;날짜: <%=uploadtime%></font>
		
		<br><br><br>
	
		<font size="2"><%=text%></font>
		
		<p><br><br><input type="button" value="수정하기" id="btn-update">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="삭제하기" id="btn-delete"></p>
		</table>
		
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
<script>
$(function () {

	$(document).on('click', '#btn-update', function () {
		location.href = "/JSPBook/textupdate.jsp?idx=<%=idx%>&id=<%=id%>";
	});

	$(document).on('click', '#btn-delete', function () {
		location.href = "/JSPBook/textdelete.jsp?idx=<%=idx%>&id=<%=id%>";
	});
	
});
</script>
</body>
</html>