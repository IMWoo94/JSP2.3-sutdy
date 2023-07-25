<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<% 
	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");
%>
<html>
<head>
<title>회원 정보</title>
</head>
<body>
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
		
		String query = "select * from MEMBER where MEMBERID = '"+ memberId +"' order by MEMBERID";
		
		// 2. 데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		if(rs.next()){
		
		%>
		<table border = "1">
			<tr>
				<td>이름</td><td><%= rs.getString("NAME") %></td>
			</tr>
			<tr>
			 	<td>아이디</td><td><%= rs.getString("MEMBERID") %></td>
			</tr>
			<tr>
				<td>패스워드</td><td><%= rs.getString("PASSWORD") %></td>
			</tr>
			<tr>
				<td>이메일</td><td><%= rs.getString("EMAIL") %></td>
			</tr>
		</table>
		<% 
		} else{
			%>
			<%= memberId %> 에 해당하는 정보가 존재하지 않습니다.	
			<%
		}
	}catch(SQLException e){
		%>
		에러 발생 : <%= e.getMessage() %>	
		<%
	}finally{
		// 6. 사용한 statement 종료
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		
		// 7. 커넥션 종료
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}
%>
</body>
</html>