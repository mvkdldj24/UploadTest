

<title>회원가입</title>
<style type="text/css">
#signst input {
	width: 300px;
	height: 40px;
	margin-bottom: 10px;
	padding: 4px;
	font-size: 15px;
}

label {
	font-size: 14px;
	font-weight: bold;
}
</style>


</head>
<body>

	<form action="/ex_project/ctr/sign_up" method="POST" name="userInfo"
		onsubmit="return checkValue()" style="margin-top: 150px;">



		<div id="signst" style="margin-left: 35%; margin-top: 30px;">
			<h1>회원가입</h1>

			<label>이름</label><br> <input type="text" name="mbr_nm"
				required="required"><br> <label>아이디</label><br> <input
				type="text" name="mbr_id" required="required" size="20px"><br>

			<label>비밀번호</label><br> <input type="password" name="mbr_pw"
				required="required" size="20px"><br> 
			<label>핸드폰번호</label><br>
			<input type="text" name="mbr_tel" required="required" size="20px"><br>

			<label>주소</label><br> <input type="text" name="mbr_addr"
				required="required" size="43px"><br><br> <input
				type="submit" value="가입하기"
				style="width: 300px; hefont-weight: bolder; height: 50px;">

		</div>
	</form>
</body>
</html>