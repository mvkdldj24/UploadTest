
	<div style="margin-top: 150px; margin-left: 18%; ">
		<h1 style="margin-left: 30%; font-size: 45px;">회원 LIST</h1><br>
		
		<table style="border: 1PX SOLID black;">
			<thead style="text-align: center;">

				<tr style="text-align: center; background-color: pink; font-size: 20px; border: 1px solid black;">
					<th style="width: 80px; text-align: center;">순번</th>
					<th style="width: 150px; text-align: center;">이름</th>
					<th style="width: 200px; text-align: center;">아이디</th>
					<th style="width: 200px; text-align: center;">패스워드</th>
					<th style="width: 200px; text-align: center;">핸드폰번호</th>
					<th style="width: 400px; text-align: center;">주소</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${list}">
				<tbody>
					<tr style="text-align: center; font-size: 20px;">
						<td>${i.MBR_NO}</td>
						<td>${i.MBR_NM}</td>
						<td>${i.MBR_ID}</td>
						<td>${i.MBR_PW}</td>
						<td>${i.MBR_TEL}</td>
						<td>${i.MBR_ADDR}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
