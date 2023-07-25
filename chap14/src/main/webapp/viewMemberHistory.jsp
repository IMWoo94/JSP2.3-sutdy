<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="java.io.Reader, java.io.IOException" %>
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
		
		String query = "select * from MEMBER_HISTORY where MEMBERID = '"+ memberId +"' order by MEMBERID";
		
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
			 	<td>아이디</td><td><%= rs.getString("MEMBERID") %></td>
			</tr>
			<tr>
				<td>히스토리</td>
				<td>
				<% 
					String history = null;
					Reader reader = null;
					
					try{
						reader = rs.getCharacterStream("HISTORY");
						if(reader != null ){
							StringBuilder buff = new StringBuilder();
							char[] ch = new char[512];
							int len = -1;
							
							while((len = reader.read(ch)) != -1){
								buff.append(ch, 0, len);
							}
							
							history = buff.toString();
						}
					}catch(IOException e){
						out.println("익셉션 발생 : " + e.getMessage());
					}finally{
						if(reader != null) try { reader.close();} catch(IOException e){}
						
					}
				%>
				<%= history %></td>
			</tr>
		</table>
		<% 
		} else{
			%>
			<%= memberId %> 회원의 히스토리가 없습니다.
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