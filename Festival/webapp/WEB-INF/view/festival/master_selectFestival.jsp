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
		}
	</style>
	
	<script type="text/javascript">
		
		$(function(){
			$("#btn_deleteFestival").click(function(){
				
				if (confirm("정말 삭제 하시겠습니까?")) {
					
					$.ajax({
						type : "post",
						url : "/festival/master_deleteFestivalProc.do",
						data : {
							festival_no : "${fBean.festival_no}"
						},
						dataType : "json",
						success : function(data) {
							if (data.result == "ok") {
								alert(data.resultMsg);
								location.replace("/festival/master_managerFestival.do");
							} else {
								alert(data.resultMsg);
							}
						}
					}); // end of ajax
				}
			}); // end of click
			
			$("#fix_image").click(function(){
			
				$.ajax({
					type : "post",
					url : "/festival/master_fixTitleImageProc.do",
					data : {
						festival_no : "${fBean.festival_no}",
						ff_no : $("input[type=radio][name=festival_img_check]:checked").val()
					},
					dataType : "json",
					success : function(data) {
						if (data.result == "ok") {
							alert(data.resultMsg);
							
						} else {
							alert(data.resultMsg);
						}
					}
				});
				
			}); // end of click
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
						<li><a href="/festival/master_managerFestival.do" class="on">축제 관리</a></li>
					</ul>
				</div>
				<div class="sub_title">
					<h2>축제 보기</h2>
				</div>

				<!-- 서브 내용 -->
				<div class="sub_content">
					<div class="write_table_master">
						<table>
							<tr>
								<th>축제이름</th>
								<td><input type="text" id="festival_name" class="input" disabled="disabled" value="${fBean.festival_name}" /></td>
							</tr>
							<tr>
								<th>축제개요</th>
								<td><textarea id="festival_detail_intro" disabled="disabled" >${fBean.festival_detail_intro}</textarea></td>
							</tr>
							<tr>
								<th>요금정보</th>
								<td><input type="text" id="festival_detail_fee" class="input" disabled="disabled" value="${fBean.festival_detail_fee}" /></td>
							</tr>
							<tr>
								<th>주차정보</th>
								<td><input type="text" id="festival_detail_parking" class="input" disabled="disabled" value="${fBean.festival_detail_parking}" /></td>
							</tr>
							<tr>
								<th>축제시간</th>
								<td><input type="text" id="festival_detail_time"  class="input" disabled="disabled" value="${fBean.festival_detail_time}" /></td>
							</tr>
							<tr>
								<th>주의사항</th>
								<td><textarea id="festival_detail_notice" disabled="disabled" >${fBean.festival_detail_notice}</textarea></td>
							</tr>
							<tr>
								<th>축제 위치 (위도값)</th>
								<td><input type="text" id="festival_location_x"  class="input" disabled="disabled" value="${fBean.festival_location_x}" /></td>
							</tr>
							<tr>
								<th>축제 위치 (경도값)</th>
								<td><input type="text" id="festival_location_y"  class="input" disabled="disabled" value="${fBean.festival_location_y}" /></td>
							</tr>
							<tr>
								<th>테마설정</th>
								<td>
								<div class="gallery_select">
					               	<div class="dropdown">
					                  <select id="thema1" class="dropdown-select" disabled="disabled">
					                    <option value="${fBean.thema1}">${fBean.thema1}</option>
					                  </select>
						            </div>
					                <div class="dropdown">
					                  <select id="thema2" class="dropdown-select" disabled="disabled">
					                    <option value="${fBean.thema2}">${fBean.thema2}</option>
					                  </select>
					                </div>
					                <div class="dropdown">
					                  <select id="thema3" class="dropdown-select" disabled="disabled">
					                    <option value="${fBean.thema3}">${fBean.thema3}</option>
					                    </select>
				                	</div>
				              	</div>
								</td>
							</tr>
							<tr>
								<th>축제주소</th>
								<td><input type="text" id="fb_address"  class="input" disabled="disabled" value="${fbBean.fb_address}" /></td>
							</tr>
							<tr>
								<th>축제시작일</th>
								<td><input type="text" id="fb_startdate"  class="input" disabled="disabled" value="${fbBean.fb_startdate}" /></td>
							</tr>
							<tr>
								<th>축제종료일</th>
								<td><input type="text" id="fb_enddate"  class="input" disabled="disabled" value="${fbBean.fb_enddate}" /></td>
							</tr>
							<tr>
								<th>주관자/주관단체 이름</th>
								<td><input type="text" id="fb_org_name"  class="input" disabled="disabled" value="${fbBean.fb_org_name}" /></td>
							</tr>
							<tr>
								<th>주관자/주관단체 전화번호</th>
								<td><input type="text" id="fb_org_phone"  class="input" disabled="disabled" value="${fbBean.fb_org_phone}" /></td>
							</tr>
							<tr>
								<th>주관자/주관단체 홈페이지 주소</th>
								<td><input type="text" id="fb_org_link"  class="input" disabled="disabled" value="${fbBean.fb_org_link}" /></td>
							</tr>
							<tr>
								<th>축제 사진<button style="float: right;" type="button" id="fix_image">대표사진 설정</button></th>
								<td>
									<c:forEach var="fFBean" items="${fFBeanList}" varStatus="status">
										<img class="festival_imgSize" src="${fFBean.ff_realpath}" alt="${fFBean.ff_realpath}"/>
										
										<c:choose>
											<c:when test="${fFBean.ff_titleimage ne null}">
												<input type="radio" name="festival_img_check" checked="checked" value="${fFBean.ff_no}" /> &nbsp;
											</c:when>
											<c:otherwise>
												<input type="radio" name="festival_img_check" value="${fFBean.ff_no}" /> &nbsp;
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</td>
							</tr>
						</table>
						<button type="button" class="btn_submit" onclick="location.replace('/festival/master_updateFestival.do?festival_no=${fBean.festival_no}')">변경모드 가기</button>
						<button type="button" class="btn_submit" id="btn_deleteFestival">삭제하기</button>
						<button type="button" class="btn_submit" onclick="location.href='/festival/master_managerFestival.do'">뒤로가기</button>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<!--메인끝 -->
</body>
</html>