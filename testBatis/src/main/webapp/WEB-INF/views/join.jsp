<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<script>
	// 아이디 중복체크
	function checkId(id) {

		var url = "test_checkId.do";
		var param = "id=" + id;
		sendRequest(url, param, result_check, "POST");
	}

	// 콜백함수
	function result_check() {

		console.log(xhr.readyState + " / " + xhr.status);
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = JSON.parse(data);

			document.getElementById("checkid").innerHTML = "<p style=\"margin:0 auto; color:" + json.textColor + ";\">"
					+ json.msg + "</p>";
		}
	}
</script>

<script src="js/joinCheck.js"></script>
<script src="js/httpRequest.js"></script>

<body>
	<form action="joinpage.do" method="POST">
		<dl>
			<dd>아이디</dd>
			<dd>
				<input style="border: none; background-color: #e2e2e2;" type="text"
					name="test_id" onblur="checkId(this.value)">
				<!-- 아이디 중복체크 결과 뿌려줄 영역 -->
				<div id="checkid"></div>
			</dd>

			<dd>비밀번호</dd>
			<dd>
				<input style="border: none; background-color: #e2e2e2;"
					type="password" name="test_pwd">
			</dd>

			<dd>비밀번호</dd>
			<dd>
				<input style="border: none; background-color: #e2e2e2;"
					type="password" name="pwd_check">
			</dd>

			<dd>이메일</dd>
			<dd>
				<input style="border: none; background-color: #e2e2e2;" type="text"
					name="test_mail">
			</dd>

			<dd>전화번호</dd>
			<dd>
				<input style="border: none; background-color: #e2e2e2;" type="text"
					name="test_phone">
			</dd>

			<br>

			<dd>
				<input type="button" value="가입" onclick="join(this.form)"> <input
					type="button" value="이전으로" onclick='javascript:history.go(-1)'>
			</dd>

		</dl>
	</form>
</body>
</html>