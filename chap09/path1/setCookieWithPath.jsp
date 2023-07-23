<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.net.URLDecoder"%>
<% 
	Cookie cookie1 = new Cookie("path1", URLEncoder.encode("경로:/chap09/path1", "UTF-8"));
	cookie1.setPath("/chap09/path1");
	response.addCookie(cookie1);

	Cookie cookie2 = new Cookie("path2", URLEncoder.encode("경로:", "UTF-8"));
	response.addCookie(cookie2);

	Cookie cookie3 = new Cookie("path3", URLEncoder.encode("경로:/", "UTF-8"));
	cookie3.setPath("/");
	response.addCookie(cookie3);

	Cookie cookie4 = new Cookie("path4", URLEncoder.encode("경로:/chap09/path2", "UTF-8"));
	cookie4.setPath("/chap09/path2");
	response.addCookie(cookie4);
%>
<html>
	<head><title>쿠키 경로 지정</title></head>
	<body>
		다음과 같이 쿠키를 생성 했습니다. <br>
		<%= cookie1.getName() %> = <%= URLDecoder.decode(cookie1.getValue(), "UTF-8") %>
		[<%= cookie1.getPath() %>]
		<br>
		<%= cookie2.getName() %> = <%= URLDecoder.decode(cookie2.getValue(), "UTF-8") %>
		[<%= cookie2.getPath() %>]
		<br>
		<%= cookie3.getName() %> = <%= URLDecoder.decode(cookie3.getValue(), "UTF-8") %>
		[<%= cookie3.getPath() %>]
		<br>
		<%= cookie4.getName() %> = <%= URLDecoder.decode(cookie4.getValue(), "UTF-8") %>
		[<%= cookie4.getPath() %>]
	</body>
</html>