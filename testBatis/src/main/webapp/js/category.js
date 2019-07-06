function setmodel() {

	form = document.search;
	if (document.search.p_company.value == 1) {
		form.p_model.length = 1;
		form.p_model.options[1] = new Option("아반떼");
		form.p_model.options[1].value = 1;
		form.p_model.options[2] = new Option("소나타");
		form.p_model.options[2].value = 2;
		form.p_model.options[3] = new Option("그랜저");
		form.p_model.options[3].value = 3;
		form.p_model.options[4] = new Option("스타렉스");
		form.p_model.options[4].value = 4;
	}

	if (document.search.p_company.value == 2) {
		form.p_model.length = 1;
		form.p_model.options[1] = new Option("모닝");
		form.p_model.options[1].value = 1;
		form.p_model.options[2] = new Option("K3");
		form.p_model.options[2].value = 2;
		form.p_model.options[3] = new Option("K5");
		form.p_model.options[3].value = 3;
		form.p_model.options[4] = new option("K7");
		form.p_model.options[4].value = 4;
	}	
}