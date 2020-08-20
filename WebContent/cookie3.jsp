<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
			Cookie[] cookies = request.getCookies();
		
			out.println(cookies.length);
			
					
	/* 		out.println(cookies[0].getValue());
			
			out.println(cookies[1].getValue());
			
			out.println(cookies[2].getValue());
			
			cookies[0].setMaxAge(0);
			response.addCookie(cookies[0]);
			cookies[1].setMaxAge(0);
			response.addCookie(cookies[1]);
			cookies[2].setMaxAge(0);
			response.addCookie(cookies[2]); */
			for	(int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			} 			
			response.sendRedirect("cookie2.jsp");
	%>
</body>
</html>