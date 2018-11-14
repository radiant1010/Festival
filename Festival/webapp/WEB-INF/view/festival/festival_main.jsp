<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>Festival_Main</title>
	

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
        @media screen and (max-width: 767px) {
			footer {
				display: none;
			}
		}
	</style>
	
	<script type="text/javascript">
	
		$(function(){
			// 관리자 페이지 초기상태
			var masterPage = $("#masterPage").hide();
			var memberId = $("#memberId").val();
			
			if (memberId == 'jjk') {
				masterPage.show();
			}
			
			// 축제 추가하기
			masterPage.click(function(){
				
				location.href="/festival/master_managerFestival.do";
				
			});
		});
	
	</script>
</head>
<body >
	<!--메인 -->
	<section ng-app="festivalApp" ng-controller="FestivalController" ng-init="selectFestivalList()" >
		<div class="sub_wrap">
			<div class="sub_bg">
				<h1>축제 Festival</h1>
				<img src="/images/festival.jpg" alt="서브배경" />	
			</div>
			<div class="gallery" >
				<h2 class="title">Festival</h2>
				<div class="title_hr"></div>
				<p class="text">가족, 연인, 친구들과 즐길 수 있는 축제를 소개합니다. 여러분의 행복을 주위 사람들과 나누세요.</p>
	            <div class="gallery_select">
	               	<div class="dropdown">
	                  <select ng-model="thema1" id="thema1" class="dropdown-select">
	                    <option value="">지역별</option>
	                    <option value="강원도">강원도</option>
	                    <option value="경기도">경기도</option>
	                    <option value="경상남도">경상남도</option>
	                    <option value="경상북도">경상북도</option>
	                    <option value="전라남도">전라남도</option>
	                    <option value="전라북도">전라북도</option>
	                    <option value="제주도">제주도</option>
	                    <option value="충청남도">충청남도</option>
	                    <option value="충청북도">충청북도</option> 
	                  </select>
		            </div>
	                <div class="dropdown">
	                  <select ng-model="thema2" id="thema2" class="dropdown-select">
	                    <option value="">테마별</option>
	                    <option value="가족">가족</option>
	                    <option value="연인">연인</option>
	                    <option value="친구/솔로">친구/솔로</option>
	                  </select>
	                </div>
	                <div class="dropdown">
	                  <select ng-model="thema3" id="thema3" class="dropdown-select">
	                    <option value="">진행여부</option>
	                    <option value="진행중">진행중</option>
	                    <option value="완료">완료</option>
	                    </select>
                	</div>
                	
               		<!-- 관리자 페이지 버튼 : 로그인 한 회원이 관리자일때, 버튼을 나타나게 한다. 지금은 임시로 'jjk'아이디가 관리자이다 -->
<!-- 			   		<a class="myButton" id="masterPage"> -->
<!-- 			   			관리자님이 오셨군요? [축제 추가하기] -->
<!-- 			   		</a> -->
<%-- 			   		<input id="memberId" type="hidden" value="${memberBean.member_id}" /> --%>
			   		
              	</div>
              	<!-- 현재 ng-show로 paging되어있는 것을 ng-repeat의 필터역할로 바꾸어주는 작업을 해보자  -->
				<div class="gallery_box" ng-repeat="festival in festivalList | myFilter:thema1 | myFilter:thema2 | myFilter:thema3 ">
<!-- 					{{$index+1}} -->
					<a href="/festival/festival_view.do?festival_no={{festival.festival_no}}">
						<img ng-src="{{festival.ff_titleimage}}" alt="{{festival.ff_titleimage}}" />
<!-- 						<img ng-src="/images/festival_title/{{festival.ff_titleimage}}" alt="{{festival.ff_titleimage}}" /> -->
						<span>MORE</span>
					</a>
					<div class="caption">
					    <a href="#"></a>
						<h4><a class="gallery_detail" href="/festival/festival_view.do?festival_no={{festival.festival_no}}" >{{festival.festival_name}}</a></h4>
						<p class="ellipsis" >{{festival.festival_detail_intro}}</p>
					</div>
					
				</div>
			</div>
    	</div>
    	
	</section>
	<!--메인끝 -->
</body>
</html>