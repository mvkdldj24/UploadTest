<script type="text/javascript" src="<c:url value='/js/mypage.js'/>"></script>
<div class="container">
	<div style="margin-left: 200px;" id="mypagediv">
	   <h4 style="font-weight: bolder; font-family: fantasy;"> * 내 정보</h4>
	
	   <h5 style="color: gray; font-weight: bold;">내 정보를 수정할 수 있습니다.</h5>
	
	   <br>
	<c:forEach var="i" items="${list}">
	   <table style="font-size: 20px;">
	      <tr style="border-top: 1px solid gray;">
	         <th style="width: 230px; height: 80px;">아이디</th>
	         <td id="mpinfo"
	            style="font-size: 15px; font-weight: bolder; color: #0000FF; width: 250px;">${i.SI_ID}</td>
	         <td style="width: 250px;"></td>
	      </tr>
	      
	      <tr style="border-top: 1px solid gray;">
	         <th style="width: 230px; height: 80px;">이름</th>
	         <td id="mpinfo"
	            style="font-size: 15px; font-weight: bolder; color: #0000FF; width: 250px;">${i.SI_NAME}</td>
	         <td style="width: 250px;"></td>
	      </tr>
	
	
	      <tr style="border-top: 1px solid gray;">
	         <th style="height: 80px;">연락처</th>
	         <td id="mpinfo"
	            style="font-size: 15px; font-weight: bolder; color: #0000FF;">${i.SI_PHONE}</td><td>
	               <input type="button" value="연락처 변경" id="mpbt" class="m_tel"
	               style="margin-bottom: 10px;">
	               
	               <c:url value="/sidemain/myp_phone" var="myp_phone" />
	               <form action="${myp_phone}" method="post">
	                  <h5 class="m_rtel">
	                     <b>변경할 연락처를 입력하세요.</b>
	                  </h5>
	                  <input type="text" class="m_rtel" name="si_phone"
	                     style="width: 220px; margin-bottom: 10px; border-radius: 10px;"><br>
	                  <input type="submit" value="등록" class="m_rtel btn-success"
	                     style="width: 100px;"> 
	                  <input type="button" value="취소"
	                     class="m_rtel btn-danger" id="c_m_rtel" style="width: 100px;">
	               </form>
	            </td>
	         </tr>
	      
	      
	                  
	      
	      <tr style="border-top: 1px solid gray;">
	         <th style="height: 80px;">이메일</th>
	         <td id="mpinfo"
	            style="font-size: 15px; font-weight: bolder; color: #0000FF">${i.SI_EMAIL}</td>
	         <td><input type="button" value="이메일 변경" class="m_mail" id="mpbt">
	         
	         <c:url value="/sidemain/myp_email" var="myp_email"/>
	         <form action="myp_email" method="post">
	         <h5 class="m_rmail"><b>변경할 이메일을 입력하세요 .</b></h5>
	         <input type="text" class="m_rmail" style="width: 220px; margin-bottom: 10px; border-radius: 10px;"name="si_email"><br>
	         <input type="submit" value="등록" class="m_rmail btn-success" style="width: 100px;">
	         <input type="button" value="취소" class="m_rmail btn-danger"id="c_m_rmail" style="width: 100px;">
	         </form>
	         </td>
	      </tr>
	      
	      
	      <tr style="border-top: 1px solid gray;">
	         <th style="height: 80px;">주소</th>
	         <td id="mpinfo"
	            style="font-size: 15px; font-weight: bolder; color: #0000FF;">${i.SI_ADDR}</td>
	         <td><input type="button" value="주소 변경"  class="m_addr" id="mpbt">
	         
	         <c:url value="/sidemain/myp_addr" var="myp_addr"/>         
	         <form action="myp_addr" method="post">
	         <h5 class="m_raddr"><b>변경할 주소를 입력하세요.</b></h5>
	         <input type="text" class="m_raddr" style="width: 220px; margin-bottom: 10px; border-radius: 10px;" name="si_addr"><br>
	         <input type="submit" value="등록" class="m_raddr btn-success" style="width: 100px;">
	         <input type="button" value="취소" class="m_raddr btn-danger"id="c_m_raddr" style="width: 100px;">
	         </form>            
	         </td>
	      </tr>
	      
	      
	      <tr style="border-top: 1px solid gray;">
	      <th style="height: 80px;">비밀번호</th>
	      <td id="mpinfo" style="font-size: 15px; font-weight: bolder; color: gray; width: 285px;">
	      비밀번호 변경시 좌측버튼을 누르시오.</td>
	      
	      <td><br><input type="button" value="비밀번호 변경" class="m_pwd" id="mpbt" style="margin-bottom: 10px;">
	      <c:url value="/sidemain/pwd" var="myp_pwd"/>
	      <form action="myp_pwd" method="post">                  
	      <input class="m_rpwd" type="password" style="width: 220px; margin-bottom: 10px; border-radius: 10px;" placeholder="현재 비밀번호" name="existing_pwd"><br>
	      <input class="m_rpwd" type="password" style="width: 220px; margin-bottom: 10px; border-radius: 10px;" placeholder="새 비밀번호" name="si_pass"><br>
	      
	      <input type="submit" value="등록" class="m_rpwd btn-success" style="width: 100px;">
	      <input type="button" value="취소" class="m_rpwd btn-danger"  id="c_m_rpwd" style="width: 100px;">
	      </form>
	      </td>
	      </tr>
	   </table>
	   </c:forEach>
	</div>
</div>
