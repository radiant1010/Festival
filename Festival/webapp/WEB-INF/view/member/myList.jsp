<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <style>
@media screen and (max-width: 767px) {
   .join_table table tr td input.call {
      width: 30%;
   }
   .btn_submit {
      background: -webkit-linear-gradient(top, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      background: linear-gradient(to bottom, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      width: 40%;
      height: 40px;
      color: #fff;
      border: 1px solid #606a73;
   }
   .btn_back {
      background: -webkit-linear-gradient(top, rgba(238, 238, 238, 1) 0%,
         rgba(238, 238, 238, 1) 100%);
      background: linear-gradient(to bottom, rgba(238, 238, 238, 1) 0%,
         rgba(238, 238, 238, 1) 100%);
      width: 40%;
      height: 40px;
      color: #666;
      border: 1px solid #aaa;
   }
}
</style>
      <script type="text/javascript">
      $(function(){
         
         
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
      

      
      
      function updateMember() {
         var memberForm = document.getElementById("memberForm");
          if(memberForm.memberPw.value==""){
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
         }else{
               //통합
               var hp = $("#hp1").val() + "-" + $("#hp2").val() + "-" + $("#hp3").val();
               $("#memberPhone").val(hp);

               $.ajax({
                  type : "post",
                  url : "/member/updateMemberProc.do",
                  data : {
                     memberId : "${memberBean.memberId}",
                     memberPw : $("#memberPw").val(),
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
                        location.replace("/member/myList.do?memberId=${memberBean.memberId}");
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
         
      };
      
   </script>
   </head>
   
   <body>
   
        <!----------------------------------------------------------->
      
      <!--메인 -->
      <section>
         <div class="sub_wrap">
            <div class="sub_bg">
               <h1>회원정보수정 MYPAGE</h1>
               <img src="/images/sub_bg.png" alt="서브배경" />   
            </div>
            <!-- 서브 네비 -->
            <div class="sub_nav">
               <div class="sub_menu">
                  <h3>계정관리</h3>
                  <ul>
                        <li><a href="/member/myList.do" class="on">회원정보수정</a></li>
                  </ul>
               </div>
               <div class="sub_title">
                  <div class="rout">
                     <ul>
                        <li>홈</li>>
                        <li>회원정보</li>
                     </ul>
                  </div>
                  <h2>회원정보 수정</h2>
               </div>

               <!-- 서브 내용 -->
               <div class="sub_content">
                  <form id="memberForm" name="memberForm" class="join_table">
                      <legend>회원정보 수정</legend>
                     <table>
                        <tr>
                           <th><label>아이디</label></th>
                           <td>${memberBean.memberId}</td>
                        </tr>
                        <tr>
                           <th><label>비밀번호</label></th>
                           <td><input name="memberPw" id="memberPw" type="password" placeholder="비밀번호를 입력해 주세요" /></td>
                        </tr>
                        <tr>
                           <th><label>이름</label></th>
                           <td><input name="memberName" id="memberName" type="text" value="${memberBean.memberName}" /></td>
                        </tr>
                        <tr>
                           <th><label id="memberPhone">전화번호</label></th>
                           <td><input name="hp1" id="hp1" maxlength="3" type="text" class="call" value="${memberBean.hp1}" />
                            - <input type="text" maxlength="4" name="hp2" id="hp2" class="call" value="${memberBean.hp2}"/> 
                            - <input type="text" maxlength="4" name="hp3" id="hp3" class="call" value="${memberBean.hp3}"/></td>
                        </tr>
                        <tr>
                           <th><label>나이</label></th>
                           <td>
                              <select name="memberAge" id="memberAge">
                                 <option value="" >--나이를 선택해주세요--</option>
                                 <c:forEach var="i" begin="1" end="100" varStatus="status">
                                    <option value="${i}" ${i == memberBean.memberAge ? 'selected=selected' : '' }>
                                    ${i}</option>
                                 </c:forEach>
                              </select>
                           </td>
                        </tr>
                        <tr>
                           <th><label>성별</label></th>
                           <td>
                              <label><input type="radio" value="M" name="gender" id="memberGender" <c:if test="${memberBean.memberGender eq 'M'}">checked</c:if>>
                              <span>남</span></label>
                              <label><input type="radio" value="F" name="gender" id="memberGender" <c:if test="${memberBean.memberGender eq 'F'}">checked</c:if>>
                              <span>여</span></label>
                           </td>
                        </tr>
                        
                     </table>
                     <div class="join_btn">
                        <button class="btn_submit" type="button" onclick="updateMember(); return false;">수정하기</button>
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