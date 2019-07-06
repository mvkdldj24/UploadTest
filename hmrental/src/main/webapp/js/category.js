function setCategory2() {
	form = document.search;
	if (document.search.category1.value == 1) {
		form.category2.length = 1;
		form.category2.options[1] = new Option("냉장고");
		form.category2.options[1].value = 1;
		form.category2.options[2] = new Option("김치냉장고");
		form.category2.options[2].value = 2;
		form.category2.options[3] = new Option("TV");
		form.category2.options[3].value = 3;
		form.category2.options[4] = new Option("세탁기");
		form.category2.options[4].value = 4;
	}

	if (document.search.category1.value == 2) {
		form.category2.length = 1;
		form.category2.options[1] = new Option("침대");
		form.category2.options[1].value = 1;
		form.category2.options[2] = new Option("쇼파");
		form.category2.options[2].value = 2;
		form.category2.options[3] = new Option("식탁");
		form.category2.options[3].value = 3;
	}
	if (document.search.category1.value == 3) {
		form.category2.length = 1;
		form.category2.options[1] = new Option("안마의자");
		form.category2.options[1].value = 1;
		form.category2.options[2] = new Option("이미용기");
		form.category2.options[2].value = 2;
		form.category2.options[3] = new Option("사우나");
		form.category2.options[3].value = 3;
		form.category2.options[4] = new Option("다기능매트");
		form.category2.options[4].value = 4;
	}
}