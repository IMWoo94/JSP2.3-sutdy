<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");
	
	int updateCount = 0;
	
	// 1. JDBC 드라이버 로딩
	//Class.forName("com.mysql.jdbc.Driver"); // deprecated
	//Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?" +
							"useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Seoul";
		String dbUser = "jspexam";
		String dbPass = "jsppw";
		
		String query = "update MEMBER set NAME ='" + name + "' where MEMBERID = '" + memberId +"'";
		
		// 2. 데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		updateCount = stmt.executeUpdate(query);
	}catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	}finally{
		// 6. 사용한 statement 종료
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		
		// 7. 커넥션 종료
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}

%>
<html>
	<head>
		<title>이름 변경</title>
	</head>
	<body>
		<% if(updateCount > 0) { %>
		<%= memberId %> 의 이름을 <%= name %> (으)로 변경
		<% } else { %>
		<%= memberId %> 아이디가 존재하지 않음
		<% } %>
	</body>
</html>