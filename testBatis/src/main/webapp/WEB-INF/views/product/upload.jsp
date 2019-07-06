<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
label {
	width: 100px;
	
	display:block;
	float:left;
}

input {
	float:left;
	
}
</style>
</head>
<body>

	<div style="width: 370px; height: 100px; margin: auto; border: 1px solid black; text-align: center; margin-top: 100px; padding: 30px;">
	
		<form action="upload.do" enctype="multipart/form-data">
		
			<label>이름</label><input type="text" name="name"><br><br>
			
			 <label>파일</label><input type="file"
				multiple="multiple" name="img"><br><br>
				
				<input type="submit" value="전송" style="float: right;">
								
		</form>
	</div>
</body>
</html>