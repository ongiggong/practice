<%@ page contentType="text/html; charset=utf-8"
    import="java.sql.*"
%>
<%
    request.setCharacterEncoding("utf-8");
%>

<head>
<title> Login_Check </title>
</head>
<body>

    <h1> 로그인 체크 페이지 </h1>
    
    <%
    try {
       
        String driver = "org.mariadb.jdbc.Driver";
        Class.forName(driver);
        
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/random";
        String id = "root";
        String pw = "1234";
        
       
        conn = DriverManager.getConnection(url, id, pw);
        
         // sql 구사
         // 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
         String user_id= request.getParameter("input_id");
         String user_pw= request.getParameter("input_pw");
        
         
        Statement st = conn.createStatement();
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        String sql = "SELECT * FROM members WHERE id='" + user_id + "' AND pw='" + user_pw + "'";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);
        
       
        // isLogin 은 로그인 확인 유무를 위한 변수
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
        }
        
        
        
        // DB에 내가 적은 정보가 있다면
        if(isLogin) {
            // 지금 로그인할 id와 pw를 session에 저장하고
            session.setAttribute("id", user_id); 
            session.setAttribute("pw", user_pw);
            // 첫 페이지로 돌려보낸다
            response.sendRedirect("login.jsp");    
        } else {
            // DB에 내가적은 정보가 없다면 경고창을 띄워준다
            %> <script> alert("로그인 실패! 아이디와 비밀번호를 확인해주세요."); history.go(-1); </script> <%            
        }
        
        
    } catch (Exception e) {       
        out.println("DB 연동 실패");
    }
    %>
 
</body>
</html>


