<style>
th, td { height: 80px !important;}
#cart_table>thead>tr>th { border: 1px solid #D8D8D8;}
#cart_table>tbody>tr>td { border: 1px solid #D8D8D8; }
#st {float: left; text-align: right; width: 100px;}
.eas {height: 30px; border: 1px solid #D8D8D8;}
#total_p{float: left; font-size: 18px; text-align: right; width: 90px; height: 25px; color: red;}
</style>

<div class="container text-center">
   <h1 Style="margin-left:-30px;">장바구니</h1>
   <br>
   <div>
      <table class="table table-hover" id="cart_table">
         <thead style="border-bottom: 2px solid #DC143C;">
            <tr style="text-align: center;">
               <th style="width: 5%;">번호</th>
               <th colspan="2" style="width: 48%;">상품정보</th>
               <th style="width: 10%;">수량</th>
               <th style="width: 12%;">렌탈기간</th>
               <th style="width: 15%;">월 렌탈료</th>
               <th style="width: 10%;">삭제</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="j" items="${b_list}">
               <tr>
                  <td style="width: 10px; font-weight: bolder;">${j.R}</td>
                  <c:choose>
                     <c:when test="${j.HA_CODE > 0}">
                        <td style="width: 1   0px;"><img
                           src="${pageContext.request.contextPath}/img/HA/${j.P_PHOTO}"
                           id="imgarea"></td>
                     </c:when>
                     <c:when test="${j.FT_CODE > 0}">
                        <td style="width: 100px;"><img
                           src="${pageContext.request.contextPath}/img/furniture/${j.P_PHOTO}"
                           id="imgarea"></td>
                     </c:when>
                     <c:when test="${j.H_CODE > 0}">
                        <td style="width: 100px;"><img
                           src="${pageContext.request.contextPath}/img/health/${j.P_PHOTO}"
                           id="imgarea"></td>
                     </c:when>
                  </c:choose>
                  <td style="width: 250px;"><b style="font-size: 15px;">${j.P_NAME}</b></td>
                  <td><b>
                  	 <input type="hidden" id="sell_price${j.R}" value="${j.B_SUM}">
                     <input type="hidden" id="r" value="${j.R}">
                     <input type="number" min="0" value="${j.B_QUANT}" id="amount${j.R}" class="eas"
                     onchange="change(${j.R});"/> EA</b></td>
                  <td><b style="font-size: 17px;">${j.B_MONTH}개월</b></td>
                  <td style="font-size: 17px;">
                  		<input type="hidden" id="t_sum${j.R}" value="${j.B_SUM}" />
                     	<div id="st"><fmt:formatNumber pattern="###,###,###" value="${j.B_SUM}" /></div>
                     	<b style="float: right;">원/월</b></td>
                  <td><c:url value="/company/delb" var="delet" />
                     <form action="${delet}" method="post">
                        <input type="hidden" name="b_num" value="${j.B_NUM}" />
                        <button type="submit" class="btn_del btn-info"
                           style="border-radius: 20px;">X</button>
                     </form></td>
               </tr>
            </c:forEach>
         </tbody>
         <tfoot style="font-size: 20px; font-weight: bold;">
            <tr>
               <td colspan="4"></td>
               <td style="width: 140px;">주문금액</td>
               <td style="width: 280px;"><c:set var="total" value="0" />
               		<c:forEach var="t" items="${b_list}" varStatus="status">
                    	<c:set var="total" value="${total + t.B_SUM}" />
					</c:forEach>
					<input type="hidden" id="tt" value="<c:out value="${total}" />" />
                  	<div id="total_p">
                    	<fmt:formatNumber pattern="###,###,###" value="${total}" />
                  	</div>
                  	<span style="float: right;">원(월)</span>
               </td>
               <td><c:url value="/company/order" var="pay" />
                  <form action="${pay}" method="post">
                     <button type="submit" class="btn_del btn-info"
                        style="border-radius: 10px;">결제하기</button>
                  </form></td>
            </tr>
         </tfoot>
      </table>
   </div>
</div>
<script type="text/javascript">
// 전체가격 합산
function change(pR) {   
   var sp = $('#sell_price'+ pR).val();
   var amount = $('#amount'+ pR).val();
   var sum = $('#t_sum'+ pR).val();
   var tt = $('#tt').val();  
   var n_sum = amount * sp;
   var total = Number(tt) - Number(sum) + Number(n_sum);
   
   $("#t_sum"+ pR).val(n_sum);
   $('#tt').val(total);
   document.getElementById("st").innerHTML = Number(n_sum).toLocaleString();
   document.getElementById("total_p").innerHTML = Number(total).toLocaleString();
}
</script>