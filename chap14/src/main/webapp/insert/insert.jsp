<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	int updateCount = 0;
	
	// 1. JDBC 드라이버 로딩
	//Class.forName("com.mysql.jdbc.Driver"); // deprecated
	//Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?" +
							"useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Seoul";
		String dbUser = "jspexam";
		String dbPass = "jsppw";
		
		// 2. 데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. PreparedStatement 생성
		pstmt = conn.prepareStatement("insert into MEMBER (MEMBERID, NAME, PASSWORD, EMAIL) values(?,?,?,?)");
		
		// 4. PreparedStatement parameter set
		pstmt.setString(1, memberId);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, email);
		
		// 5. 쿼리 실행
		updateCount = pstmt.executeUpdate();
		
	}catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	}finally{
		// 6. 사용한 PreparedStatement 종료
		if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
		
		// 7. 커넥션 종료
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}

%>
<html>
	<head>
		<title>삽입</title>
	</head>
	<body>
		<% if(updateCount > 0) { %>
		<%= memberId %> 의 이름을 신규 등록
		<% } else { %>
		<%= memberId %> 등록 불가
		<% } %>
	</body>
</html>