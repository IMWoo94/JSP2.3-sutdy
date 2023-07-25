<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>

<html>
<head>
<title>회원 목록</title>
</head>
<body>

MEMBER 테이블의 내용
<table width="100%" border = "1">
<tr>
<td>이름</td><td>아이디</td><td>이메일</td>
</tr>
<%
	// 1. JDBC 드라이버 로딩
	//Class.forName("com.mysql.jdbc.Driver"); // deprecated
	//Class.forName("com.mysql.cj.jdbc.Driver");

	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?" +
							"useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Seoul";
		String dbUser = "jspexam";
		String dbPass = "jsppw";
		
		String query = "select * from MEMBER order by MEMBERID";
		
		// 2. 데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs.next()){
		
		%>
		<tr>
			<td><%= rs.getString("NAME") %></td>
			<td><%= rs.getString("MEMBERID") %></td>
			<td><%= rs.getString("EMAIL") %></td>
		</tr>
		<% 
		}
	}catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	}finally{
		// 6. 사용한 statement 종료
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		
		// 7. 커넥션 종료
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}
%>

</table>
</body>
</html>