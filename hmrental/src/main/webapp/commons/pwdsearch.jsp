<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
		style="width: 350px; height: 180px; background: #E6E6E6; border-radius: 5px;">
		<h2 style="text-align: center;">비밀번호 찾기</h2>
		<c:url value="/main/pwdsearch" var="pwdsearch" />
		<form action="${pwdsearch}" method="post">
			<table>
				<tr>
					<th>아 이 디:</th>
					<td><input type="text" name="si_id" style="height: 20px;"></td>
					<td rowspan="3"><input type="submit" value="검색"
						style="height: 90px; width: 60px; vertical-align: middle; font-weight: bolder;" /></td>
				</tr>
				<tr>
					<th>이 름 :</th>
					<td><input type="text" name="si_name" style="height: 20px;"></td>
				</tr>
				<tr>
					<th>생년월일 :</th>
					<td><input type="text" name="si_birth" style="height: 20px;"
						maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></td>
				</tr>
				<c:if test="${param.result == '0'}">
					<tr>
					<th colspan="2">비밀번호를 찾을수 없습니다!!</th>
					</tr>
				</c:if>
				<c:if test="${param.result == '1'}">
				    <tr>
				    <th>비밀번호 : </th>
				    <td>${param.pwd}</td>
				    </tr>
				 </c:if>
				 </table>
	</form>
	</div>
</body>
</html>