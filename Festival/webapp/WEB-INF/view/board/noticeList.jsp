<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <script type="text/javascript">
      function search() {

         var searchText = $("#searchText").val();

         if (searchText == "") {
            alert("검색어를 입력하세요.");
            $("#searchText").focus();
            return;
         }

         //검색실행
         showList(searchText);
      };
      
      
      
   //웹용 아작스
      function showList(searchTextVal) {
         $.ajax({
              type: "post",
              url: "/board/noticeListProc.do",
              data:{
                 pageNo: "${param.pageNo}",
                 'searchText': searchTextVal
              },
              dataType: "json",
              success: function(data) {
                 console.log(data);
                 
                 if(data.result == "ok") {
                    
                    $("#boardBody").empty();
                    
                    //리스트 출력
                    $.each(data.boardBean, function(i, mBean) {
                       var str = "";
                       str += "<tr>";
                       str += "<td>" + mBean.boardNo + "</td>";
                       str += "<td><a href='/board/noticeView.do?boardNo="+mBean.boardNo+"&'>" + mBean.boardTitle + "</a></td>";
                       str += "<td>" + mBean.memberName + "</td>";
                       str += "<td>" + mBean.boardDate + "</td>";
                       str += "<td>" + mBean.boardCount + "</td>";
                       str += "</tr>";
                       
                       $("#boardBody").append(str);
                    });
                       
                 } else {
                    alert(data.resultMsg);   
                 }
                 
              },
              error: function(xhr, status, error) {
                 console.log(xhr);
                 alert("error\nxhr : " + xhr + ", status : " 
                       + status + ", error : " + error);      
              }
           });
      };
   

//////////////////////////////////////////////
      $(function(){
         
         showList('${param.searchText}');
          
        });//end ready
   </script>
<style>
.btn_write2 {
   display: none;
}

.notice_table2 {
   display: none;
}

@media screen and (max-width: 767px) {
   .btn_write {
      display: none;
   }
   .btn_write2 {
      display: inline;
      background-color: #606a73;
      border: none;
      color: #fff;
      width: 80px;
      height: 30px;
      margin-top: 3%;
   }
   .btn_wrap .find input[type="text"] {
      height: 30px;
      border: 1px solid #ccc;
      padding: 5px;
      width: 74.5%;
   }
   .notice_table {
      width: 100%;
      font-size: 13px;
   }
   .notice_table .col1{
      width: 10%;
      
   }
   .notice_table .col2{
      width:*;
      
   }
   .notice_table .col3{
      width:15%;
      
   }
   .notice_table .col4{
      width:15%;
      
   }
   .notice_table .col5{
      width:15%;
      
   }

}
</style>


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
                            <li><a href="/qna.do" >Q&amp;A</a></li>
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
                  <div class="btn_wrap">
                     <button class="btn_write" onclick="location.href='noticeWrite.do' " >글쓰기</button>
                     <div class="find">
                        <input type="text" class="input" id="searchText" value="${searchText}"/>
                        <button type="button" class="btn_find" onClick="search(); return false;">검색하기</button>
                     </div>
                  </div>
                  <div class="notice_table">
                     <table>
                        <colgroup>
                           <col width="10%" class="col1">
                           <col width="*" class="col2">
                           <col width="10%" class="col3">
                           <col width="15%" class="col4">
                           <col width="10%" class="col5">
                        </colgroup>
                        <tr>
                           <th>번호</th>
                           <th>제목</th>
                           <th>이름</th>
                           <th>날짜</th>
                           <th>조회순</th>
                        </tr>
                        
                        <tbody id="boardBody">
                        </tbody>
                        
                     </table>
                     <button class="btn_write2" onclick="location.href='noticeWrite.do' " >글쓰기</button>
                  </div>
                  
                  <div class="page">
                     <ul>
                      <c:if test="${pagingBean.groupNo > 1}">
                              <li><a href="/board/noticeList.do?pageNo=${pagingBean.pageStartNo-1}" class="on">&lt;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${pagingBean.pageStartNo}" end="${pagingBean.pageEndNo}">
                        <c:choose>
                           <c:when test="${pagingBean.pageNo != i}">
                              <li><a href="/board/noticeList.do?pageNo=${i}" class="on">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="on">${i}</li>
                           </c:otherwise>
                        </c:choose>
                        </c:forEach>
                        <c:if test="${pagingBean.groupNo < pagingBean.totalGroupCount}">
                           <li><a href="/board/noticeList.do?pageNo=${pagingBean.pageEndNo+1}" class="on">&gt;</a></li>
                        </c:if>
                     
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!--메인끝 -->
</body>
</html>