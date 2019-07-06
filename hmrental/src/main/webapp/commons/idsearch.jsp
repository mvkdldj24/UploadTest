<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

</head>
<body>
<script type="text/javascript"> 
function inNumber(){
	  if(event.keyCode<48 || event.keyCode>57){
	     event.returnValue=false;
	  }
	}
</script>
	<div
		style="width: 325px; height: 150px; background: #E6E6E6; border-radius: 5px;">
		<h2 style="text-align: center;">아이디 찾기</h2>
		<c:url value="/main/idsearch" var="idsearch" />
		<form action="${idsearch}" method="post">
			<table>
				<tr>
					<th>이 름 :</th>
					<td><input type="text" name="si_name" style="height: 20px;" /></td>
					<td rowspan="2" style="margin-top: 6px;"><input type="submit"
						value="검색" style="height: 57px; width: 60px; font-weight: bold;" /></td>
				</tr>
				<tr>
					<th>생년월일 :</th>
					<td><input type="text" name="si_birth" id="birth" style="height: 20px;"
						maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></td>
				</tr>
				<c:if test="${param.result == '0'}">
				<tr>
					<th colspan="2">해당 아이디가 없습니다!!</th>
				</tr>		
				</c:if>
				<c:if test="${param.result == '1'}">
					<tr>
						<th>아이디 : </th>
						<td>${param.id}</td>
					</tr>				
				</c:if>
			</table>	
		</form>
	</div>
</body>

</html>