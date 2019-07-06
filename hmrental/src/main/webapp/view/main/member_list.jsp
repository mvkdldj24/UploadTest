<div class="container text-center">
   <h2>회원 리스트</h2>
   <table class="table table-hover">
      <thead>
         <tr>
            <th>이  름</th>
            <th>아 이 디</th>
            <th>전화번호</th>
            <th>이 메 일</th>
            <th>성 별</th>
            <th>주문 내역</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="i" items="${user_list}">
            <tr>
               <td>${i.SI_NAME}</td>
               <td>${i.SI_ID}</td>
               <td>${i.SI_PHONE}</td>
               <td>${i.SI_EMAIL}</td>
               <td>${i.SI_GENDER}</td>
               <td><c:url value="/company/administrator/1" var="admin" />
                  <form action="${admin}" method="get">
                     <input type="hidden" name="SI_ID" value="${i.SI_ID}" />
                     <button style="border-radius:5px; font-weight: bolder; width: 80px;">보기</button>
                  </form>
               </td>
            </tr>         
         </c:forEach>
      </tbody>
      <tfoot>
         <!-- 페이지 표시영역 -->
         <tr id="paging">
            <td colspan="6">
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
                        <!-- í  ì ¬í  ì ´ì§ ë   ë§ í ¬ ì  ì   -->
                        <c:if test="${i == param.pnum}">${i}</c:if>
                        <c:if test="${i != param.pnum}">
                           <a class="page-link" href="${i}">${i}</a>
                        </c:if>
                     </c:forEach></li>
                  <li class="page-item"><c:if test="${group_npage < all_epage}">
                        <a class="page-link" href="${group_npage+1}">></a>
                     </c:if></li>
                  <li class="page-item"><c:if test="${group_npage < all_epage}">
                        <a class="page-link" href="${all_epage}">>></a>
                     </c:if></li>
               </ul>
            </td>
         </tr>
      </tfoot>
   </table>
</div>