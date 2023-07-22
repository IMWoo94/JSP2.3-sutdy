<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.Enumeration"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 1L);
%>
<html>
	<head><title>헤더 목록 출력</title></head>
	<body>
		<%
			Enumeration headerEnum = request.getHeaderNames();
			while(headerEnum.hasMoreElements()){
				String headerName = (String)headerEnum.nextElement();
				String headerValue = request.getHeader(headerName);
				%>
				<%= headerName %> = <%= headerValue %><br>
				<%
			}

			Enumeration headers = request.getHeaders("accept");
			while(headers.hasMoreElements()){
				String headerName = (String)headers.nextElement();
				String headerValue = request.getHeader(headerName);
				%>
				<%= headerName %> = <%= headerValue %><br>
				<%
			}

		%>
	</body>
</html>