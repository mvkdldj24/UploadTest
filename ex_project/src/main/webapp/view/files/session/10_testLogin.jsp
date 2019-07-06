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
	
	String id="park";
	String pw="1234";
	String name="박지훈";
	
	if(id.equals(request.getParameter("id"))&&
			pw.equals(request.getParameter("pwd")) ){
		session.setAttribute("loginUser", name);
 
		
		response.sendRedirect("10_main.jsp");
	}
	else{
		response.sendRedirect("10_loginForm.jsp");
	}
%>
</body>
</html>