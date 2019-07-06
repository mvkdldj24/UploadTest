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
		style="width: 600px; height: 450px; padding-top: 20px; margin-left: 600px; margin-top: 80px;" >
		
		<form action="writ_ins" method="GET">
			<label style="font-weight: bold; margin-right: 10px;">제목</label>
			
			<c:forEach var="i" items="${boardList}">
			<input type="text" value="${i.w_title}" readonly="readonly"  style="height: 20px; width:100%; margin-bottom: 20px; ">
			
			<div style="float: right;">
			<label style="font-size: 13px; font-weight: bold;">작성시간 </label>
				<input type="text" value="${i.w_time}" readonly="readonly" style="border: 1px solid white;  width: 110px;" >
			</div>
			
			<br>
			<br>

			<label style="font-weight: bold; margin-right: 10px;">내용</label>
			<input type="text" value="${i.w_content}" readonly="readonly" style="height: 300px; width:100%;"><br><br>
			</c:forEach>
			
		<div style="text-align: center; margin-left: -20px;">
		
			<input type="button" value="이전" onclick='javascript:history.go(-1)'>
		</div>
		</form>
	</div>
	
</body>
</html>