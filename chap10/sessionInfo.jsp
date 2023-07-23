<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

%>
<html>
	<head><title>세션정보</title></head>
	<body>
		세션ID : <%= session.getId() %> <br>
		<%
			time.setTime(session.getCreationTime());
		%>
		세션 생성 시간 : <%= formatter.format(time) %> <br>
		<%
			time.setTime(session.getLastAccessedTime());
		%>
		최근 접근 시간 : <%= formatter.format(time) %> <br>
		<br>
		<%= session.getAttribute("MEMBERID") %>
		<br>
		<%= session.getAttribute("NAME") %>
	</body>
</html>
