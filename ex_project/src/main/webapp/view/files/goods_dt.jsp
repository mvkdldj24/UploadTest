
<body>
	<div style="margin-top: 150px; margin-left: 30%" >
		<h1> 상품 상세 정보</h1>
		<table style="border: 1px solid black;">
			<thead>
				<tr style="text-align: center; font-size: 25px; border: 1px solid black;">
					<th style="width: 130px; text-align: center;">상품번호</th>
					<th style="width: 130px; text-align: center;">상품이름</th>
					<th style="width: 150px; text-align: center;">가격</th>
					<th style="width: 200px; text-align: center;">원산지</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${list}">
				<tbody style="text-align: center; font-size: 20px;">
					<tr>
						<td>${i.GOODS_NO}</td>
						<td>${i.GOODS_NM}</td>
						<td>${i.GOODS_PR}원</td>
						<td>${i.GOODS_CO}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>

</body>
</html>