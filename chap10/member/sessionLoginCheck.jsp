<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	boolean login = memberId == null ? false : true;
%>
<html>
	<head><title>로그인여부 검사</title></head>
	<body>
		<%
			if(login){

		%>
		아이디 "<%= memberId %>"로 로그인 한 상태
		<%	} else {
		%>
		로그인 하지 않았습니다.
		<%	}
		%>
	</body>
</html>
