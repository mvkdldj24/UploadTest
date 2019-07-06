<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
ul {
	list-style-type: none;
}

li {
	display: inline;
	float: left;
	margin: 10px;
	border: 1px solid black;
	width: 170px;
	height: 130px;
}
</style>
</head>
<body>
	<div style="width: 1000px; height: 400px; border: 1px solid black; margin: auto;">
		<ul>
			<c:forEach var="i" items="${list}">
				<li>
					<div>
					<img src="resources/${i.p_mname}">
					
					
					</div>
					<p>${i.p_name}</p>
									
					<p>${i.p_price}</p>
				</li>
			</c:forEach>
		</ul>
	</div>



</body>
</html>