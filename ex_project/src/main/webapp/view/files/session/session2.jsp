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
		String �Ƶ� = (String) session.getAttribute("id");
		String ��� = (String) session.getAttribute("pw");
		Integer ���� = (Integer) session.getAttribute("age");
	%>
	
	�ݰ����ϴ� <%=session.getId() %>��<br>
	����� ���� : <%=��� %><br>
	���̴� ��� : <%=���� %><br>

</body>
</html>