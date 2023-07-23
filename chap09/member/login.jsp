<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "util.Cookies"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)){
		//id와 pw이 동일하면 로그인 성공으로 판단
		response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));

%>
<html>
	<head><title>로그인 성공</title></head>
	<body>
		로그인에 성공했습니다.
	</body>
</html>
<% } else{
	// 로그인 실패 시
%>
<script>
alert("로그인 실패");
history.go(-1);
</script>
<%
}
%>