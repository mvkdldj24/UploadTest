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
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("10_loginForm.jsp");
		} else {
	%>

	<%=session.getAttribute("loginUser")%>님 안녕하세요!
	<br> 즐거운시간되세요///
	<br>
	<form action="10_logout.jsp" method="post">
		<input type="submit" value="로그아웃">
	</form>
	<%
		}
	%>

</body>
</html>