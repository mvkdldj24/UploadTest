function idCheck(){
	if(document.frm.si_id.value == ""){
		alert('아이디를 입력해 주세요!!!!!');
		document.frm.si_id.focus();
		return;
	}
	var url = "/hmrental/main/idcheck?si_id=" + document.frm.si_id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=450, height=200");
}

function idok(){
	opener.frm.si_id.value=document.frm.si_id.value;
	opener.frm.reid.value=document.frm.si_id.value;
	self.close();
}
