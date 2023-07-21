<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.Enumeration, java.util.Map"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
	<head><title>요청 파라미터 출력</title></head>
	<body>
		<%= request.getMethod() %>
		<br>
		<%= request.getCharacterEncoding() %>
		<br>
		<%= request.getRequestURI() %>
		<br>
		<b>request.getParameter() 메서드 사용</b><br>
		name 파라미터 = <%= request.getParameter("name")%><br>
		address 파라미터 = <%= request.getParameter("address")%>
		<p>
		<b>request.getParameterValues() 메서드 사용</b><br>
		<%
			String[] values = request.getParameterValues("pet");
			if(values != null){
				for(String str : values){
				%>
					<%= str %>
				<%
				}

			}

		%>
		<p>
		<b>request.getParameterNames() 메서드 사용</b><br>
		<%
			Enumeration paramEnum = request.getParameterNames();
			while(paramEnum.hasMoreElements()){
				String name = (String)paramEnum.nextElement();
				%>
					<%= name %>
				<%
			}
		%>
		<p>
		<b>request.getParameterMap() 메서드 사용</b><br>
		<% 
			Map parameterMap = request.getParameterMap();
			String[] nameParam = (String[])parameterMap.get("name");
			if(nameParam != null){
				%>
					name = <%= nameParam[0] %>
				<%

			}

		
		%>
	</body>
</html>