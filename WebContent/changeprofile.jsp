<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<table width="350" border="1">
		<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>회원 삭제</th>
		</tr>
		<%
				ResultSet rs = null;
				Statement stmt = null;
				
			
			try {
						String sql = "select * from members where no=";
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery(sql);
						
						while (rs.next()) {
							int no = rs.getInt("no");
							String id = rs.getString("id");
							String pw = rs.getString("pw");
							String name = rs.getString("name");
							String age = rs.getString("age");
		%>
		<tr>
				<th><a href="/JSPBook/update01.jsp?no=<%=no%>"><%=id%></a></th>
				<th><%=pw%></th>
				<th><%=name%></th>
				<th><%=age%></th>
				<th>
<!-- 				<a href="/JSPBook/delete.jsp?no=<%=no%>"></a> -->
					<input type="button" value="삭제" no="<%=no%>" class="btn-delete">
				</th>
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

	$(document).on('click', '.btn-delete', function () {
		var no = $(this).attr('no');
		location.href = "/JSPBook/delete.jsp?no="+no;
	});
	
});
</script>
</body>
</html>