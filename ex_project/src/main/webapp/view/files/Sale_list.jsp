	
	<div style="margin-top: 150px; margin-left: 38%;">
	<h1 style="margin-left: 12%">판매 현황</h1>
		<table style="border: 1PX SOLID BLACK;">
			<thead>
				<tr style="text-align: center; font-size: 25px;">
					<th style="width: 50px; text-align: center;" >No</th>
					<th style="width: 80px; text-align: center;">이름</th>
					<th style="width: 150px; text-align: center;">판매종류</th>
					<th style="width: 150px; text-align: center;">판매시간</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="i" items="${list}">
					<tr style="text-align: center; font-size: 20px;">
						<td style="width: 50px; ">${i.STORE_NO}</td>
						<td style="width: 80px;">
						<a href="/ex_project/ctr/mbr_dt?mbr_no=${i.MBR_NO}">${i.MBR_NM} </a>
						</td>
						
						<td style="width: 150px;">
						<a href="/ex_project/ctr/goods_dt?goods_no=${i.GOODS_NO}">${i.GOODS_NM}</a>
						</td>
						<td style="width: 200px;">${i.SALE_TIME}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		
		<ul>
		<li>
			<c:url value="/ctr/m_g_select" var="i" />
				<a href="${i}" style="text-decoration: none; font-size: 30px; color: blue;">판매 등록</a></li>
		<li>
			<c:url value="/view/files/goods_insert.jsp" var="i" />
				<a href="${i}" style="text-decoration: none; font-size: 30px; color: blue;">상품 등록</a></li>
		</ul>
		</div>	
</body>
</html>