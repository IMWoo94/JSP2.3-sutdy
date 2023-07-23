<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "util.Cookies"%>
<%
	Cookies cookies = new Cookies(request);
%>
<html>
	<head><title>로그아웃</title></head>
	<body>
		<%
			if(cookies.exists("AUTH")){
			response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
		%>
		로그아웃하였습니다.

		<%	} else {
		%>
		로그인 하지 않았습니다.
		<%	}
		%>
	</body>
</html>
