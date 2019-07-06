
	
	<form action="/ex_project/ctr/sale_insert" method="POST" style="margin-top: 150px;">
	
	<h1 style="margin-left: 43%; color: blue; font-weight: bolder;">상품판매</h1>
		<table style="border: 1px solid black; margin-left: 40%; margin-top: 10px;">
				<tr>
					<td style="width: 120px; font-size: 30px; text-align: center; border: 1px solid gray;">회원명</td>
					<td style="width: 140px; font-size: 30px; text-align: center; border: 1px solid gray;">구매상품</td>
					
				</tr>

			<tr>
				<td>
				<select name="mbr_no" style="width: 120px; height: 30px; border: 1px solid gray;">
						<c:forEach var="i" items="${mlist}">
							<option value="${i.MBR_NO}">${i.MBR_NM}</option>
						</c:forEach>
				</select></td>

				<td>
				<select name="goods_no" style="width: 140px; height: 30px; border: 1px solid gray;">
						<c:forEach var="i" items="${glist}">
							<option value="${i.GOODS_NO}">${i.GOODS_NM}</option>
						</c:forEach>
				</select></td>


				<td hidden=""><input type="hidden" name="sale_time"
					value="<%java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MM'/'dd'일' HH'시' mm'분'");
			String today = formatter.format(new java.util.Date());

			out.println(today);%>">
			
				</td>
				<tr>

				<td colspan="2"><input type="submit" value="등록" style="width:260px; height:42px;"></td>
			</tr>

		</table>
	</form>
</body>
</html>