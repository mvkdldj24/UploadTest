<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String 아디 = (String) session.getAttribute("id");
		String 비번 = (String) session.getAttribute("pw");
		Integer 나이 = (Integer) session.getAttribute("age");
	%>
	
	반갑습니다 <%=session.getId() %>님<br>
	비번이 뭐야 : <%=비번 %><br>
	나이는 몇살 : <%=나이 %><br>

</body>
</html>