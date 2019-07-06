<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="js/httpRequest.js"></script>
<script>
	function join() {

		location.href = "join.do";
	}

	
	function login(f) {
		
		var id = f.test_id.value;
		var pwd = f.test_pwd.value;

		if (id == '' || pwd == '') {
			alert("아이디와 패스워드를 입력해주세요");
			return;
		}

		var url = "login";
		var param = "test_id=" + id + "&test_pwd=" + pwd;

		sendRequest(url, param, check_member, "POST");
	}
	

	function check_member() {
		
		console.log(xhr.readyState + " / " + xhr.status);

		if (xhr.readyState == 4 && xhr.status == 200) {
			var msg = xhr.responseText;

			

			if (msg == 'yes') {
				location.href = "test.login_page";
				alert("로그인 되었습니다");
			} else {
				alert("회원정보가 없거나 일치하지 않습니다");
			}
		}

	}
</script>

</head>



<body>
	<div>
		<form>
			<h3>LOGIN</h3>

			<dl>
				<dd>아이디</dd>
				<dd>
					<input type="text" name="test_id">
				</dd>

				<dd>비밀번호</dd>
				<dd>
					<input type="password" name="test_pwd">
				</dd>

				<dd>
					<input type="button" value="로그인" onclick="login(this.form)">
					<input type="button" value="회원가입" onclick="join(this.form)">
				</dd>

			</dl>
		</form>
	</div>

</body>
</html>