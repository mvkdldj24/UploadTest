
<style>
   input { font-size: 20px; width: 124px; height: 30px; text-align: left; border: 1px solid green; margin-left: 10px;}
   #td22{ text-align: left;}
   #tdd1{ background: #D8D8D8;}
</style>
<div class="container text-center">
   <h1 style="border-bottom:2px solid red; padding-bottom:10px; "> 결제 페이지</h1>
   <c:url value="/company/pay" var="payform" />
   <form action="${payform}" method="post">
      <input type="hidden" name="p_num" value="${p_num}" />
      <table style="margin: 60px 0px 60px 25%;">
      <tr class="info_box" style="border-top: 1px dotted gray;">
   
         <td style="padding: 16px;" id="tdd1">월청구금액</td><td style="color:red; text-align:right;" colspan="1">${price}</td><td style="width: 100px;"> 원 / 월</td>
      </tr>
      <tr style="border-top: 1px dotted gray;">
         <td style="padding: 16px; width:220px;" id="tdd1"><label for="card company">카드사</label></td>
         <td class="company" colspan="2" id="td22"><select id="card_comp" name="pa_comp"
            size="1" style="margin-left: 10px;">
               <option value="카드">카드선택</option>
               <option value="하나은행">하나</option>
               <option value="기업은행">기업</option>
               <option value="우리은행">우리</option>
               <option value="농협">농협</option>
               <option value="삼성카드">삼성</option>
               <option value="국민은행">국민</option>
         </select></td>
      </tr>
      <tr style="border-top: 1px dotted gray;">
         <td style="padding: 16px;" id="tdd1">예금주명</td>
         <td colspan="2" id="td22"><input type="text" name="pa_name" placeholder="이름 입력" required="required" /></td>
      </tr>
      
      <tr style="border-top: 1px dotted gray;">
         <td style="padding: 16px;" id="tdd1">카드번호</td>
         <td id="cnum" colspan="2" style="font-size:20px;">
            <input class="cn" type="text" name="pa_cnum1" maxlength="4" required="required" numberOnly/> -
            <input class="cn" type="password" name="pa_cnum2" maxlength="4" required="required" numberOnly/> -
            <input class="cn" type="password" name="pa_cnum3" maxlength="4" required="required" numberOnly/> -
            <input class="cn" type="text" name="pa_cnum4" maxlength="4" required="required" numberOnly/>
         </td>
      </tr>
      <tr style="border-top: 1px dotted gray;">
         <td style="padding: 16px; " id="tdd1">카드비밀번호</td>
         <td colspan="2" id="td22"><input type="password" name="pa_pass" maxlength="4" placeholder="4자리" required="required" numberOnly/></td>
      </tr>
      <tr style="border-top: 1px dotted gray;">
         <td style="padding: 16px;" id="tdd1">카드유효기간</td>
         <td colspan="2" id="td22" Style="font-size: 20px;"><input class="cd" type="text" name="pa_cdate1"
            maxlength="2" placeholder="MM" required="required" numberOnly /> /<input class="cd" type="text" name="pa_cdate2" maxlength="2"
            placeholder="YY" required="required" numberOnly/></td>
      </tr>
      <tr style="border-top: 1px dotted gray;">
         <td colspan="3"><br/><input type="submit" value="결 제 하 기" style="font-family: sans-serif; width: 350px; background: #FE2E2E; color: white;  text-align:center; border-radius: 10px; height: 50px; font-weight: bolder; font-size: 20px;"></td>
      </tr>
      </table>
   </form>
</div>
<script type="text/javascript">
   $("input:text[numberOnly]").on("keyup", function() {
       $(this).val($(this).val().replace(/[^0-9]/g,""));
   });
   $("input:password[numberOnly]").on("keyup", function() {
       $(this).val($(this).val().replace(/[^0-9]/g,""));
   });
</script>