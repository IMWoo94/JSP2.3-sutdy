<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "util.Cookies"%>
<% 
	Cookies cookies = new Cookies(request);
%>
<html>
	<head><title>Cookies 사용</title></head>
	<body>
		name 쿠키 = <%= cookies.getValue("name") %><br>
		<%	
			if(cookies.exists("id")){
				%>
				id 쿠키 = <%= cookies.getValue("id") %><br>
				<%
			}
		%>
	</body>
</html>