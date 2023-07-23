<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.URLEncoder"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(Cookie temp : cookies){
			if(temp.getName().equals("name")){
				Cookie cookie = new Cookie("name", URLEncoder.encode("최범균","UTF-8"));
				response.addCookie(cookie);
			}
		}

	}

%>	
<html>
	<head><title>값 변경</title></head>
	<body>
		name 쿠키의 값을 변경합니다.
	</body>
</html>