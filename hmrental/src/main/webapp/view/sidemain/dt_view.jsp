<style>
#dtail { margin-left: 600px; width: 49.5%; margin-top: -520px; margin-bottom: 100px; font-size: 15px;}
#selectop>option { color: gray; }
#dtlabel {width: 100px;}
#dtbt {margin-top: 40px; width: 270px; height: 60px; font-weight: bolder; }
#detailname>li { padding-top: 8px; }
#ss {color: red; font-size: 18px;border: none; text-align: right; width: 200px;float: right;}
.eas {width: 50px; border: 1px solid gray; margin-left: -5px; text-align: center; font-weight: bolder;}
#s_u {height: 50px; font-size: 17px; padding-top: 5px; font-weight: bolder; border-bottom: 2px solid black;}
</style>

<div class="container">
	<c:url value="/company/dtinsert" var="dtin" />
	<form action="${dtin}" method="post">
	<p style="width: 500px; height: 500px; margin-top: 60px; margin-left: 20px;">
		<c:choose>
			<c:when test="${dt_list['HA_CODE'] > 0}">
				<img src="${pageContext.request.contextPath}/img/HA/${dt_list['P_PHOTO']}"
					style="padding: 25px 10px 30px 30px; width: 500px; height: 500px">
			</c:when>
			<c:when test="${dt_list['FT_CODE'] > 0}">
				<img src="${pageContext.request.contextPath}/img/furniture/${dt_list['P_PHOTO']}"
					style="padding: 25px 10px 30px 30px; width: 500px; height: 500px">
			</c:when>
			<c:when test="${dt_list['H_CODE'] > 0}">
				<img src="${pageContext.request.contextPath}/img/health/${dt_list['P_PHOTO']}"
					style="padding: 25px 10px 30px 30px; width: 500px; height: 500px">
			</c:when>
		</c:choose>
	</p>

	<!-- 제품상세 -->
	<div id="dtail">
		<p style="border: 1px solid red; width: 50px; text-align: center; color: red; margin-top: 20px;">렌탈</p>
		<input type="hidden" name="p_num" value="${dt_list['P_NUM']}" />
		<input type="hidden" name="p_36" value="${dt_list['P_36']}" />
		<input type="hidden" name="p_48" value="${dt_list['P_48']}" />
		<input type="hidden" name="p_60" value="${dt_list['P_60']}" />
		<h2 class="prod_name"><input type="hidden" name="p_name" value="${dt_list['P_NAME']}" />${dt_list['P_NAME']}</h2>
		<div style="border: 1px solid #BDBDBD;">

			<ul style="height: 60px; font-size: 17px; padding-top: 10px; font-weight: bolder; border-bottom: 1px solid #BDBDBD;">
				<li><label id="dtlabel">렌탈기간</label> 
					<select tyle="width: 400px; height: 40px; font-size: 16px;" id="selectop" name="price" required="required">
						<option value="">선택</option>
						<option style="padding-left: 50px;" value="${dt_list['P_36']}">36개월
							<fmt:formatNumber pattern="###,###,###" value="${dt_list['P_36']}" />원</option>
						<option style="padding-left: 50px;" value="${dt_list['P_48']}">48개월
							<fmt:formatNumber pattern="###,###,###" value="${dt_list['P_48']}" />원</option>
						<option style="padding-left: 50px;" value="${dt_list['P_60']}">60개월
							<fmt:formatNumber pattern="###,###,###" value="${dt_list['P_60']}" />원</option>
				</select></li>
			</ul>

			<ul id="s_u">
				<li><label id="dtlabel" style="float: left;">월렌탈료</label>
					<input type="hidden" id="b_month" readonly />
					<input type="hidden" id="sum" name="sum" readonly />
					<b style="float: right; margin-right: 30px;">원</b>
					<div id="ss" ></div> 
					</li>
			</ul>

			<ul id="detailname">

				<li><label id="dtlabel">모델명</label>
				<input type="hidden" name="p_mname" value="${dt_list['P_MNAME']}"/>
				${dt_list['P_MNAME']}</li>
				<li><label id="dtlabel">규격</label>
				<input type="hidden" name="p_size" value="${dt_list['P_SIZE']}"/>
				${dt_list['P_SIZE']}</li>
				<li><label id="dtlabel">제조사</label>
				<input type="hidden" name="p_company" value="${dt_list['P_COMPANY']}"/>
				${dt_list['P_COMPANY']}</li>
				<li><label id="dtlabel">색상</label>
				<input type="hidden" name="p_color" value="${dt_list['P_COLOR']}"/>
				${dt_list['P_COLOR']}</li>
				<li><label id="dtlabel">수량</label>
					<input type="number" min="0" value="1" name="b_quant" id="amount" class="eas" onchange="change();" />
					개
				</li>
			</ul>

		</div>
		<span><button type="submit" id="dtbt" name="bp" value="basket"style="margin-right: 17px;">장바구니담기</button>
		</span>
		<span>
			<button type="submit" id="dtbt" name="bp" value="pay">렌탈신청하기</button>
		</span>
	</div>
	</form>
	
	<c:if test="${'admin' eq loginUser}">
		<div style="text-align: right; margin-top: -80px; margin-bottom: 50px;">
			<c:url value="/company/p_del" var="p_del" />
			<form action="${p_del}" method="post">
				<input type="hidden" name="p_num" value="${dt_list['P_NUM']}" />
				<button style="width: 50px; padding: 0; border: 0;"><img src="${pageContext.request.contextPath}/img/del.jpg" style="width: 50px;"></button>
			</form>
		</div>
	</c:if>
	
	<h2 style="text-align: center; height: 70px; margin-bottom: -40px;">제품상세정보</h2>
	<hr style="border: 1px solid gray; margin-bottom: 70px;">

	<div style="text-align: center; margin-bottom: 40px;">
		<c:forEach var="x" items="${list}">
			<c:choose>
				<c:when test="${x.HA_CODE > 0}">
					<img style="width: 100%; height: 100%;" src="${pageContext.request.contextPath}/img/HA/${x.F_FILE}">
				</c:when>
				<c:when test="${x.FT_CODE>0}">
					<img style="width: 100%; height: 100%;"  src="${pageContext.request.contextPath}/img/furniture/${x.F_FILE}">
				</c:when>
				<c:when test="${x.H_CODE > 0}">
					<img style="width: 100%; height: 100%;" src="${pageContext.request.contextPath}/img/health/${x.F_FILE}">
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
</div>

<script type="text/javascript" src="<c:url value='/js/p_change.js'/>"></script>