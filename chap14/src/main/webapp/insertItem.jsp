<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String idValue = request.getParameter("id");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmtDetail = null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?" +
			"useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Seoul";
	String dbUser = "jspexam";
	String dbPass = "jsppw";
	
	Throwable occuredException =null;
	try{
		
		int id = Integer.parseInt(idValue);
		// 2. 데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// 트랙잰션 시작 하기 위해 오토 커밋 false
		conn.setAutoCommit(false);
		
		// 3. PreparedStatement 생성
		pstmt = conn.prepareStatement("insert into ITEM (ITME_ID, NAME) values(?,?)");
		
		// 4. PreparedStatement parameter set
		pstmt.setInt(1, id);
		pstmt.setString(2, "상품이름" + id);
		pstmt.executeUpdate();
		
		if(request.getParameter("error") != null){
			throw new Exception("의도적 에러 발생");
		}
		
		pstmtDetail = conn.prepareStatement("insert into ITEM_DETAIL (ITME_ID, DETAIL) values(?,?)");
		pstmtDetail.setInt(1, id);
		pstmtDetail.setString(2, "상품상세" + id);
		pstmtDetail.executeUpdate();
		
		conn.commit();
		
	}catch(Throwable e){
		occuredException = e;
	}finally{
		// 6. 사용한 PreparedStatement 종료
		if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
		if(pstmtDetail != null) try{pstmt.close();}catch(SQLException e){}
		// 7. 커넥션 종료
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}

%>
<html>
	<head>
		<title>ITEM 값 입력</title>
	</head>
	<body>
		<% if(occuredException != null ) { %>
		에러가 발생하였음 <%= occuredException.getMessage() %>
		<% } else { %>
		데이터 성공적으로 들어감
		<% } %>
	</body>
</html>