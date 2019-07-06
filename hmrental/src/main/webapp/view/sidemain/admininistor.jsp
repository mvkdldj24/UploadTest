<div class="container">
	<h1>고객 렌탈내역</h1>
	<br>
	<div>
		
		<c:forEach var="d" items="${m_list}">
			<ul id="customer-info">
				<li id="wi">회원번호</li>
				<li>: ${d.SI_NUM}</li>
				<li id="wi">이름</li>
				<li>: ${d.SI_NAME}
					
				</li>
				<li id="wi">ID</li>
				<li>: ${d.SI_ID}</li>
				<li id="wi">전화번호</li>
				<li>: ${d.SI_PHONE}</li>	
			</ul>
		</c:forEach>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th style="width: 80px;">주문번호</th>
					<th colspan="2" style="width: 300px;">상품정보</th>
					<th style="width: 100px;">수량</th>
					<th style="width: 100px;">렌탈기간</th>
					<th style="width: 140px;">월 렌탈료</th>
					<th style="width: 100px;">배송정보</th>
					<c:if test="${'admin' eq loginUser}"><th style="width: 60px;">수정</th></c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list}">
					<tr>
						<td>${i.I_NUM}</td>
						<c:choose>
							<c:when test="${i.HA_CODE > 0}">
								<td style="width: 150px;"><img
									src="${pageContext.request.contextPath}/img/HA/${i.P_PHOTO}"
									id="imgarea"></td>
							</c:when>
							<c:when test="${i.FT_CODE > 0}">
								<td style="width: 150px;"><img
									src="${pageContext.request.contextPath}/img/furniture/${i.P_PHOTO}"
									id="imgarea"></td>
							</c:when>
							<c:when test="${i.H_CODE > 0}">
								<td style="width: 150px;"><img
									src="${pageContext.request.contextPath}/img/health/${i.P_PHOTO}"
									id="imgarea"></td>
							</c:when>
						</c:choose>
						<td>${i.P_NAME}</td>
						<td>${i.B_QUANT}EA</td>
						<td>${i.B_MONTH}개월</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${i.B_SUM}" />원/월</td>
						<c:choose>
							<c:when test="${'admin' eq loginUser}">
								<c:url value="/company/state" var="state" />
           						<form action="${state}" method="post">
              							<input type="hidden" name="b_num" value="${i.B_NUM}" />
									<td>
										<select name="i_state" style="border:0;">
											<option>${i.I_STATE}</option>
											<option value="결제완료">결제완료</option>
											<option value="배송준비">배송준비</option>
											<option value="배송중">배송중</option>
											<option value="배송완료">배송완료</option>
										</select>		
									</td>
									<td>
										<button style="width: 30px; padding: 0; border:0;">
											<img style="width: 30px;" src="${pageContext.request.contextPath}/img/change.jpg" />
										</button> 
									</td>
								</form>
							</c:when>
							<c:otherwise>
								<td>${i.I_STATE}</td>
							</c:otherwise>
						</c:choose>		
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<!-- 페이지 표시영역 -->
				<tr id="paging">
					<c:choose>
						<c:when test="${'admin' eq loginUser}">
							<td colspan="8">
						</c:when>
						<c:otherwise>
							<td colspan="7">
						</c:otherwise>
					</c:choose>
						<ul class="pagination">
							<!-- 페이징 -->
							<li class="page-item" id="p_first"><c:if
									test="${1 <= group_npage}">
									<a class="page-link" href="1"><<</a>
								</c:if></li>
							<li class="page-item"><c:if test="${1 < group_npage}">
									<a class="page-link" href="${group_npage-1}"><</a>
								</c:if></li>
							<li><c:forEach begin="${group_spage}" end="${group_epage}"
									var="i" step="1">
									
									<c:if test="${i == param.pnum}">${i}</c:if>
									<c:if test="${i != param.pnum}">
										<a class="page-link" href="${i}">${i}</a>
									</c:if>
								</c:forEach></li>
							<li class="page-item"><c:if
									test="${group_npage < all_epage}">
									<a class="page-link" href="${group_npage+1}">></a>
								</c:if></li>
							<li class="page-item"><c:if
									test="${group_npage < all_epage}">
									<a class="page-link" href="${all_epage}">>></a>
								</c:if></li>
						</ul>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>