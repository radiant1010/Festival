<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>FESTIVAL</title>


<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/jquery-1.12.4.min.js"></script>
<!-- 검색 스크립트 -->
<script type="text/javascript">
   function check() {
      if (document.search.searchText.value == "") {
         alert("검색어를 입력하세요.");
         document.search.searchText.focus();
         return;
      }
      document.search.submit();
   }
</script>
<!-- 검색 스크립트 끝 -->

   <style>
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
/*       메인 페이지 반응형 설정 */
@media screen and (max-width: 767px) {
  .search_form .form_search_info .search_textt {
      font-size: 16px;
      width: 70%;
      padding: 10px;
      border: 0px;
      outline: none;
      float: left;
      height: 95%;
   }
.search_form .form_search_info .search_btn {
      width: *;
      height: 100%;
      border: 0px;
      background: #1b5ac2;
      outline: none;
      float: right;
      color: #ffffff;
      font-size: 13px;
   }
   .index_section .section_search .text_guide {
      font-size: 15px;
      padding: 20px;
      text-align: center;
      font-weight: bold;
      color: dimgray;
   }
   .index_section .main_visual {
      width: 100%;
      height: 500px
   }
   .index_section .main_visual .visual01, section .main_visual .visual02,
      section .main_visual .visual03 {
      height: 400px;
   }
   footer {
      display: none;
   }
   
   /*메인*/
   .index_section .main_visual .visual01 .imgslide {
      width: 100%;
      display: block;
      height: 500px;
      background: no-repeat center center;
      background-size: cover;
   }
}
</style>
</head>
<body>
   <!--메인 -->
   <section class="index_section">

   <div class="section_search">
      <div class="text_guide">놀러가고 싶으신 곳이 있으신가요? 축제에 관련된 내용을 아래에서
         검색해보세요!</div>
      <form action="/festival/searchView.do?pageNo=1" method="post"
         class="search_form" name="search">
         <select name="searchType" style="display: none">
            <option value="title">제목</option>
         </select>

         <div class="form_search_info">
            <input class="search_text" type="text" name="searchText"
               value="${searchText}" placeholder="검색할 내용을 입력하세요." />
            <button type="button" class="search_btn" onClick="check()" >검색</button>
         </div>
      </form>
   </div>

   <div id="myCarousel" class="carousel slide main_visual"
      data-ride="carousel">
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
         <li data-target="#myCarousel" data-slide-to="3"></li>
         <li data-target="#myCarousel" data-slide-to="4"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
         <c:forEach var="fFBean" items="${fFBeanList}" varStatus="status">
            <c:if test="${!empty fFBean.ff_titleimage}">
               <c:choose>
                  <c:when test="${status.count eq '1'}">
                     <div class="item active">
                        <a
                           href="/festival/festival_view.do?festival_no=${fFBean.festival_no}"><span
                           class="first-slide visual01"> <img class="imgslide"
                              src="${fFBean.ff_titleimage}" alt="${fFBean.ff_realpath}" />
                        </span> </a>
                     </div>
                  </c:when>
                  <c:when test="${status.count/2 lt '5'}">
                     <div class="item">
                        <a
                           href="/festival/festival_view.do?festival_no=${fFBean.festival_no}"><span
                           class="first-slide visual01"> <img class="imgslide"
                              src="${fFBean.ff_titleimage}" alt="${fFBean.ff_realpath}" />
                        </span> </a>
                     </div>
                  </c:when>
               </c:choose>
            </c:if>
         </c:forEach>
      </div>


      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left"></span> <span
         class="sr-only">Previous</span>
      </a> <a class="right carousel-control" href="#myCarousel"
         data-slide="next"> <span
         class="glyphicon glyphicon-chevron-right"></span> 
         <span class="sr-only">Next</span>
      </a>
   </div>

   </section>
   <!--메인끝 -->

</body>
</html>