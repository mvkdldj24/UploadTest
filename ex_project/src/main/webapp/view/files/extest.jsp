<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ex_project/ctr/login_ch" method="get">
		<table>
			<tr>
				<c:forEach var="i" items="${list}">
					<td><input type="hidden" value="${i.MBR_NM}" name="mbr_id"></td>
					<td><input type="hidden" value="${i.MBR_PW}" name="mbr_pw"></td>
					<td><input type="submit" value="전송"></td>
				</c:forEach>
			</tr>
		</table>
	</form>





</body>
</html>