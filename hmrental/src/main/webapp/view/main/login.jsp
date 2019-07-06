<script type="text/javascript" src="<c:url value='/js/search.js'/>"></script>

<div class="container text-center">

   <c:url value="/company/login" var="login" />
   <form action="${login}" method="post">
      <div class="log" style="margin-top: 100px; margin-bottom: 300px;">
         <h1>Login</h1>
         <ul class="login_ul">
            <li><label id="loglabel">ID</label>
            	<input type="text" name="si_id" id="login_input" placeholder=" 아이디를 입력하세여" required="required" /></li>
            <li><label id="loglabel">PW</label>
            	<input type="password" name="si_pass" id="login_input" placeholder=" 비밀번호를입력하세요" required="required" /></li>
         </ul>
         <ul class="login_ul">
            <li style="font-size: 15px; margin-top: -20px; margin-bottom: 5px; margin-left: 63px;"><c:url value="/main/signup" var="signup" />
				<a href="${signup}"> 회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#" onclick="idsearch()">아이디 찾기</a> &nbsp;&nbsp;|&nbsp;&nbsp; 
				<a href="#" onclick="pwdsearch()">비밀번호 찾기</a>
			</li>
            <li>
               <button type="submit" class="btn btn-info" id="btn_login">로그인</button>
            </li>
       	  </ul>
      </div>
   </form>
</div>