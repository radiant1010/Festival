<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
   <title>master_Festival_page</title>
   
   <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/main_style.css" /> <!--header,footer,전체셋팅-->
   <link rel="stylesheet" type="text/css" href="/css/style(sub).css" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
   
   <script type="text/javascript" src="/js/common/angular-1.6.4/angular.js"></script>
   <script type="text/javascript" src="/js/common/jquery/jquery-1.12.4.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="/js/common/common.js"></script>
   
   <!-- AngulerJS 외부js 가져오기 -->
   <script type="text/javascript" src="/js/festival/festivalApp.js"></script>
   <script type="text/javascript" src="/js/festival/festivalController.js"></script>
   
   <style>
        html, body{font-family:'Noto Sans KR', sans-serif, dotum, '돋움', gulim, '굴림', Arial, AppleGothic, verdana, helvetica; font-size:14px; letter-spacing:-0.05em; line-height:1.6; font-weight:400; color:#333; margin:0; overflow-x:hidden; !important;}
        a{color:#333333; text-decoration:none;}
        a:link{color:#333333; text-decoration:none;transition:all .3s ease}
        a:visited{color:#333333; text-decoration:none}
        a:active{color:#333333; text-decoration:none}
        a:hover{color:#666666; text-decoration:none}olor:#666666; text-decoration:none}
        
        /* 정진근 : 마스터 페이지 용 css추가 - class명 바꿈 */
        .write_table_master {
         width: 100%;
         text-align: center;
      }
      .write_table_master table {
         width: 100%;
         border-collapse: separate;
         border-spacing: 1px;
         text-align: left;
         line-height: 1.5;
         border-top: 1px solid #ccc;
         margin: 20px 10px;
         border-top: 2px solid #606a73;
      }
      .write_table_master table tr.answer td {
         background-color: #f9f9f9;
         color: #666;
      }
      .write_table_master table tr th {
         padding: 10px;
         font-weight: bold;
         vertical-align: top;;
         border-bottom: 1px solid #ccc;
         background: #efefef;
         width: 20%;
      }
      .write_table_master table tr td {
         padding: 3px 10px;
         vertical-align: middle;
         border-bottom: 1px solid #ccc;
      }
      .write_table_master table tr td input[type="text"] {
         width: 100%;
         padding: 5px;
         border: none;
      }
      .write_table_master table tr td textarea {
         resize: none;
         width: 100%;
         min-height: 200px;
         border: none;
      }
      /* 축제 이미지 설정 */
      .festival_imgSize {
         width: 200px;
         heigth: 200px;
         margin: 5px 5px;
      }
   </style>
   
   <script type="text/javascript">

      // 추가한 사진추가버튼 마지막 행을 삭제한다.
      function btnDelPicture() {
         $("#addPicture:last > tr:last").remove();
      }
      
      // 이미지 낱개 삭제
      function btnDelImage(index, path) {
         
         if (confirm("삭제하시겠습니까?")) {
            
            $.ajax({
               type : "post",
               url : "/festival/master_deleteFestivalImage.do",
               data : {
                  ff_no : index,
                  ff_path : path
               }, 
               dataType : "json",
               success : function(data) {
                  if (data.result == "ok") {
                     alert(data.resultMsg);
                     location.reload();
                  } else {
                     alert(data.resultMsg);
                  }
               }
            }); // end of ajax
         } // end of if
      }
      
      $(function(){

         // 사진을 추가하는 버튼을 생성한다.
         $("#btnAddPicture").click(function() {
            var str = "";
            str += "<tr>";
            str += "<th></th>"
            str += "<td>";
            str += "<input style='width:95%; float:left;' type='file' multiple id='upFile' name='upFile'>";
            str += "<button type='button' onclick='btnDelPicture()'> x </button>";
            str += "</td>";
            str += "</tr>";
            
            $("#addPicture").append(str);
         });
         
         // 축제 수정한다.
         $("#btn_updateFestival").click(function(){
            
            var name = $("#festival_name").val();
            var detail_intro = $("#festival_detail_intro").val();
            var detail_fee = $("#festival_detail_fee").val();
            var detail_parking = $("#festival_detail_parking").val();
            var detail_time = $("#festival_detail_time").val();
            var detail_notice = $("#festival_detail_notice").val();
            var location_x = $("#festival_location_x").val();
            var location_y = $("#festival_location_y").val();
            var _thema1 = $("#thema1").val();
            var _thema2 = $("#thema2").val();
            var _thema3 = $("#thema3").val();
            var address = $("#fb_address").val();
            var startdate = $("#fb_startdate").val();
            var enddate = $("#fb_enddate").val();
            var org_name = $("#fb_org_name").val();
            var org_phone = $("#fb_org_phone").val();
            var org_link = $("#fb_org_link").val();
            var upFile = $("input[name=upFile]");
            
            
            var formData = new FormData();
            
            formData.append("festival_no", "${fBean.festival_no}");
            
            formData.append("festival_name", name);
            formData.append("festival_detail_intro", detail_intro);
            formData.append("festival_detail_fee", detail_fee);
            formData.append("festival_detail_parking", detail_parking);
            formData.append("festival_detail_time", detail_time);
            formData.append("festival_detail_notice", detail_notice);
            formData.append("festival_location_x", location_x);
            formData.append("festival_location_y", location_y);
            formData.append("thema1", _thema1);
            formData.append("thema2", _thema2);
            formData.append("thema3", _thema3);
            formData.append("fb_address", address);
            formData.append("fb_startdate", startdate);
            formData.append("fb_enddate", enddate);
            formData.append("fb_org_name", org_name);
            formData.append("fb_org_phone", org_phone);
            formData.append("fb_org_link", org_link);
            
            if (upFile.val() == "") {
//                alert("사진은 추가하지 않으셨습니다.");
            } else {
               for (var i = 0; i < upFile.length; i++) {
                  formData.append("upFile", upFile[i].files[0]);
               }
            }
            
            $.ajax({
               type : "post",
               url : "/festival/master_updateFestivalProc.do",
               processData : false,
               contentType : false,
               data : formData,
               success : function(data) {
                  if (data.result == "ok") {
                     alert(data.resultMsg);
                     
                     location.replace("/festival/master_selectFestival.do?festival_no=" + data.fBean.festival_no);
                  } else {
                     alert(data.resultMsg);
                  }
               }
            }); // end of ajax
         }) // end of click
      }); // end of ready
   
   </script>
   
</head>
<body>
   <!--메인 -->
   <section>
      <div class="sub_wrap">
         <div class="sub_bg">
            <h1>관리자 페이지</h1>
            <img src="/images/community.jpg" alt="서브배경" />   
         </div>
         <!-- 서브 네비 -->
         <div class="sub_nav">
            <div class="sub_menu">
               <h3>관리자 페이지</h3>
               <ul>
<!--                   <li><a href="/festival/master_insertFestival.do">축제 추가</a></li> -->
                  <li><a href="/festival/master_managerFestival.do" class="on">축제 관리</a></li>
               </ul>
            </div>
            <div class="sub_title">
               <h2>축제 변경</h2>
            </div>

            <!-- 서브 내용 -->
            <div class="sub_content">
               <div class="write_table_master">
                  <table>
                     <tr>
                        <th>축제이름</th>
                        <td><input type="text" id="festival_name" class="input" value="${fBean.festival_name}" /></td>
                     </tr>
                     <tr>
                        <th>축제개요</th>
                        <td><textarea id="festival_detail_intro" >${fBean.festival_detail_intro}</textarea></td>
                     </tr>
                     <tr>
                        <th>요금정보</th>
                        <td><input type="text" id="festival_detail_fee" class="input" value="${fBean.festival_detail_fee}" /></td>
                     </tr>
                     <tr>
                        <th>주차정보</th>
                        <td><input type="text" id="festival_detail_parking" class="input" value="${fBean.festival_detail_parking}" /></td>
                     </tr>
                     <tr>
                        <th>축제시간</th>
                        <td><input type="text" id="festival_detail_time"  class="input" value="${fBean.festival_detail_time}" /></td>
                     </tr>
                     <tr>
                        <th>주의사항</th>
                        <td><textarea id="festival_detail_notice" >${fBean.festival_detail_notice}</textarea></td>
                     </tr>
                     <tr>
                        <th>축제 위치 (위도값)</th>
                        <td><input type="text" id="festival_location_x"  class="input" value="${fBean.festival_location_x}" /></td>
                     </tr>
                     <tr>
                        <th>축제 위치 (경도값)</th>
                        <td><input type="text" id="festival_location_y"  class="input" value="${fBean.festival_location_y}" /></td>
                     </tr>
                     <tr>
                        <th>테마설정</th>
                        <td>
                        <div class="gallery_select">
                                 <div class="dropdown">
                                 <select id="thema1" class="dropdown-select">
                                   <option value="${fBean.thema1}">${fBean.thema1}</option>
<!--                                         <option value="">지역별</option> -->
                                      <c:if test="${fBean.thema1 ne '강원도'}">
                                         <option value="강원도">강원도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '경기도'}">
                                         <option value="경기도">경기도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '경상남도'}">
                                         <option value="경상남도">경상남도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '경상북도'}">
                                         <option value="경상북도">경상북도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '전라남도'}">
                                         <option value="전라남도">전라남도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '전라북도'}">
                                         <option value="전라북도">전라북도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '제주도'}">
                                         <option value="제주도">제주도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '충청남도'}">
                                         <option value="충청남도">충청남도</option>
                                      </c:if>
                                      <c:if test="${fBean.thema1 ne '충청북도'}">
                                         <option value="충청북도">충청북도</option>
                                      </c:if> 
                                   
                                 </select>
                              </div>
                               <div class="dropdown">
                                 <select id="thema2" class="dropdown-select">
                                   <option value="${fBean.thema2}">${fBean.thema2}</option>
                                  <c:if test="${fBean.thema2 ne '가족'}">    
                                      <option value="가족">가족</option>
                                   </c:if>
                                   <c:if test="${fBean.thema2 ne '연인'}">
                                      <option value="연인">연인</option>
                                   </c:if>
                                   <c:if test="${fBean.thema2 ne '친구/솔로'}">
                                      <option value="친구/솔로">친구/솔로</option>
                                   </c:if>
                                 </select>
                               </div>
                               <div class="dropdown">
                                 <select id="thema3" class="dropdown-select">
                                   <option value="${fBean.thema3}">${fBean.thema3}</option>
                                   <c:if test="${fBean.thema3 ne '진행중'}">
                                      <option value="진행중">진행중</option>
                                   </c:if>
                                   <c:if test="${fBean.thema3 ne '완료'}">
                                      <option value="완료">완료</option>
                                   </c:if>
                                 </select>
                               </div>
                             </div>
                        </td>
                     </tr>
                     <tr>
                        <th>축제주소</th>
                        <td><input type="text" id="fb_address"  class="input" value="${fbBean.fb_address}" /></td>
                     </tr>
                     <tr>
                        <th>축제시작일</th>
                        <td><input type="text" id="fb_startdate"  class="input" value="${fbBean.fb_startdate}" /></td>
                     </tr>
                     <tr>
                        <th>축제종료일</th>
                        <td><input type="text" id="fb_enddate"  class="input" value="${fbBean.fb_enddate}" /></td>
                     </tr>
                     <tr>
                        <th>주관자/주관단체 이름</th>
                        <td><input type="text" id="fb_org_name"  class="input" value="${fbBean.fb_org_name}" /></td>
                     </tr>
                     <tr>
                        <th>주관자/주관단체 전화번호</th>
                        <td><input type="text" id="fb_org_phone"  class="input" value="${fbBean.fb_org_phone}" /></td>
                     </tr>
                     <tr>
                        <th>주관자/주관단체 홈페이지 주소</th>
                        <td><input type="text" id="fb_org_link"  class="input" value="${fbBean.fb_org_link}" /></td>
                     </tr>
                     <tr>
                        <th>축제 사진</th>
                        <td>
                           <c:forEach var="bean" items="${fFBeanList}" varStatus="status">
                              <img class="festival_imgSize" src="${bean.ff_realpath}" />
                              <button type="button" onclick="btnDelImage('${bean.ff_no}','${bean.ff_path}'); return false;"> x </button>
                           </c:forEach>
                        </td>
                     </tr>
                     <tr>
                        <th>축제 사진<button style='float:right;'  type="button" id="btnAddPicture" >사진추가</button></th>
                        <td>
                           <input style="width:95%; float:left;" type="file" multiple id="upFile" name="upFile">*
                        </td>
                     </tr>
                     <tbody id="addPicture">
                     </tbody>
                  </table>
                  <button type="button" class="btn_submit" id="btn_updateFestival">변경완료</button>
                  <button type="button" class="btn_submit" onclick="javascript:history.back();">뒤로가기</button>
               </div>
            </div>
         </div>
      </div>
      
   </section>
   <!--메인끝 -->
</body>
</html>