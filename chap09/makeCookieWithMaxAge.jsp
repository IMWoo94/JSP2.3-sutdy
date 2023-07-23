<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.URLEncoder"%>
<% 
	Cookie cookie = new Cookie("oneh", URLEncoder.encode("ltime", "UTF-8"));
	cookie.setMaxAge(60);
	response.addCookie(cookie);
%>
<html>
	<head><title>쿠키 유효 시간 설정</title></head>
	<body>
		유효 시간이 1분인 oneh 쿠키 생성.
	</body>
</html>