<style>
.card-img-top { width: 259px !important; height: 299px !important;}
.txt {padding: 15px 20px;height: 62px;background: #f6f6f6;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd;
	transition: border-color .2s;-webkit-transition: border-color .2s;-moz-transition: border-color .2s;-o-transition: border-color .2s;}
.container {font-family:'gotum'; margin-top : 50px;}
</style>

<!-- Page Features -->
<div class="container text-center">
	<div class="row text-center" >
		<c:forEach var="i" items="${ft_list}">
			<div class="col-lg-3 col-md-6 mb-4"
				style="width: 292px; margin-bottom: 40px;">
				<div class="card h-100" style="border: 1px solid gray;">
					<c:url value="/sidemain/dtview/ft/${i.P_NUM}" var="dtv" />
					<form action="${dtv}" method="get">
						<input type="hidden" name="FT_CODE" value="${i.FT_CODE}" />
						<button style="border: 0px; padding: 0;width: 259px;">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/img/furniture/${i.P_PHOTO}">
							<div class="txt">
								<p class="name">${i.P_NAME}</p>
							</div>
						</button>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
	<ul class="pagination">
	<!-- 페이징 --> 
	    <li class="page-item" id="p_first">
	    	<c:if test="${1 <= group_npage}">
	    		<a class="page-link" href="1"><<</a>
    		</c:if>
	    </li>
	    <li class="page-item">
	    	<c:if test="${1 < group_npage}">
				<a class="page-link" href="${group_npage-1}"><</a>	
			</c:if>
	    </li>
	    <li>
	    <c:forEach begin="${group_spage}" end="${group_epage}" var="i" step="1">
			
			<c:if test="${i == param.pnum}">${i}</c:if>
				<c:if test="${i != param.pnum}">
				<a class="page-link" href="${i}">${i}</a>
 					</c:if>
		</c:forEach>
		</li>
		<li class="page-item">
	    	<c:if test="${group_npage < all_epage}">
				<a class="page-link" href="${group_npage+1}">></a>	
			</c:if>
	    </li>
	    <li class="page-item">
	    	<c:if test="${group_npage < all_epage}">
				<a class="page-link" href="${all_epage}">>></a>	
			</c:if>
	    </li>
	</ul>
</div>