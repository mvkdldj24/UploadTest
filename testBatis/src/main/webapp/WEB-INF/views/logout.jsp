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
			<h3>${ sessionScope.testVO.test_id }�Էα��οϷ�</h3>
			<table>
				<tr>
					<th>���̵�</th>
					<th>${ sessionScope.testVO.test_id}</th>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<th>${ sessionScope.testVO.test_pwd }</th>
				</tr>
				<tr>
					<th>�̸���</th>
					<th>${ sessionScope.testVO.test_mail }</th>
				</tr>
				<tr>
					<th>��ȭ��ȣ</th>
					<th>${ sessionScope.testVO.test_phone }</th>
				</tr>
			</table>





		</form>
	</div>
</body>
</html>