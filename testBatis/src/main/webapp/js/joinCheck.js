function join(f) {

	

	var id = f.test_id.value;
	var pwd = f.test_pwd.value;
	var pwd2 = f.pwd_check.value;
	var phonenumber = f.test_phone.value;

	if (id == "" || pwd == "" || pwd2 == "" || phonenumber == "") {
		alert("필수정보를 모두 입력해야합니다.");
		return;

	}

	// ID 공백 유효성검사
	if (id.indexOf(" ") >= 0) {
		alert("아이디에 공백을 사용할 수 없습니다.")
		return;
	}

	if (id.length < 4 || id.length > 12) {
		alert("아이디는 4~12자로 입력하세요.");
		return;
	}

	for (i = 0; i < id.length; i++) {
		var ch = id.charAt(i);
		if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
				&& !(ch >= 'A' && ch <= 'Z')) {
			alert("아이디는 영어 대소문자, 숫자만 입력가능합니다.");
			return;
		}
	}

	// 비밀번호 유효성 검사
	if (pwd.length < 8 || pwd.length > 20) {
		alert("비밀번호는 8~ 20자로 입력하세요.")
		return;
	}

	if (pwd != pwd2) {
		alert("비밀번호가 일치하지 않습니다.")
		return;
	}

	if (!(/^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/.test(pwd))) {
		alert("비밀번호는 숫자와 영문을 혼용하여야합니다");
		return;
	}

	// 휴대폰번호 유효성검사
	if (!(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/
			.test(phonenumber))) {
		alert("휴대폰번호를 정확히 입력해주세요.");
		return;
	}

	if (confirm("회원가입 하시겠습니까?")) {
		alert("가입이 완료되었습니다.");
	}
	f.submit();

}

function update(f) {
	

	var test_pwd = f.test_pwd.value;
	var test_mail = f.test_mail.value;
	var test_phone = f.test_phone.value;

	if (test_pwd.value == "" || test_phone.value == "" || test_mail.value == "") {
		alert("필수정보를 모두 입력해야합니다.");
		return;

	}

	// 비밀번호 유효성 검사
	if (test_pwd.length < 8 || test_pwd.length > 20) {
		alert("비밀번호는 8~ 20자로 입력하세요.")
		return;
	}

	if (!(/^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/.test(test_pwd))) {
		alert("비밀번호는 숫자와 영문을 혼용하여야합니다");
		return;
	}

	// 휴대폰번호 유효성검사
	if (!(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/
			.test(test_phone))) {
		alert("휴대폰번호를 정확히 입력해주세요.");
		return;
	}

	if (confirm("수정하시겠습니까?")) {
		alert("완료되었습니다.");
		f.submit();
	} else {
		location.href = "test.login_page";

	}
}