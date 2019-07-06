<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/category.js"></script>

<style type="text/css">

#detailform {
	font-weight: bolder;
	width: 400px;
	height: 480px;
	margin-left: 450px;
	padding: 30px 30px 30px 10px;
	margin-bottom: 50px;
	border-radius: 20px;
	background: #D8D8D8;
	font-size: 18px;
}

li {
	list-style: none;
}

#dlabel {
	display: inline-block;
	width: 80px;
}

input {
	width: 200px;
	border-radius: 10px;
	height: 40px;
	text-align: center;
}

li {
	padding-bottom: 7px;
}

select>option {
	font-weight: bold;
}

#sele {
	width: 98px;
	height: 40px;
	font-size: 15px;
	border-radius: 10px;
	margin-left: -6px;
	margin-right: 5px;
}
</style>


</head>
<body>



	<h2	style="text-align: center;">제품 등록 페이지</h2>
	
	<form action="P_insert" method="POST" id="detailform" style="margin: auto;" name="search" enctype="multipart/form-data">
		<ul class="info_box">

			<li><label id="dlabel">분류</label> <select name="p_company"
				onchange="setmodel()" id="sele" >
					<option>선택하세요</option>
					<option value=1>현대</option>
					<option value=2>기아</option>
			</select>
			
			<select name="p_model" id="sele">
				<option>선택하세요</option>
			</select>
			
			<li><label id="dlabel">제&nbsp;목</label><input type="text"
				name="p_title" required="required"></li>
			
			<li><label id="dlabel">연&nbsp;식</label><input type="text"
				name="p_myear" required="required"></li>
				
			<li><label id="dlabel">주&nbsp;행</label><input type="text"
				name="p_drive" required="required"></li>
				
			<li><label id="dlabel">연&nbsp;료</label><input type="text"
				name="p_fuel" required="required"></li>
				
			<li><label id="dlabel">색&nbsp;상</label><input type="text"
				name="p_color" required="required"></li>

			<li><label id="dlabel">가격</label><input type="text" name="p_price"
				required="required"></li>

			<li style="height: 50px;"><label id="dlabel" style="margin-top: 5px;">메인 사진</label> <input
				type="file" name="p_mname" required="required"				
				style="font-size: 15px; width: 250px; margin-left: 90px; margin-top: -36px; font-weight: bolder; position: relative; bottom: 25px;"></li>

			
		</ul>

		<input type="submit" value="등록"
			style="margin-left: 130px; margin-bottom: 30px; border-radius: 10px; font-size: 20px; background: green;">
	</form>



</body>
</html>