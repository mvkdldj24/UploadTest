<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 중복확인</title>
	<script type="text/javascript" src="<c:url value='/js/idCheck.js'/>"></script>
</head>
<body>
	<h2>아이디 중복확인</h2>
	<c:url value="/main/idcheck" var="idcheck" />
	<form action="${idcheck}" method="get" name="frm">
		아이디 <input type="text" name="si_id" value="${param.si_id}" style="width: 150px;"/>
			<input type="submit" value="중복 체크" />
		<br/>
		
		<c:if test="${param.result == 1}">
			<script type="text/javascript">
				opener.document.frm.si_id.value="";
			</script>
			${param.si_id}는 이미 사용 중인 아이디 입니다.
		</c:if>
		<c:if test="${param.result == -1}">
			${param.si_id}는 사용 가능한 아이디입니다.
			<input type="button" value="사용" class="cancel" onclick="idok()"/>
		</c:if>
	</form>
</body>
</html>