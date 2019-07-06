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

	<div
		style="width: 1000px; height: 800px; padding: 10px; margin-left: 400px; margin-top: 60px;">
		<table
			style="border: 1px solid white-space; width: 100%; font-weight: bold;">
			<tr style="background: #E6E6E6; text-align: center; height: 30px;">
				<td style="width: 20%;">이름</td>
				<td style="width: 30%;">아이디</td>
				<td style="width: 25%;">이메일</td>
				<td style="width: 25%;">핸드폰 번호</td>
			</tr>
			<c:forEach var="i" items="${mbr_list}">
				<tr style="text-align: center;">
					<td>${i.test_idx}</td>
					<td>${i.test_id}</td>
					<td>${i.test_mail}</td>
					<td>${i.test_phone}</td>
				</tr>
			</c:forEach>
			<tr>
				<td><input type="button" value="이전"
					onclick="javascript:history.go(-1)"></td>
			</tr>
		</table>
	</div>

</body>
</html>