	<div style="margin-top: 150px; margin-left: 37%" >
		<h1 style="margin-left: 15%;  color: pink;"> 상품 LIST</h1>
		<table style="border: 1px solid black;">
			<thead style="text-align: center; border: 1px solid black;">
				<tr style="text-align: center; background: pink; font-size: 20px;">
					<th style="width: 100px; text-align: center;">상품번호</th>
					<th style="width: 100px; text-align: center;">상품이름</th>
					<th style="width: 150px; text-align: center;">가격</th>
					<th style="width: 150px; text-align: center;">원산지</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${list}">
				<tbody style="text-align: center;font-size: 20px;">
					<tr>
						<td>${i.GOODS_NO}</td>
						<td>${i.GOODS_NM}</td>
						<td>${i.GOODS_PR}원</td>
						<td>${i.GOODS_CO}</td>
					</tr>
				</tbody>
			</c:forEach>
			
		</table>
	</div><br>
	
	<div style="text-align: center;">
		
		<c:url value="/view/files/goods_insert.jsp" var="i" />
				<a href="${i}" style="text-decoration: none; font-size: 30px; color: blue;">상품 등록</a>
	</div>


