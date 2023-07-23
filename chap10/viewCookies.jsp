<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.URLDecoder"%>
<html>
	<head><title>쿠키 목록</title></head>
	<body>
		쿠키 목록<br>
		<%
			Cookie[] cookies = request.getCookies();
			if(cookies != null && cookies.length > 0){
				for(Cookie temp : cookies){
					%>
					<%= temp.getName() %> =
					<%= URLDecoder.decode(temp.getValue(),"UTF-8") %><br>
					<%
				}
			}else{
				%>
				쿠키가 존재하지 않습니다.
				<%
			}
		%>
	</body>
</html>