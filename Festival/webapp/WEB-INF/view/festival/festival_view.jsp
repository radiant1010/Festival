<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Festival_View</title>
   
   
    <!--header,footer,전체셋팅-->
   <link href="/css/main_style.css" rel="stylesheet" type="text/css" />
    <link href="/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/css/style_h.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!--메인, 서브 스타일 셋팅-->
    <script type="text/javascript" src="/js/common/angular-1.6.4/angular.js"></script>
   <script type="text/javascript" src="/js/common/jquery/jquery-1.12.4.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="/js/common/common.js"></script>
    
    <!-- AngulerJS 외부js 가져오기 -->
   <script type="text/javascript" src="/js/festival/festivalApp.js"></script>
   <script type="text/javascript" src="/js/festival/festivalController.js"></script>
   
    <!--다음지도--><!-- 진근 : 라이브러리 추가함 -->
<!--<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5572454a0ecafc7acd2c51fe7d5bed7c&libraries=services,clusterer,drawing"></script> -->
   <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0aa4e62923fbb9c8b879aec456fb7eec&libraries=services,clusterer,drawing"></script>
    <!--다음지도 끝-->
    
    <!-- 별점 스크립트 -->
    <script type="text/javascript" src="/js/scale.fix.js"></script>
    <script type="text/javascript" src="/js/star-rating.min.js"></script>
    <!-- 별점 스크립트 끝-->
    
    <!-- 별점 스크립트 -->
    <script type="text/javascript" src="/js/jquery.emojiRatings.js"></script>
    
    <!-- 별점 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- 별점 끝-->
    
    <script>
       // 댓글 리스트 출력
         function replyEach(data) {
         $.each(data.fRBeanList, function(i, fRBean) {
            var str = "";
            str += "<div class='col-md-6 col-md-offset-3' style='border: 1px solid #ddd; margin-top: 5px; padding:5px 5px;'>";
            str += data.fRBeanList.length - i;
//             str += i + 1;
               str += "<div class='form-group'>";
               str += "<label for='firstName'>[닉네임]&nbsp;&nbsp;: <input type='text' id='inputText_" + fRBean.fr_no + "' disabled='disabled' value='" + fRBean.fr_member_ideaname + "' /></label>&nbsp;&nbsp;";
               str += "<label for='rating'>[평가]&nbsp;&nbsp;: </label>&nbsp;&nbsp;&nbsp;" + fRBean.fr_starpoint + "&nbsp;&nbsp;&nbsp;";
               str += "<label for='rating'>[등록시간]&nbsp;&nbsp;: </label>&nbsp;&nbsp;&nbsp;" + fRBean.fr_date;
               str += "</div>";
               str += "<div class='form-group'>";
               str += "<label for='comments'>[댓글]</label>";
               
               // 해당 회원일때만
               if (fRBean.memberNo == "${sessionScope.memberBean.memberNo}") {
                  str += "<textarea style='resize:none' class='form-control' id='comments_" + fRBean.fr_no + "' name='comments'>" + fRBean.fr_content + "</textarea>";
               } else {
                  str += "<textarea style='resize:none' class='form-control' id='comments_" + fRBean.fr_no + "' name='comments' disabled='disabled' >" + fRBean.fr_content + "</textarea>";
               }

               str += "</div>";
               // 해당 회원일때만
               if (fRBean.memberNo == "${sessionScope.memberBean.memberNo}") {
                     str += "<button type='button' onclick='updateFestivalReply(" + fRBean.fr_no + "); return false;'>수정</button>";
                  str += "<button type='button' onclick='deleteFestivalReply(" + fRBean.fr_no + "); return false;'>삭제</button>";
               }
               
               str += "<div class='form-group' id='rating'>";
               str += "</div>";
               str += "</div>";
               str += "<br/><br/>";
            // 최상위로 댓글 작성
               $("#reply").append(str);
         });
         } // end of replyEach()
         
       // 댓글 삭제 메서드
          function deleteFestivalReply(index) {
             $.ajax({
             type : "post",
             url : "/festival/festival_deleteReply.do",
             data : {
                festival_no : "${fBean.festival_no}",
                fr_no : index
             },
             dataType : "json",
             success : function(data) {
                if (data.result == "ok") {
                  $("#reply").text("");
                  replyEach(data);
                } else {
                   alert(data.resultMsg);
                }
             }
          }); // end of ajax
          } // end of deleteFestivalReply
          
          // 댓글 수정 메서드
          function updateFestivalReply(index) {
             
             $.ajax({
             type : "post",
             url : "/festival/festival_updateReply.do",
             data : {
                festival_no : "${fBean.festival_no}",
                fr_content : $("#comments_" + index).val(),
                fr_no : index
             },
             dataType : "json",
             success : function(data) {
                if (data.result == "ok") {
//                   alert($("#inputText_"+index).val() +  "," +  $("#comments_" + index).val());
                  alert(data.resultMsg);
                  
                } else {
                   alert(data.resultMsg);
                }
             }
          }); // end of ajax
          } // end of updateFestivalReply
          
        $(function() {   
           // 해당 축제에 대한 댓글 자동 로딩
           $.ajax({
              type : "post",
              url : "/festival/festival_selectListReply.do",
              data : {
                 festival_no : "${fBean.festival_no}"
              }, 
              dataType : "json",
              success : function(data) {
                 if (data.result == "ok") {
                    replyEach(data);
                 } else {
                    console.log(data.resultMsg);
                 }
              }
           });
            
           // 댓글 달기
           $("#btnInsertReply").click(function(){
              var name = $("#firstName").val();
                var comments = $("#comments").val();
                var rating = $(".emoji-rating").val();
                
                // 댓글 정보 입력 안하면 혼남
                if ("" == name || "" == comments || "" == rating || "undefined" == rating) {
                    alert("댓글 정보를 입력하세요");
                    return;
                 }
	            $.ajax({
	               type : "post",
	               url : "/festival/festival_insertReply.do",
	               data : {
	                  fr_content : comments, 
	                  fr_starpoint : rating, 
	                  fr_member_ideaname : name,
	                  
	                  festival_no : "${fBean.festival_no}", 
	                  memberNo : "${sessionScope.memberBean.memberNo}" // test용
	               },
	               dataType : "json",
	               success : function(data) {
	                  if (data.result == "ok") {
	                     console.log(data.resultMsg);
	                     
	                     $("#reply").text("");
	                     replyEach(data);
	                     
	                     // 초기화 작업
	                     $("#firstName").val("");
	                     $("#comments").val("");
	                  } else {
	                    alert(data.resultMsg);
	                  }
	               }
	            }); // end of ajax
           }); // end of btnInsertReply()
            
            //아코디언
            $(".accordian #showAc").hide();
            $(".accordian #title").click(function() {
                var showAc = $(".accordian #showAc");
                showAc.slideUp();

                if (!$(this).next().is(":visible")) {
                    $(this).next().slideDown();
                }
            });
        }); // end of ready
    </script>
<style>
.info_table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
    margin: 10px auto;
    text-align: center;
    font-size : 13px;
    table-layout: fixed;
    word-break:break-all;
}
@media screen and (max-width: 767px) {
	footer {
		display: none;
	}
	.about_guide {
		width: 100%;
		height: 700px;
		margin: 0 auto;
	}
	.container {
	    padding-right: 15px;
	    padding-left: 15px;
	    margin-right: auto;
	    margin-left: auto;
	    width: 100%;
	}
	.maptitle {
	    width: 100%;
	    margin: 50px auto;
	}
	.gallery {
	    width: 100%;
	    margin: 50px auto;
	}
	.about_guide .main_visual {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 250px;
    text-align: center;
    background-color: #aaa;
    float: left;
}

.about_guide .main_visual .item img {
    max-width: 100%;
    width: 100%;
    height: 250px;
}
.info_table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
    width: 100%;
    height: 300px;
    margin: 10px auto;
    text-align: center;
    font-size : 13px;
    table-layout: fixed;
    word-break:break-all;
}
.map .service_list {
    width: 100%;
    margin: 0 auto;
}
element.style {
    width: 100%;
    height: 400px;
    position: relative;
    overflow: hidden;
    background: url(http://i1.daumcdn.net/dmaps/apis/loading_n.png);
}
/* .info_table_t_web{ */
/* 	width: 145px; */
/* 	display: block; */
/* 	background-color: #fff; */
/* 	position: relative; */
/* 	text-decoration: underline; */
/* 	white-space: nowrap; */
/*     text-overflow: ellipsis; */
/*     overflow: hidden; */
/* } */
}
</style>
</head>
<body>
   <!--메인 -->
    <section class="sec">
        <!--축제정보-->
        <div class="about_guide">
            <div class="about">
                <h2 class="title">축제 정보</h2>
                <div class="title_hr"></div>
            </div>
            <br/>
            <!--축제정보 좌측-->
            <!-- main_slide1 -->
            <div id="myCarousel" class="carousel slide main_visual" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                   <c:forEach var="fFBean" items="${fFBeanList}" varStatus="status">
                      <c:choose>
                         <c:when test="${status.index eq '0'}">
                             <li data-target="#myCarousel" data-slide-to="${status.index}" class="active"></li>
                         </c:when>
                         <c:otherwise>
                             <li data-target="#myCarousel" data-slide-to="${status.index}"></li>
                         </c:otherwise>
                      </c:choose>
                   </c:forEach>
                </ol>
                <div class="carousel-inner" role="listbox">
                
                   <c:forEach var="fFBean" items="${fFBeanList}" varStatus="status">
                      <c:choose>
                         <c:when test="${status.count eq '1'}">
                            <div class="item active">
                                    <a href="#"><span class="visual01"><img src="${fFBean.ff_realpath}" /></span></a>
                              </div> 
                         </c:when>
                         <c:otherwise>
                            <div class="item">
                                 <a href="#"><span class="visual01"><img src="${fFBean.ff_realpath}" /></span></a>
                             </div>
                         </c:otherwise>
                      </c:choose>
                    </c:forEach>
                </div>
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!--축제정보 우측-->
            <!--   table  -->
            <table class="info_table">
           
                <tbody>
                     <tr>
                        <th class="info_table_t">축제 이름</th>
                        <td class="info_table_t">${fBean.festival_name}</td>
                    </tr>
                    <tr>
                        <th class="info_table_t">축제 기간</th>
                        <td class="info_table_t">${fBBean.fb_startdate} ~ ${fBBean.fb_enddate}</td>
                    </tr>
                    <tr>
                        <th class="info_table_t">축제 주소</th>
                        <td class="info_table_t">${fBBean.fb_address}</td>
                    </tr>
                    <tr>
                        <th class="info_table_t">축제 주관/주최 단체</th>
                        <td class="info_table_t">${fBBean.fb_org_name}</td>
                    </tr>
                    <tr>
                        <th class="info_table_t">축제 주관/주최 전화번호</th>
                        <td class="info_table_t">${fBBean.fb_org_phone}</td>
                    </tr>
                    <tr>
                        <th class="info_table_t" >축제 주관/주최 홈페이지</th>
                        <td class="info_table_t" >
    					<a target="_blank" href="${fBBean.fb_org_link}">${fBBean.fb_org_link}</a>
    					</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!--축제정보 끝-->

        <!-- 세부정보 -->
        <div class="gallery">
            <h2 class="title">세부 정보</h2>
            <div class="title_hr"></div>
            <br/><br/>
            <div class="sub_content">
                <!--아코디언-->
                <div id="accordian" class="accordian">
                    <ul>
                        <li>
                            <div id="title" class="ac_title">축제 설명</div>
                            <div id="showAc" class="ac_cont">
                                ${fBean.festival_detail_intro}
                            </div>
                        </li>
                        <li>
                            <div id="title" class="clear_after ac_title">이용 요금</div>
                            <div id="showAc" class="ac_cont">
                                ${fBean.festival_detail_fee}
                            </div>   
                        </li>
                        <li>
                            <div id="title" class="clear_after ac_title">주차 여부</div>
                            <div id="showAc" class="ac_cont">
                                ${fBean.festival_detail_parking}
                            </div>
                        </li>
                        <li>
                            <div id="title" class="clear_after ac_title">운영 시간</div>
                            <div id="showAc" class="ac_cont">
                                ${fBean.festival_detail_time}
                            </div>
                        </li>
                        <li>
                            <div id="title" class="clear_after ac_title">주의 사항</div>
                            <div id="showAc" class="ac_cont">
                                ${fBean.festival_detail_notice}
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 아코디언 끝 -->
            </div>
        </div>
        <!-- 세부정보 끝 -->

        <!--축제정보-->
        <div class="maptitle">
            <div class="about">
                <h2 class="title">지도 정보</h2>
                <div class="title_hr">
                </div>
            </div>
            <!--지도-->
            <!-- //main_slide1 -->
            <div class="map">
                <div class="service_list">
                   
                    <div id="map" style="width:100%;height:400px;"></div>
                     
                     <script>
                       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                       mapOption = { 
                           center: new daum.maps.LatLng("${fBean.festival_location_x}", "${fBean.festival_location_y}"), // 지도의 중심좌표
                           level: 3 // 지도의 확대 레벨
                       };

                      var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
                      // 마커가 표시될 위치입니다 
                      var markerPosition  = new daum.maps.LatLng("${fBean.festival_location_x}", "${fBean.festival_location_y}"); 
   
                      // 마커를 생성합니다
                      var marker = new daum.maps.Marker({
                          position: markerPosition,
                          clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
                      });
   
                      // 마커가 지도 위에 표시되도록 설정합니다
                      marker.setMap(map);

                      
                      ///////////////////////////////////////////////////////////////////////////////
                      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
                  var mapTypeControl = new daum.maps.MapTypeControl();
                  
                  // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
                  // daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
                  map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
                  
                  // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                  var zoomControl = new daum.maps.ZoomControl();
                  map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
                  ///////////////////////////////////////////////////////////////////////////////
                      
                  
                      // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                  var iwContent = '<div style="padding:5px;"><a target="_blank" href="${fBBean.fb_org_link}">${fBean.festival_name}<a/></div> <div style="padding:5px;"><a href="http://map.daum.net/link/to/${fBean.festival_name}, ${fBean.festival_location_x}, ${fBean.festival_location_y}" style="color:blue" target="_blank">길찾기</a> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                      iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
                  
                  // 인포윈도우를 생성합니다
                  var infowindow = new daum.maps.InfoWindow({
                      content : iwContent,
                      removable : iwRemoveable
                  });
                  
                  // 마커에 클릭이벤트를 등록합니다
                  daum.maps.event.addListener(marker, 'click', function() {
                        // 마커 위에 인포윈도우를 표시합니다
                        infowindow.open(map, marker);  
                  });
                    </script>
                </div>
            </div>
            <hr/>
        </div>
        <!-- 댓글 입력 -->
        <div class="container">
        
            <div class="reply">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <form id="demo">
                            <div class="form-group">
                                <label for="firstName">닉네임</label>
                                <input type="text" class="form-control" id="firstName" name="firstName">
                            </div>
                            <div class="form-group">
                                <label for="comments">덧글입력</label>
                                <textarea class="form-control" id="comments" name="comments"></textarea>
                            </div>
                            <div class="form-group" id="rating">
                                <label for="rating">평가</label>
                            </div>
                            <button type="button" id="btnInsertReply" class="btn btn-primary btn-block">등록 </button>
                        </form>
                    </div>
                </div>
                <br/> <br/> <br/>
                <div id="reply">
                </div>
            </div>
            <!-- 댓글 입력 끝-->
            
         <!-- 별점 스크립트 -->
            <script type="text/javascript">
               $(function(){
                  $("#rating").emojiRating({
                        fontSize: 32,
                        onUpdate: function(count) {
                            $(".review-text").show();
                            $("#starCount").html(count + " Star");
                        }
                    });
               });
            </script>
            <!-- 별점스크립트 끝 -->
            
        </div>
        
    </section>
    <!--메인끝 -->
    
</body>
</html>