<script type="text/javascript" src="<c:url value='/js/category.js'/>"></script>
<style type="text/css">
#detailform { font-weight: bolder; width: 400px; height: 530px; margin-left: 450px; padding: 30px 30px 30px 10px; margin-bottom: 50px; border-radius: 20px; background: #D8D8D8; font-size: 18px; }
li { list-style: none; }
#dlabel { width: 100px; }
input { width: 200px; border-radius: 10px; height: 40px; text-align: center; }
li { padding-bottom: 7px; }
select>option { font-weight: bold; }
#sele { width: 98px; height: 40px; font-size: 15px; border-radius: 10px; margin-left: -6px; margin-right: 5px; }
</style>

   <h2 style="text-align: center; margin-top: 50px; margin-bottom: 15px; margin-left: 40px; font">제품
      등록 페이지</h2>

   <form action="dtinsert" method="POST" id="detailform" name="search">
      <ul class="info_box">

         <li><label id="dlabel">분류</label> <select name="category1"
            onchange="setCategory2()" id="sele">
               <option>선택하세요</option>
               <option value=1>가전</option>
               <option value=2>가구</option>
               <option value=3>헬스</option>
         </select>
         <select name="category2" id="sele">
               <option>선택하세요</option>
         </select>
         <li><label id="dlabel">제&nbsp;목</label><input type="text"
            name="p_name" required="required"></li>
         <li><label id="dlabel">모델명</label><input type="text"
            name="p_mname" required="required"></li>
         <li><label id="dlabel">규격</label><input type="text"
            name="p_brand" required="required"></li>
         <li><label id="dlabel">제조사</label><input type="text"
            name="p_company" required="required"></li>
         <li><label id="dlabel">색&nbsp;상</label><input type="text"
            name="p_color" required="required"></li>
         <li><label id="dlabel">가격</label><input type="text"
            name="p_p36" required="required"></li>         
         <li><label id="dlabel" style="margin-top: 5px;">메인 사진</label><input
            type="file" name="p_mname" multiple="multiple" required="required"
            class="btn btn-secondary"
            style="font-size: 15px; width: 250px; margin-left: 90px; margin-top: -36px; font-weight: bolder;"></li>
         <li><label id="dlabel" style="margin-top: 5px;">상세 사진</label><input
            type="file" name="p_mname" multiple="multiple" required="required"
            class="btn btn-secondary"
            style="font-size: 15px; width: 250px; margin-left: 90px; margin-top: -36px; font-weight: bolder;"></li>
      </ul>
      <input type="submit" value="등록"
         style="margin-left: 140px; margin-bottom: 30px; border-radius: 10px; font-size: 20px;"
         class="btn btn-info">

   </form>
