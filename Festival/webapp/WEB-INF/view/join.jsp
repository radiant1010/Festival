<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
      <title>JOIN</title>
      <link rel="stylesheet" type="text/css" href="/css/reset.css">
      <link rel="stylesheet" type="text/css" href="/css/style(sub).css">
      <style>
@media screen and (max-width: 767px) {
   .join_table table tr td input.call {
      width: 30%;
   }
   .join_table table tr td span.small {
      margin-left: 1%;
      font-size: 16px;
      color: #666;
      height: 13px;
   }
   .join_table table tr td input {
      padding: 5px;
      border: 1px solid #ddd;
      width: 100%;
   }
}
</style>
      <script src="/js/jquery-1.12.4.js"></script>
      <script type="text/javascript">
      $(function(){ 
         //전체선택 체크박스 클릭
         $("#chk3").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
            if($("#chk3").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
               $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
            }else { //해당화면에"C:/Users/kosta/Desktop/join.jsp" 모든 checkbox들의 체크를해제시킨다. 
               $("input[type=checkbox]").prop("checked",false); 
            } 
         });
         //정규표현식
         $("#memberId").keyup(function(event){ 
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
            }
         });
         $("#memberName").keyup(function(event){ 
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
               var inputVal = $(this).val();
               $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
               }
         });
         $("#hp1").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
               var inputVal = $(this).val();
               $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
         });
         $("#hp2").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
               var inputVal = $(this).val();
               $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
         });
         $("#hp3").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
               var inputVal = $(this).val();
               $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
         });
      });
      

      //ID 중복확인
      function doubleCheck(){
         if(document.memberForm.memberId.value == ""){
            alert("ID를 입력해주세요");
         }else{
            $.ajax({
               type : "post",
               url : "/member/joinDoubleCheckProc.do",
               data : {
                  memberId : $("#memberId").val()
               },
               dataType : "json",
               success : function(data){
                  console.log(data);
                  if(data.result == "ok"){
                     alert("사용할 수 없는 ID입니다.");
                     $("#memberId").focus();
                     
                  }else{
                     alert("사용할 수 있는 ID입니다.");
                     
                  }
               },
               error : function(xhr, status, error){
                  console.log(xhr);
                  alert("error\nxhr : " + xhr+ ", status"+status+", error : "+error);
               }
               
            });
            
         }
      };
      
      function post_check(){
        // 비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 6~16자리)
        var ObjUserPassword = document.memberForm.memberPw;
        var ObjUserPasswordRe = document.memberForm.memberPw2;
       
        if(ObjUserPassword.value != ObjUserPasswordRe.value)
        {
         alert("입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다");
         return false;
        }
       
        if(ObjUserPassword.value.length<6) {
          alert("비밀번호는  6~16자까지 입력하세요.");
          return false;
        }
       
        if(!ObjUserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
          alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여, 영문은 대소문자를 구분합니다.");
          return false;
        }
        return true;
        
      }
      function insertMember() {
         var memberForm = document.memberForm;
         if(memberForm.memberId.value==""){
            alert("ID를 입력해주세요");
            $("#memberId").focus();
         }else if(memberForm.memberPw.value==""){
            alert("패스워드를 입력해주세요");
            $("#memberPw").focus();
         }else if(memberForm.memberName.value==""){
            alert("이름을 입력해주세요");
            $("#memberName").focus();
         }else if(memberForm.hp1.value==""||memberForm.hp2.value==""||memberForm.hp3.value==""){
            alert("전화번호를 입력해주세요");
            $("#hp1").focus();
         }else if($("#memberAge").val() == ""){
            alert("나이를 선택해주세요");
         }else if($(':radio[name="gender"]:checked').length < 1){
            alert("성별을 선택해주세요");
         }else if(!memberForm.chk[0].checked || !memberForm.chk[1].checked){
            alert("약관에 동의해주세요");
         }else{
            if(post_check()){
               
               //통합
               var hp = $("#hp1").val() + "-" + $("#hp2").val() + "-" + $("#hp3").val();
               $("#memberPhone").val(hp);
               
               $.ajax({
                  type : "post",
                  url : "/joinProc.do",
                  data : {
                     memberId : $("#memberId").val(),
                     memberPw : $("#memberPw").val(),
                     memberPw : $("#memberPw2").val(),
                     memberName : $("#memberName").val(),
                     memberAge : $("#memberAge").val(),
                     memberPhone : $("#memberPhone").val(),
                     memberGender : $("#memberGender").val()
                  },
                  dataType : "json",
                  success : function(data){
                     console.log(data);
                     if(data.result == "ok"){
                        alert(data.resultMsg);
                        location.replace("/member/loginForm.do");
                        return;
                     }else{
                        alert(data.resultMsg);
                        $("#memberPw").focus();
                     }
                  },
                  error : function(xhr, status, error){
                     console.log(xhr);
                     alert("error\nxhr : " + xhr+ ", status"+status+", error : "+error);
                  }
                  
               });
            
            }
         }
         
      };
      
   </script>
   </head>
   
   <body>
   
        <!----------------------------------------------------------->
      
      <!--메인 -->
      <section>
         <div class="sub_wrap">
            <div class="sub_bg">
               <h1>회원가입 Join</h1>
               <img src="images/sub_bg.png" alt="서브배경" />   
            </div>
            <!-- 서브 네비 -->
            <div class="sub_nav">
               <div class="sub_menu">
                  <h3>계정관리</h3>
                  <ul>
                        <li><a href="join.html" class="on">회원가입</a></li>
                  </ul>
               </div>
               <div class="sub_title">
                  <div class="rout">
                     <ul>
                        <li>홈</li> >
                        <li>회원가입</li>
                     </ul>
                  </div>
                  <h2>회원가입</h2>
               </div>

               <!-- 서브 내용 -->
               <div class="sub_content">
                  
                  <form name="memberForm" class="join_table">
                      <legend>회원가입</legend>
                     <table>
                        <tr>
                           <th><label>아이디</label></th>
                           <td><input name="memberId" id="memberId" type="text" placeholder="아이디를 입력해 주세요"/><button type="button" onclick="doubleCheck()">중복확인</button></td>
                        </tr>
                        <tr>
                           <th><label>비밀번호</label></th>
                           <td><input name="memberPw" id="memberPw" type="password" placeholder="비밀번호를 입력해 주세요" /><span class="small">* 비밀번호는 특수문자 포함하여 6자리 이상 입력해 주세요.</span></td>
                        </tr>
                        <tr>
                           <th><label>비밀번호 확인</label></th>
                           <td><input name="memberPw2" id="memberPw2" type="password" placeholder="비밀번호를 다시 입력해 주세요" /></td>
                        </tr>
                        <tr>
                           <th><label>이름</label></th>
                           <td><input name="memberName" id="memberName" type="text" /></td>
                        </tr>
                        <tr>
                           <th><label id="memberPhone">전화번호</label></th>
                           <td><input name="hp1" id="hp1" maxlength="3" type="text" class="call" /> - <input type="text" maxlength="4" name="hp2" id="hp2" class="call" /> - <input type="text" maxlength="4" name="hp3" id="hp3" class="call" /></td>
                        </tr>
                        <tr>
                           <th><label>나이</label></th>
                           <td>
                              <select name="memberAge" id="memberAge">
                                 <option value="" >--나이를 선택해주세요--</option>
                                 <c:forEach var="i" begin="1" end="100" varStatus="status">
                                    <option value="${i}" >${i}</option>
                                 </c:forEach>
                              </select>
                           </td>
                        </tr>
                        <tr>
                           <th><label>성별</label></th>
                           <td>
                              <label><input type="radio" value="M" name="gender" id="memberGender"/>
                              <span>남</span></label>
                              <label><input type="radio" value="F" name="gender" id="memberGender"/>
                              <span>여</span></label>
                           </td>
                        </tr>
                        <tr>
                                    <th><label>약관동의</label></th>
                           <td>
                              <input type="checkbox" id="chk1" name="chk" />
                              <label for="chk1"><span>약관에 동의합니다.</span></label><br />
                              <input type="checkbox" id="chk2" name="chk" />
                              <label for="chk2"><span>개인정보 수집에 동의합니다.</span></label><br />
                              <input type="checkbox" id="chk3" name="chk" />
                              <label for="chk3"><span>전체 동의합니다.</span></label>
                           </td>
                        </tr>
                     </table>
                     <div class="join_btn">
                        <button class="btn_submit" type="button" onclick="insertMember(); return false;">가입하기</button>
                        <button class="btn_back" type="button" onclick="">취소하기</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         
         
      </section>
      <!--메인끝 -->
      
      
   </body>
</html>