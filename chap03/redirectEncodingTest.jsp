<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>
<%
	String value = "자바";
	String encodingValue = URLEncoder.encode(value, "utf-8");
	response.sendRedirect("/chap03/index.jsp?name=" +  encodingValue);

%>
<html>
	<head><title></title></head>
	<body>
	</body>
</html>
