<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="js/joinCheck.js"></script>


<body>
	<div>
		<form action="upd" method="POST">
			<h3>수정페이지</h3>
			<dl>
				<dd>아이디</dd>
				<dd>${ sessionScope.testVO.test_id }</dd>

				<dd>비밀번호</dd>
				<dd>
					<input style="border: none; background-color: #e2e2e2;"
						type="password" name="test_pwd"
						value="${ sessionScope.testVO.test_pwd }">
				</dd>

				<dd>이메일</dd>
				<dd>
					<input style="border: none; background-color: #e2e2e2;" type="text"
						name="test_mail" value="${ sessionScope.testVO.test_mail }">
				</dd>

				<dd>연락처 ('-' 빼고 입력)</dd>
				<dd>
					<input style="border: none; background-color: #e2e2e2;" type="text"
						name="test_phone" value="${ sessionScope.testVO.test_phone }">
				</dd>



				<dd>
					<input type="button" value="수정하기" onclick="update(this.form)">
					<input type="button" value="이전으로"
						onclick='javascript:history.go(-1)'>
				</dd>
			</dl>
		</form>
	</div>
</body>
</html>