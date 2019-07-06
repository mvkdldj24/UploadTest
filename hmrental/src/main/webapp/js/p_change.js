$('#amount').change(function() {
	var sp = $('#selectop').val();
	var amount = $('#amount').val();
	var sum = $('#sum').val();
	
	sum = amount * sp;
	
	$("#sum").val(sum);
	document.getElementById("ss").innerHTML = Number(sum).toLocaleString();
});

$('#selectop').change(function() {
	var sp = $('#selectop').val();
	var amount = $('#amount').val();
	var sum = $('#sum').val();
	
	sum = amount * sp;
	
	$("#sum").val(sum);
	document.getElementById("ss").innerHTML = Number(sum).toLocaleString();
});
