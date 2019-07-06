

	<div style="margin-top: 150px; margin-left: 35%;">
	 <h1>회원 상세 정보</h1>
		<table style="border: 1px solid black;"> 
			<thead >
				<tr style="text-align: center; font-size: 25px;">
					<th style="width: 132px; text-align: center">회원번호</th>
					<th style="width: 100px; text-align: center">이름</th>
					<th style="width: 150px; text-align: center">아이디</th>
					<th style="width: 150px; text-align: center">비밀번호</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${list}">
				<tbody style="text-align: center; font-size: 20px;">
					<tr>
						<td>${i.MBR_NO}</td>
						<td>${i.MBR_NM}</td>
						<td>${i.MBR_ID}</td>
						<td>${i.MBR_PW}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>

</body>
</html>