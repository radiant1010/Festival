<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- Bootstrap -->
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" />
<style>
@media screen and (max-width: 767px) {
   .form-group {
      margin-bottom: 9px;
   }
   button[disabled], html input[disabled] {
      cursor: default;
      width: 50%;
   }
   .sub_title h2 {
      width: 800px;
      float: left;
      padding-left: 10px;
      font-size:;
      margin-left: 2%;
   }
   .write_table table tr th {
      padding: 10px;
      font-weight: bold;
      vertical-align: top;
      border-bottom: 1px solid #ccc;
      background: #efefef;
      width: 23%;
      font-size: 12px;
   }
   .btn_submit {
      background: -webkit-linear-gradient(top, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      background: linear-gradient(to bottom, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      width: 30%;
      height: 40px;
      color: #fff;
      border: 1px solid #606a73;
      font-size: 15px;
      margin-right: 1%;
   }
   .btn_delete {
      background: -webkit-linear-gradient(top, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      background: linear-gradient(to bottom, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      width: 30%;
      height: 40px;
      color: #fff;
      border: 1px solid #606a73;
      font-size: 15px;
      margin-right: 1%;
   }
   .btn_back {
      background: linear-gradient(to bottom, rgba(238, 238, 238, 1) 0%,
         rgba(238, 238, 238, 1) 100%);
      width: 30%;
      height: 40px;
      color: #666;
      border: 1px solid #aaa;
      font-size: 15px;
   }
}

a:hover {
   text-decoration: none;
}

html, body {
   font-family: 'Noto Sans KR', sans-serif, dotum, '돋움', gulim, '굴림', Arial,
      AppleGothic, verdana, helvetica;
   font-size: 14px;
   letter-spacing: -0.05em;
   line-height: 1.6;
   font-weight: 400;
   color: #333;
   margin: 0;
   overflow-x: hidden;
   !
   important;
}

a {
   color: #333333;
   text-decoration: none;
}

a:link {
   color: #333333;
   text-decoration: none;
   transition: all .3s ease
}

a:visited {
   color: #333333;
   text-decoration: none
}

a:active {
   color: #333333;
   text-decoration: none
}

a:hover {
   color: #666666;
   text-decoration: none
}

.sub_title {
   padding-bottom: 0px;
}
-webkit-box-sizing












:






 






border-box












;
-moz-box-sizing












:






 






border-box












;
box-sizing












:






 






border-box












;
</style>
<script type="text/javascript">
       function deleteBoard() {
          $.ajax({
             type: 'POST',
             url: "/board/deleteBoardAjax.do",
                data: {
                   boardNo : "${boardList.boardNo}",
                },
                success: function(data){
                   alert(data.resultMsg);
                   if(data.result == "ok") {
                      //화면이동 처리
                      location.href="noticeList.do?pageNo=1";
                   }
                }
            }); // end of ajax
       };
       
       function deleteReply(index) {
          
          if(confirm("삭제 하시겠습니까?")) {
            $.ajax({
                type: 'POST',   
                url: "/board/deleteBoardReplyAjax.do",
                   data: {
                      brNo : index
                   },
                   success: function(data){
                      alert(data.resultMsg);
                      if(data.result == "ok") {
                         //화면이동 처리
                         location.reload();
                      }
                   }
             });
            }
       }
       
       //댓글 아작스
       $(function() {
          $("#commentOk").click(function(){
             $.ajax({
                type : "post",
                url : "/board/noticeReplyViewAjax.do",
                data : {
                   brContent:$("#commentText").val(),
                   boardNo : "${boardList.boardNo}"
                },
                dataType : "json",
                success : function(data){
                   console.log(data);
                   if(data.result == "ok"){
                      var str = "";
                       str += "<tr>";
                      str += "<td>" + data.BoardReplyBean.memberName + ":" + "</td>;";
                      str += "<td>" + data.BoardReplyBean.brContent + "</td>";
                      str += "</tr>";
                      $("#replyList").append(str);
                      
                      location.reload();
                   }
                },
                error : function(xhr, status, error){
                   console.log(xhr);
                   alert("로그인 후 입력하세요");
//                    alert("error\nxhr : " + xhr+ ", status"+status+", error : "+error);
                }
             }); // end ajax
          }); // end click
       }); // end ready
       
    </script>
</head>
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
               <li><a href="/board/noticeList.do?pageNo=1" class="on">자유게시판</a></li>
               <li><a href="/qna.do"> Q&amp;A </a></li>
            </ul>
         </div>
         <div class="sub_title">
            <div class="rout">
               <ul>
                  <li>홈</li> >
                  <li>커뮤니티</li> >
                  <li>자유게시판</li>
               </ul>
            </div>
            <h2>자유게시판</h2>
         </div>

         <!-- 서브 내용 -->
         <div class="sub_content">
            <div class="write_table">
               <table>
                  <tr>
                     <th>제목</th>
                     <td colspan="3" id="boardTitle">${boardList.boardTitle}</td>
                  </tr>
                  <tr>
                     <th width="20%">이름</th>
                     <td width="30%" id="memberName">${boardList.memberName}</td>
                     <th width="20%">날짜</th>
                     <td width="30%" id="regDate">${boardList.boardDate}</td>
                  </tr>
                  <tr>
                     <th>번호</th>
                     <td id="boardNo">${boardList.boardNo}</td>
                     <th>조회수</th>
                     <td>${boardList.boardCount+1}</td>
                  </tr>
                  <tr>
                     <th>첨부파일</th>
                     <td colspan="3"><c:forEach var="bean" items="${fileList}"
                           varStatus="status">
                           <c:if test="${fileList ne null}">
                              <a target="_blank" href="${bean.fileImgPath}">${bean.fileOriginName}</a>
                           </c:if>
                        </c:forEach></td>
                  </tr>
                  <tr>
                     <th>내용</th>
                     <td colspan="3" id="boardContent"><c:forEach var="bean"
                           items="${fileList}" varStatus="status">
                           <c:if test="${fileList ne null}">
                              <img width="100%" src="${bean.fileImgPath}">
                           </c:if>
                        </c:forEach> ${boardList.boardContent}</td>
                  </tr>
               </table>
            </div>
            <!-- 댓글 작성 부분 -->
            <div class="container_reply">
               <table class="table table-condensed">
                  <tr>
                     <td><span class="form-inline" role="form">
                           <div class="form-group">
                              <label>[댓글]</label> <br /> <label>[유저명]&nbsp;&nbsp;:&nbsp;&nbsp;<input
                                 type="text" disabled="disabled"
                                 value="${sessionScope.memberBean.memberName}" /> &nbsp;
                                 <button type="button" id="commentOk" class="btn btn-default">완료</button>
                              </label>
                           </div> <textarea id="commentText" class="form-control col-lg-12"
                              style="width: 100%" rows="4"></textarea>
                     </span></td>
                  </tr>
               </table>
               <hr />
               <!--댓글 -->
               <div class="container_reply">
                  <table>
                     <tbody id="replyList"></tbody>
                     <label>[댓글 리스트]</label>
                     <br />
                     <c:forEach var="bean" items="${boardReplyList}"
                        varStatus="status">
                        <c:choose>
                           <c:when
                              test="${bean.memberNo eq sessionScope.memberBean.memberNo or !empty sessionScope.memberBean.memberAdmin}">
                              <a style="cursor: pointer;"
                                 onclick="deleteReply(${bean.brNo});">${bean.memberName} :
                                 ${bean.brContent}</a>
                              <br />
                           </c:when>
                           <c:otherwise>
                         ${bean.memberName} : ${bean.brContent}
                        <br />
                           </c:otherwise>

                        </c:choose>

                     </c:forEach>
                  </table>
               </div>
               <hr />
               <div class="sub_content">
                  <div class="write_table">

                     <!--  로그인이 되어 있을 때  -->
                     <c:if
                        test="${boardList.memberNo eq sessionScope.memberBean.memberNo or !empty sessionScope.memberBean.memberAdmin}">
                        <button type="submit" class="btn_submit"
                           onclick="location.href='noticeUpdate.do?boardNo=${boardList.boardNo}'">수정하기</button>
                        <button type="submit" class="btn_delete" onclick="deleteBoard()">삭제하기</button>
                        <button class="btn_back" onclick="location.href='noticeList.do'">뒤로가기</button>
                     </c:if>

                     <!--  로그인이 안 되어 있을 때 -->
                     <c:if
                        test="${boardList.memberNo ne sessionScope.memberBean.memberNo and empty sessionScope.memberBean.memberAdmin}">
                        <button class="btn_back" onclick="location.href='noticeList.do'">뒤로가기</button>
                     </c:if>
                  </div>
               </div>

            </div>


         </div>
      </div>
   </div>


   </section>
   <!--메인끝 -->
</body>
</html>