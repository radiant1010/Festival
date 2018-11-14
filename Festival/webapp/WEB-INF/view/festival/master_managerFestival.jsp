<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>master_Festival_page</title>

<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/main_style.css" />
<!--header,footer,전체셋팅-->
<link rel="stylesheet" type="text/css" href="/css/style(sub).css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<script type="text/javascript" src="/js/common/angular-1.6.4/angular.js"></script>
<script type="text/javascript"
	src="/js/common/jquery/jquery-1.12.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>

<!-- AngulerJS 외부js 가져오기 -->
<script type="text/javascript" src="/js/festival/festivalApp.js"></script>
<script type="text/javascript" src="/js/festival/festivalController.js"></script>

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
olor
:
#666666
;
 
text-decoration
:none
}
</style>

<script type="text/javascript">
	$(function() {

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
						<li><a href="/festival/master_managerFestival.do" class="on">축제
								관리</a></li>
					</ul>
				</div>
				<div class="sub_title">
					<h2>축제 관리</h2>
				</div>

				<!-- 축제 관리 메인 시작 -->
				<div class="sub_content" ng-app="festivalApp"
					ng-controller="FestivalController"
					ng-init="selectFestivalListAng('${param.pageNo == null ? 1 : param.pageNo}')">
					<div class="btn_wrap">
						<button class="btn_write" id="btnInsertFestival"
							onclick="location.href='/festival/master_insertFestival.do'">축제
							추가</button>
						<div class="find">
							<input type="text" class="input" placeholder="검색할 단어를 입력하세요"
								ng-model="text_input" />
						</div>
					</div>
					<div class="notice_table">
						<table>
							<colgroup>
								<col width="10%">
								<col width="*">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="10%">
							</colgroup>
							<tr>
								<th>게시번호</th>
								<th>축제명</th>
								<th>축제기간</th>
								<th>테마1(지역별)</th>
								<th>테마2(테마별)</th>
								<th>테마3(진행여부)</th>
								<th>축제번호</th>
							</tr>
							<tr ng-repeat="fb in fBean | filter : text_input">
								<td>{{(pBean.totalRecordCount - $index) - ((pBean.pageNo-1) * 10)}}</td>
								<td><a
									href="/festival/master_selectFestival.do?festival_no={{fb.festival_no}}">{{fb.festival_name}}</a></td>
								<td>{{fb.fb_startdate}} ~ {{fb.fb_enddate}}</td>
								<td>{{fb.thema1}}</td>
								<td>{{fb.thema2}}</td>
								<td>{{fb.thema3}}</td>
								<td>{{fb.festival_no}}</td>
							</tr>
						</table>
					</div>
					<!-- 페이징 작업해야됨 -->
					<div class="page">
					<ul>
						<li class="on"><a ng-if="pBean.groupNo > 1" ng-click="selectFestivalListAng(pBean.pageStartNo-1)">&lt
						</a></li>
							<span ng-repeat="p in getArr(pBean.totalPageCount) track by $index"><li class="on">
								<a ng-click="selectFestivalListAng($index+1)"> {{$index+1}}
								</a> 
							</li></span> 
						<li class="on"><a ng-if="pBean.groupNo < pBean.totalGroupCount}}" ng-click="selectFestivalListAng(pBean.pageEndNo+1)">&gt
						</a></li>
					</ul>
					</div>
				</div>
				<!-- 축제 관리 메인 끝 -->
			</div>
		</div>

	</section>
	<!--메인끝 -->
</body>
</html>