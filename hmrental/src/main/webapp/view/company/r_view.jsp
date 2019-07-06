<style>
#gi { height: 50px; }
#aa { width: 140px; }
.goods { font-size: 25px; color: #2a2a2a; line-height: 1.2em; font-weight: 600; letter-spacing: -1px; margin-bottom: 15px; }
.listResult { padding: 20px; background: #eee; height: 70px;}
.listResult .sum { float: left; width: 45%; font-size: 22px;}
#tel_in {width: 55px; height: 35px;}
#btn_pay{font-family: sans-serif; width: 150px; background: #01DF3A; color: white; border-radius: 10px; height: 50px; font-weight: bolder; font-size: 20px;}
#btn_back{font-family: sans-serif; width: 150px; background: #FE2E2E; color: white; border-radius: 10px; height: 50px; font-weight: bolder; font-size: 20px;}
</style>

<div class="container">
   <c:url value="/company/pay" var="pay" />
   <form action="${pay}" method="get">
   <div>
      <h3 class="goods">렌탈상품 정보</h3>
      <table style="border-top: 2px solid red; width: 100%;">
         <thead>
            <tr id="gi"
               style="background-color: #F2F2F2; font-weight: 800; border-bottom: 1px solid #BDBDBD;">
               <td style="width: 40%;" colspan="2">상품정보</td>
               <td style="width: 20%;">기타</td>
               <td style="width: 20%;">렌탈기간</td>
               <td style="width: 20%;">월 렌탈료</td>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="j" items="${b_list}">
            <tr style="border-bottom: 1px solid #BDBDBD; height: 140px;">
               <c:choose>
                  <c:when test="${j.HA_CODE > 0}">
                     <td style="width: 150px;"><img
                        src="${pageContext.request.contextPath}/img/HA/${j.P_PHOTO}" 
                        id="imgarea" style="width: 110px; height: 110px; border: 1px solid #D8D8D8; text-align: left; padding: 5px;"></td>
                  </c:when>
                  <c:when test="${j.FT_CODE > 0}">
                     <td style="width: 150px;"><img
                        src="${pageContext.request.contextPath}/img/furniture/${j.P_PHOTO}" id="imgarea" style="width: 110px; height: 110px; border: 1px solid #D8D8D8; text-align: left; padding: 5px;"></td>
                  </c:when>
                  <c:when test="${j.H_CODE > 0}">
                     <td style="width: 150px;"><img
                        src="${pageContext.request.contextPath}/img/health/${j.P_PHOTO}"
                        id="imgarea" style="width: 110px; height: 110px; border: 1px solid #D8D8D8; text-align: left; padding: 5px;"></td>
                  </c:when>
               </c:choose>
   
               <td style="color: #424242;">
                  <h4>
                     <b>${j.P_NAME}</b>
                  </h4>
               </td>
               <td></td>
               <td style="font-weight: bold; color: #424242;"><h4>${j.B_MONTH} 개월</h4></td>
               <td style="font-weight: bold; color: #424242;"><h4>월<fmt:formatNumber pattern="###,###,###" value="${j.B_SUM}" />원</h4></td>      
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <div class="listResult" style="text-align: right;">
         <div class="sum" style="margin-left: 620px;">
            <b>총 합계 : </b><b style="color: red;">
               <c:set var = "total" value="0" />
                     <c:forEach var="t" items="${b_list}" varStatus="status">
                        <c:set var="total" value="${total + t.B_SUM}"/>
                     </c:forEach>
                     <fmt:formatNumber pattern="###,###,###" value="${total}" />
                     </b> 원
         </div>
      </div>

   </div>
   <div class="tbl-wrap">
      <table style="width: 100%;">
         <thead>
            <tr>
               <th colspan="2" style="text-align: left;"><h3 class="goods">배송 정보</h3></th>
            </tr>
         </thead>
         <tbody>
            <tr style="height: 50px; border-bottom: 1px solid gray; border-top: 2px solid red;">
               <th style="margin-left: 30px; background: #F2F2F2; width: 200px;"><label
                  style="text-align: left; padding-left: 15px;">수령인<em
                     style="color: red;">*</em></label></th>
               <td style="text-align: left;">
               <input type="text" name="i_name" style="margin-left: 20px; width: 200px; height: 35px;" required="required"></td>
            </tr>
            <tr style="height: 50px; border-bottom: 1px solid gray;">
               <th style="margin-left: 30px; background: #F2F2F2; width: 200px;">
                  <label style="text-align: left; padding-left: 15px;">연락처
                     <em style="color: red;">*</em>
                  </label>
               </th>
               <td style="text-align: left;">
               <input type="text" id="tel_in" style="margin-left: 20px;" name="tel_1" maxlength="4" required="required">
                - <input type="text" id="tel_in" name="tel_2" maxlength="4" required="required">
                 - <input type="text" id="tel_in" name="tel_3" maxlength="4" required="required"></td>
            </tr>
   
            <tr style="height: 50px; border-bottom: 1px solid gray;">
               <th style="margin-left: 30px; background: #F2F2F2; width: 200px;"><label
                  style="text-align: left; padding-left: 15px;">주소<em
                     style="color: red;">*</em></label></th>
               <td style=" text-align: left;"><input type="text" name="i_addr"
                  style="margin-left: 20px; width: 500px; height: 35px;" required="required"></td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
            <td colspan="4" width="100%" height="50%" align="center">
				<p align="left">
					<span style="padding-left: 160px"><h2>휴먼렌탈 약관동의</h2></span>
				</p>
				<textarea rows="20" cols="140">가. 수집하는 개인정보의 항목첫째, 원활한 고객상담, 각종 서비스의 제공을 위해 렌탈신청시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.

  회원가입
	- 이름, 생년월일, 성별, 아이디, 비밀번호,연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
  만14세 미만 아동 회원가입 
	- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
  단체아이디 회원가입 
	- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
	- 선택항목 : 대표 홈페이지, 대표 팩스번호
  둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
	- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
  셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
  넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다. 
	  - 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
	  다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
	  - 신용카드 결제시 : 카드사명, 카드번호 등
	  - 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
	  - 계좌이체시 : 은행명, 계좌번호 등
	  - 상품권 이용시 : 상품권 번호

  나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
	  - 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
	  - 협력회사로부터의 제공 
	  - 생성정보 수집 툴을 통한 수집
				</textarea><br /> 
				<span> <input type="radio" name="req" id="ra_req" style="width: 20px;" required="required">
					<br /> 개인정보 수집 및 이용에 동의합니다.
            	</span>
            	</td>
        	</tr>
        	</tfoot>
		</table>
		<div style="text-align: center; margin-bottom: 20px;">
        	<button type="submit" id="btn_pay" >결제하기</button>
        	<button onclick="history.go(-1);" id="btn_back"">취소</button>
      </div>
   </div>
   </form>
</div>