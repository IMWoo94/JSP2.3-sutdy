<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.net.URLDecoder"%>
<% 
	Cookie cookie1 = new Cookie("id", URLEncoder.encode("madvirus", "UTF-8"));
	cookie1.setDomain("javacan.somehost.com");
	response.addCookie(cookie1);

	Cookie cookie2 = new Cookie("pw", URLEncoder.encode("password", "UTF-8"));
	response.addCookie(cookie2);

	Cookie cookie3 = new Cookie("public", URLEncoder.encode("public", "UTF-8"));
	cookie3.setDomain("javacan.tistory.com");
	response.addCookie(cookie3);
%>
<html>
	<head><title>쿠키 생성</title></head>
	<body>
		다음과 같이 쿠키를 생성 했습니다. <br>
		<%= cookie1.getName() %> = <%= URLDecoder.decode(cookie1.getValue(), "UTF-8") %>
		[<%= cookie1.getDomain() %>]
		<br>
		<%= cookie2.getName() %> = <%= URLDecoder.decode(cookie2.getValue(), "UTF-8") %>
		[<%= cookie2.getDomain() %>]
		<br>
		<%= cookie3.getName() %> = <%= URLDecoder.decode(cookie3.getValue(), "UTF-8") %>
		[<%= cookie3.getDomain() %>]
	
	</body>
</html>