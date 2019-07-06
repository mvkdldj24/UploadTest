<script type="text/javascript" src="<c:url value='/js/idCheck.js'/>"></script>

<div class="container text-center" style="font-weight: bolder;">
   <div id="dt">
      <c:url value="/main/signup" var="insert" />
      <form action="${insert}" method="post" name="frm">
         <h1>회원 가입</h1>
         <ul class="si_ul">
            <li id="li_sign"><label class="lb_sign">아이디</label></li>
            <li id="li_sign">
            	<input type="text" name="si_id" placeholder=" id" required="required" style="width: 210px; margin-right: 5px;"/>
            	<input type="hidden" name="reid" size="20" />
            	<input type="button" value="중복 체크" onclick="idCheck()" style="width: 80px;" />
            	<br/>
            </li>

            <li id="li_sign"><label class="lb_sign">비밀번호</label></li>
            <li id="li_sign"><input type="password" name="si_pass"
               placeholder=" Password" required="required" /></li>

            <li id="li_sign"><label class="lb_sign">이름</label></li>
            <li id="li_sign"><input type="text" name="si_name"
               placeholder=" 홍길동" required="required" /></li>

            <li id="li_sign"><label class="lb_sign">생년월일</label></li>
            <li id="li_sign"><input type="text" name="si_birth"
               placeholder=" 940109" required="required" numberOnly/></li>

            <li id="li_sign"><label class="lb_sign">성별</label></li>
            <li id="li_sign" class="li_ra"><input type="radio"
               name="si_gender" required="required" checked="checked" value="남"
               style="width: 16px; height: 16px;" /> 남</li>
            <li id="li_sign" class="li_ra"><input type="radio"
               name="si_gender" required="required" value="여"
               style="width: 16px; height: 16px;" /> 여</li>
            
            <li id="li_sign"><label class="lb_sign">주소</label></li>
            <li id="li_sign"><input type="text" name="si_addr"
               placeholder=" 충남 천안시 서북구 두정동 424-4" required="required" /></li>

            <li id="li_sign"><label class="lb_sign">전화번호</label></li>
            <li id="li_sign"><input type="text" name="si_phone"
               placeholder=" 010-1234-5678" required="required" /></li>

            <li id="li_sign"><label class="lb_sign">E-mail</label></li>
            <li id="li_sign"><input type="text" name="si_email"
               placeholder=" love@naver.com" required="required" /></li>
         </ul>
         <ul class="si_ul">
            <li class="btn_form" id="li_sign"><button type="submit"
                  class="btn btn-success" style="margin-left: 150px; margin-top: -10px;">가입</button></li>
            <li class="btn_form" id="li_sign"><button
                  onclick="history.go(-1);"
                  class="btn btn-danger">취소</button>
         </ul>
      </form>
   </div>
</div>

<script type="text/javascript">
	$("input:text[numberOnly]").on("keyup", function() {
       $(this).val($(this).val().replace(/[^0-9]/g,""));
   });
</script>
