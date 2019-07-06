
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*, java.text.*"  %>

<%
 java.text.SimpleDateFormat formatterDate = new java.text.SimpleDateFormat("yyyy.MM.dd");
 java.text.SimpleDateFormat formatterTime = new java.text.SimpleDateFormat("yyyy.MM.dd.hh:mm");
 String date = formatterDate.format(new java.util.Date());
 String time = formatterTime.format(new java.util.Date());
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function writingTest(f){

	
	var w_title = f.w_title.value;
	var w_content = f.w_content.value;
		
	if(w_title == '' || w_title == null){
		alert("제목을 입력해주세요.");
		return;
	}
	
	if(w_title.length < 2 || w_title.length > 30){
		alert("제목 글자는 2~30자 이내로 써주세요.");
		return;
	}
	
	if(w_content == '' || w_content == null){
		alert("내용을 입력해 주세요.");
		return;
	}
	if(w_content.length < 5){
		alert("내용은 5글자 이상 써주세요.");
		return;
	}
		f.submit();
	
}
</script>
</head>


<body>
	
	<div
		style="width: 600px; height: 450px;  padding-left: 20px; padding-top: 20px; margin-left: 600px; margin-top: 80px;" >
		<h1 style="text-align: center; margin-left: -20px;">글쓰기</h1>
		<form action="writ_ins" method="POST">
			<label style="font-weight: bold; margin-right: 10px;">제목</label>
			<input type="text" name="w_title" style="height: 20px; width: 500px; margin-bottom: 30px;">			
			<br>
			<label style="font-weight: bold; margin-right: 10px;">내용</label>
			<input type="text" name="w_content" style="height: 300px; width:500px;"><br><br>
			<input type="hidden" value="<%=date%>" name="w_date">
			<input type="hidden" value="<%=time%>" name="w_time">
			
			
		<div style="text-align: center; margin-left: -20px;">
			<input type="button" value="등록" onclick="writingTest(this.form)">
			<input type="button" value="이전" onclick='javascript:history.go(-1)'>
		</div>
		</form>
	</div>
</body>
</html>
