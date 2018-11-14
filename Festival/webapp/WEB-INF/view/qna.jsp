<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <script>
            /* 아코디언 */
            $(function(){
                $(".notice_table #showAc").hide();
                $(".notice_table #title").click(function(){
                    var showAc = $(".notice_table #showAc");
                    showAc.slideUp();
                    if(!$(this).next().is(":visible"))
                    {
                        $(this).next().slideDown();
                    }
                });
            });
    </script>
    
<!-- 모바일용 화면 -->

<style>
@media screen and (max-width: 767px) {
   .sub_content {
      width: 990px;
      float: right;
      max-width: 100%;
      padding: 30px 10px;
      font-size: 13px;
   }
   .sub_title h2 {
    width: 100%;
    float: left;
    padding-left: 10px;
    font-size: ;
}
}
</style>

<!-------------->
   
   <body>
      <!--메인 -->
      <section>
         <div class="sub_wrap">
            <div class="sub_bg">
               <h1>커뮤니티 Community</h1>
               <img src="/images/community.jpg" alt="서브배경" />   
            </div>
            <!-- 서브 네비 -->
            <div class="sub_nav">
               <div class="sub_menu">
                  <h3>커뮤니티</h3>
                  <ul>
                      <li><a href="/board/noticeList.do" class="on">자유게시판</a></li>
                     <li><a href="/qna.do"> Q&amp;A </a></li>
                  </ul>
               </div>
               <div class="sub_title">
                  <div class="rout">
                     <ul>
                        <li>홈</li> >
                        <li>커뮤니티</li> >
                        <li>Q&amp;A</li>
                     </ul>
                  </div>
                  <h2>Q&amp;A(자주 묻는 질문) &nbsp; 
                  <button type="button" class="btn btn-default" style="font-size: 16px;"  onclick="window.open('websocket.do', 'popup01', 'left=400, top=200, width=500, height=500, scrollbars= 0, toolbar=0, menubar=no');"> 1:1상담 </button></h2> 
               </div>

               <!-- 서브 내용 -->
                <div class="sub_content">
                  <div class="notice_table">
                     <table>
                        <colgroup>
                           <col width="10%">
                           <col width="*">
                           <col width="15%">
                             <%-- <col width="10%"> --%>
                           <col width="13%">
                           <col width="15%">
                        </colgroup>
                        <tr>
                           <th>번호</th>
                           <th>제목</th>
                           <th>이름</th>
                      <!--  <th>비밀글</th> -->
                           <th>날짜</th>
                           <th>조회순</th>
                        </tr>
                        <tr>
                           <td>6</td>
                           <td>
                               <div id="title" class="ac_title">ID 및 비밀번호 잃어버렸어요</div>
                               <div id="showAc" class="ac_cont">- 아이핀 인증으로만 비밀번호를 찾을 수 있습니다.
                                                          - 인터넷 상에서 주민등록번호를 대신하여 본인임을 확인 받을 수 있는 사이버신원 확인번호입니다. 
                                                - 본 싸이트에는 개인정보가 전혀 저장되지 않습니다.
                                                - 문의 : admin@kostafesta.co.kr</div>
                           </td>
                           <td>관리자</td>
                           <td>2017-05-09</td>
                           <td>25</td>
                        </tr>
                        <tr>
                           <td>5</td>
                           <td>
                               <div id="title" class="ac_title">비밀번호를 변경하고 싶어요</div>
                               <div id="showAc" class="ac_cont">-한 번 설정한 비밀 번호는 니 맘데로 못바꾼다네 이 친구야.</div>
                           </td>
                           <td>관리자</td>
                           <td>2017-05-09</td>
                           <td>25</td>
                        </tr>
                        <tr>
                           <td>4</td>
                           <td>
                               <div id="title" class="ac_title">회원정보를 변경하고 싶어요</div>
                               <div id="showAc" class="ac_cont">-비밀 번호 바꾸는 것 보다 어려운게 회원 정보 변경이네 이 친구야.</div>
                            </td>
                           <td>관리자</td>
                           <td>2017-05-09</td>
                           <td>25</td>
                        </tr>
                        <tr>
                           <td>3</td>
                           <td>
                               <div id="title" class="ac_title">회원가입은 어떻게 하나요?</div>
                               <div id="showAc" class="ac_cont">축제를 사랑하시는 분은 누구나 가능합니다. 연회비 100만원.</div>
                            </td>
                           <td>관리자</td>
                           <td>2017-05-09</td>
                           <td>25</td>
                        </tr>
                        <tr>
                           <td>2</td>
                           <td>
                                        <div id="title" class="ac_title">외국인도 회원 가입이 가능한가요?</div>
                               <div id="showAc" class="ac_cont">불법체류자가 아니면 가능합니다. 불법체류자는 니네 나라로 고고싱~</div>
                                    </td>
                           <td>관리자</td>
                           <td>2017-05-09</td>
                           <td>25</td>
                        </tr>
                        <tr>
                           <td>1</td>
                           <td>
                               <div id="title" class="ac_title">회원 탈퇴는 어떻게 하나요?</div>
                               <div id="showAc" class="ac_cont">저희 협회 회장이신 일본 야쿠자 중간보스 쓰매끼리 이노우에 상과의 면담이 선행 됩니다.
                                                          들어오는 건 니 맘이지만 나가는 건 쉽지 않다네 이 친구야.</div>
                           </td>
                           <td>관리자</td>
                           <td>2017-05-09</td>
                           <td>25</td>
                        </tr>
                     </table>
                  </div>
                  <div class="page">
                     <ul>
                        <li><a href="#" class="on">1</a></li>
                     </ul>
                  </div>
               </div>
               <!--서브 내용 e-->
            </div>
        </div>
         
         
      </section>
      <!--메인끝 -->
   </body>
</html>