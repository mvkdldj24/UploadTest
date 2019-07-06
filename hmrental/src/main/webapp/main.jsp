<%@ include file="/view/incs/top.jspf" %>
<div class="container text-center" style="width: 100%; padding : 0px;">
<div class="slideshow-container">
	<div class="mySlides fade">
		<div class="numbertext">1 / 3</div>
		<c:url value="/sidemain/HA/tv/1" var="ref" />
		<a href="${ref}" class="w3-bar-item w3-button" style="padding : 0px; height: 700px;">
		<img src="${pageContext.request.contextPath}/img/main_ha.jpg" style="width: 100%; height: 100%;"></a>
	</div>

	<div class="mySlides fade">
		<div class="numbertext">2 / 3</div>
		<c:url value="/sidemain/FT/b/1" var="b" />
		<a href="${b}" class="w3-bar-item w3-button" style="padding : 0px; height: 700px;">
		<img src="${pageContext.request.contextPath}/img/main_ft.jpg" style="width: 100%; height: 100%;"></a>
	</div>

	<div class="mySlides fade">
		<div class="numbertext">3 / 3</div>
		<c:url value="/sidemain/H/ch/1" var="ch" />
		<a href="${ch}" class="w3-bar-item w3-button" style="padding : 0px; height: 700px;">
		<img src="${pageContext.request.contextPath}/img/main_h.jpg" style="width: 100%; height: 100%;"></a>
	</div>
	<div style="text-align:center;">
		<span class="dot"></span> 
		<span class="dot"></span> 
		<span class="dot"></span> 
	</div>
</div>
<script type="text/javascript" src="<c:url value='/js/main_silde.js'/>"></script>
</div>

<%@ include file="/view/incs/bottom.jspf" %>