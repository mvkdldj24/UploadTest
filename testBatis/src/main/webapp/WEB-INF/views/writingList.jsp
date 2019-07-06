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
		style="width: 1000px; height: 500px; padding: 10px; margin-left: 400px; margin-top: 60px; border: 1px solid black; overflow: scroll;">
		<table
			style="border: 1px solid white-space; width: 100%; font-weight: bold;">
			<tr style="background: #E6E6E6; text-align: center; height: 30px;">
				<td style="width: 10%;">No</td>
				<td style="width: 55%;">제목</td>
				<td style="width: 15%;">작성자</td>
				<td style="width: 20%;">작성일</td>
			</tr>
			<c:forEach var="i" items="${boardList}">
			
				<tr style="text-align: center;">
					<td>${i.w_no}</td>
					
					<td><a href="w_dt?w_no=${i.w_no}">${i.w_title}</a></td>
					
					<td>${i.w_writer}</td>
					<td>${i.w_date}</td>
				</tr>				
			</c:forEach>
		</table>
		<br><br>
		
		<table style="margin-left: 400px;">
		<tr>
		<td>
			<input type="button" value="Home" onclick="location.href='test.login_page'" style="width: 70px; height: 50px;"><br>
			</td>
			<td>
			<input type="button" value="이전" onclick="javascript:history.go(-1)" style="width: 70px; height: 50px;">
			</td>
			</tr>
		</table>
	</div>

</body>
</html>