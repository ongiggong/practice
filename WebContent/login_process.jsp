<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>login</title>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
 	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String no = null;
	
	ResultSet rs = null;
	PreparedStatement pstmt = null; 
	
	try {
		String sql = "select * from members where id= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			no = rs.getString("no");
			String rID = rs.getString("id");
			String rPW = rs.getString("pw");
			String name = rs.getString("name");
			
			if (id.equals(rID) && pw.equals(rPW)) {
				session.setAttribute("id", rID);
				session.setAttribute("no", no);
				session.setAttribute("name", name);
%>
			<script>
			alert('<%=name%>님 환영합니다.');
			location.href='main.jsp';
			</script>
<%
				
				
			 
			} 	else {
%>
			<script>
			alert('아이디 비밀번호를 확인하세요.');
			location.href='login.jsp';
			</script>
<%
			
			}
		} else {
%>
<script>
	alert('아이디 비밀번호를 확인하세요.');
	location.href='login.jsp';
</script>
<% 
		}
	} catch (SQLException ex) {
	 	out.println("SQLException: " + ex.getMessage());
		
	} finally {
	 	if (rs != null)
				rs.close();
		if (pstmt != null)
				pstmt.close();
		if (conn != null)
				conn.close(); 
	}
%>

<%@ include file="tale.jsp" %>


	