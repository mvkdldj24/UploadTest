$(document).ready(function() {
	// 연락처
	$("input.m_rtel").hide();
	$("h5.m_rtel").hide();
	$("input.m_tel").click(function() {
		$("input.m_rtel").show();
		$("h5.m_rtel").show();
	});
	$("input#c_m_rtel").click(function() {
		$("input.m_rtel").hide();
		$("h5.m_rtel").hide();
	});
	// 메일
	$("input.m_rmail").hide();
	$("h5.m_rmail").hide();
	$("input.m_mail").click(function() {
		$("input.m_rmail").show();
		$("h5.m_rmail").show();
	});
	$("input#c_m_rmail").click(function() {
		$("input.m_rmail").hide();
		$("h5.m_rmail").hide();
	});

	// 주소
	$("input.m_raddr").hide();
	$("h5.m_raddr").hide();
	$("input.m_addr").click(function() {
		$("input.m_raddr").show();
		$("h5.m_raddr").show();
	});
	$("input#c_m_raddr").click(function() {
		$("input.m_raddr").hide();
		$("h5.m_raddr").hide();
	});

	// 비밀번호
	$("input.m_rpwd").hide();
	$("label.m_rpwd").hide();
	$("input.m_pwd").click(function() {
		$("input.m_rpwd").show();
		$("input.m_rpwd").show();

	});
	$("input#c_m_rpwd").click(function() {
		$("input.m_rpwd").hide();
		$("label.m_rpwd").hide();
	});
});