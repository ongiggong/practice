<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%String htmlTitle = "회원정보 수정 폼"; %>
<%@ include file="head.jsp"%>
<%@ include file="dbconn.jsp" %>
	
		<%		String no = request.getParameter("no");
				ResultSet rs = null;
				Statement stmt = null;
				
				try {
						String sql = "select * from members where no="+no;
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery(sql);
						
						while (rs.next()) {
							
							String id = rs.getString("id");
							String pw = rs.getString("pw");
							String name = rs.getString("name");
							String age = rs.getString("age");
		%>
			<form method="post" action="update01_process.jsp">
			<input type="hidden" name="no" value="<%=no%>">
			<p>아이디    : <input type="text" name="id" value="<%=id%>">
			<p>비밀번호 : <input type="text" name="pw" value="<%=pw%>">
			<p>이름       : <input type="text" name="name" value="<%=name%>">
			<p>나이       : <input type="text" name="age" value="<%=age%>"><br><br>
			<input type="submit" value="회원정보 수정하기">
			
			</form>
		
		<%
					}
			} catch (SQLException ex) {
					out.println("Member 테이블 호출이 실패했습니다.<br>");
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
		
		<p><input type="button" value = "탈퇴하기"  id="btn-delete"></p>
		
<script>
$(function () {

	$(document).on('click', '#btn-delete', function () {
		if(confirm('회원정보를 삭제하고 탈퇴하시겠습니까?')) {
			alert('탈퇴되었습니다.');
			location.href='delete.jsp';
		}
		
	});
	
});
</script>

	</table>
</body>
</html>