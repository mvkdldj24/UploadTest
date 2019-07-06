<%@ include file="/view/incs/top.jspf" %>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>HumanRental</title>
<meta charset="UTF-8">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">


</head>
<body style="height: 100%; margin: 0;">
	<!-- header -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
		<c:url value="" var="home" />
			<a href="${home}" class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a>

			<div class="w3-dropdown-hover">

				<c:url value="view/files/login.jsp" var="login" />
				<button class="w3-button w3-black"
					onclick="location.href='${login}'">로그인</button>

				<c:url value="view/files/signup.jsp" var="signup" />
				<button class="w3-button w3-black"
					onclick="location.href='${signup}'">회원가입</button>

				<c:url value="/ctr/mbrlist" var="m_list" />
				<button class="w3-button w3-black"
					onclick="location.href='${m_list}'">회원 LIST</button>

				<c:url value="/ctr/sale_list" var="sale_lists" />
				<button class="w3-button w3-black"
					onclick="location.href='${sale_lists}'">판매현황</button>

				<c:url value="/ctr/m_g_select" var="goods" />
				<button class="w3-button w3-black"
					onclick="location.href='${goods}'">상품 판매</button>

				<c:url value="view/files/goods_insert.jsp" var="goods_insert" />
				<button class="w3-button w3-black"
					onclick="location.href='${goods_insert}'">상품 등록</button>

				<c:url value="/ctr/goods_list" var="goods_list" />
				<button class="w3-button w3-black"
					onclick="location.href='${goods_list}'">상품 리스트</button>

			</div>


			<div>
				<%-- <c:url value="view/files/signup.jsp" var="signup" />
						<a class="w3-button w3-black" href="${signup}"
							style="float: right">회원가입</a>
							
						<c:url value="view/files/login.jsp" var="login" />
						<a class="w3-button w3-black" href="${login}" style="float: right">로그인</a> --%>
			</div>
		</div>
	</div>
	
	<div>
	<h1 style="margin-left: 30%; margin-top: 20%; font-family: fantasy; color: pink; font-size: 120px;">편의점 게시판</h1>
	</div>
</body>
</html>











<%-- <%@ include file="/view/tobo/top.jspf" %>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>

<style type="text/css">
#mdiv > a{
text-decoration: none;
padding: 5px;
margin-bottom: 5px;
}
</style>
</head>
<body>
	
	<c:url value="/ctr/ex" var="messageUrl" />
		<a href="${messageUrl}">test</a><br>
		
		
 <h1 style="margin-left: 37%;">메인</h1>
	<div style="width: 300px; height: 300px; border: 1px solid black; margin-left: 30%; padding: 20px; font-size: 30px; font-weight: bolder;" id="mdiv">
	
		<c:url value="view/files/signup.jsp" var="i" />
		<a href="${i}">회원가입</a><br>

		<c:url value="/ctr/mbrlist" var="i" />
		<a href="${i}">회원 LIST</a><br>

		<c:url value="/ctr/sale_list" var="i" />
		<a href="${i}">판매현황</a><br>

		<c:url value="/ctr/m_g_select" var="i" />
		<a href="${i}">상품 판매</a><br>

		<c:url value="view/files/goods_insert.jsp" var="i" />
		<a href="${i}">상품 등록</a><br>

		<c:url value="view/files/login.jsp" var="i" />
		<a href="${i}">로그인</a><br>
	</div> 
</body>
</html> --%>

