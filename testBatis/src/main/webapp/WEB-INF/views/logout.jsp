<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="login">
		<form>
			<h3>${ sessionScope.testVO.test_id }님로그인완료</h3>
			<table>
				<tr>
					<th>아이디</th>
					<th>${ sessionScope.testVO.test_id}</th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<th>${ sessionScope.testVO.test_pwd }</th>
				</tr>
				<tr>
					<th>이메일</th>
					<th>${ sessionScope.testVO.test_mail }</th>
				</tr>
				<tr>
					<th>전화번호</th>
					<th>${ sessionScope.testVO.test_phone }</th>
				</tr>
			</table>





		</form>
	</div>
</body>
</html>