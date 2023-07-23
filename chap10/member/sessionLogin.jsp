<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if(id.equals(pw)){
		session.setAttribute("MEMBERID", id);
	%>
<html>
	<head><title>로그인 성공</title></head>
	<body>
		로그인에 성공 했습니다.
	</body>
</html>
<% 
	} else { // 로그인 실패 시
%>
<script>
alert("로그인 실패");
history.go(-1);
</script>
<%
	}
%>
