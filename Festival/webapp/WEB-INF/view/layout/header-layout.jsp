<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 반응형 윗 메뉴 시작-->
<!-- Apply Responsive Menu CSS -->
	<link href="/css/responsive-menu.css" rel="stylesheet">
	
	<!-- Unessential CSS - Just here to make this sample page prettier -->
	<link
		href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700|Roboto:400,700'
		rel='stylesheet' type='text/css'>
	<link href="/css/styles.css" rel="stylesheet">
	
	<!-- Load modernizr or html5shiv -->
	<script src="http://cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js"
		type="text/javascript"></script>
	<script>
		window.modernizr|| document.write('<script src="/js/modernizr-custom.js"><\/script>')
	</script>
	<!--<script src="../lib/html5shiv/html5shiv.js"></script>-->
	
	<!-- Load jQuery -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		window.jQuery || document.write('<script src="/js/jquery.js"><\/script>')
		
	</script>
	
	<!-- Load Responsive Menu -->
	<script src="/js/responsive-menu.js" type="text/javascript"></script>
	
	<!-- Setup Responsive Menu -->
	<script>
		jQuery(function($) {
			var menu = $('.rm-nav').rMenu({
				minWidth : '960px',
	
			});
		});
	</script>
<!-- 반응형 윗 메뉴 끝-->
<style>
.wrapper{
	display:none;
}
@media screen and (max-width: 767px) {
			header .head2 {
			    display: none;
			}
			.wrapper{
				display: block;
			}
			footer {
				display: none;
			}
			.gallery {
				width: 100%;
				margin: 50px auto;
			}
			.search_form {
    	width: 100%;
	}
	
		}
		
</style>
	<!-- 헤더 -->
    <header>
        <div class="head">
            <h1 class="logo">
                <a href="/index.do">
                    <img src="/images/title_subject.png" alt="로고">
                </a>
            </h1>
            
				
            <div class="menu_box">
                <ul class="menu_member">
                
                	<!-- 로그인이 안되어 있을 때 화면 -->
	                <c:if test="${empty memberBean}">
<!-- 					<li><a href="/member/joinMain.do?bdCategoryCd=02">JOIN</a></li> -->
<!-- 					<li><a href="/member/loginForm.do?bdCategoryCd=01">LOGIN</a></li> -->
 						<li><a href="/member/loginForm.do">로그인</a></li>
 						<li><a href="/join.do">회원가입</a></li>
 						
					</c:if>
					
                	<!-- 로그인이 되어 있을 때 화면 -->
					<c:if test="${!empty memberBean}">
						<!-- 관리자 일때 화면 -->
						<c:if test="${!empty sessionScope.memberBean.memberAdmin}">
							<li><a href="/member/memberList.do">회원관리</a></li>
							<li><a href="/festival/master_managerFestival.do">축제관리</a></li>
						</c:if>
						<li><a href="/member/myList.do?memberId=${sessionScope.memberBean.memberId}">마이페이지</a></li>
						<li><a href="#" onclick="logoutAjax(); return false;">로그아웃</a></li>
					</c:if>
					
					<!--  관리자의 화면 -->
<%-- 					<c:if test="${memberBean.mbTypeCd eq 01 }"> --%>
<!-- 						<li><a href="/board/memberList.do?bdCategoryCd=04&mbTypeCd=04" class="orange">회원목록</a></li> -->
<%-- 					</c:if> --%>
                </ul>
            </div>
        </div>
        <div class="head2">
            <div class="menu_box2">
                <ul class="menu_title">
                    <li>
                        <a href="/about/about.do">소개</a>
                        <ul class="menu_list">
                            <li><a href="/about/about.do">인사말</a></li>
                            <li><a href="/about/pageguide.do">페이지 가이드</a></li>
                        </ul>
                    </li>
                     <li>
                        <a href="/festival/festival_main.do">축제</a>
                    </li>
                     <li>
                        <a href="/board/noticeList.do?pageNo=1">커뮤니티</a>
                        <ul class="menu_list">
                            <li><a href="/board/noticeList.do?pageNo=1">자유게시판</a></li>
                            <li><a href="/qna.do">QnA</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 반응형 헤더 시작 -->
        <div class="wrapper">
		<div class="brand">
			<p>
				<a href="/index.do" class="logo"><img
					src="/images/title_subject.png" alt="로고" class="img"></a>
			</p>
		</div>

		<!-- START Responsive Menu HTML -->
		<div class="rm-container">
			<a class="rm-toggle rm-button rm-nojs" href="#"></a>

			<nav class="rm-nav rm-nojs rm-lighten">
				<ul>
					<li><a href="#">소개</a>
						<ul>
							<li><a href="/about/about.do">인사말</a></li>
							<li><a href="/about/pageguide.do">페이지 가이드</a></li>
						</ul></li>
					<li><a href="/festival/festival_main.do">축제</a></li>
					<li><a href="#">커뮤니티</a>
						<ul>
							<li><a href="/board/noticeList.do?pageNo=1">자유게시판</a></li>
							<li><a href="/qna.do">Q &amp; A</a></li>
						</ul></li>
					<li><a href="#">회원</a> <c:if test="${empty memberBean}">
							<ul>
								<li><a href="/member/loginForm.do">로그인</a></li>
								<li><a href="/join.do">회원가입</a></li>
							</ul>
						</c:if> <c:if test="${!empty memberBean}">
							<ul>
								<li><a
									href="/member/myList.do?memberId=${sessionScope.memberBean.memberId}">마이페이지</a></li>
								<li><a href="#" onclick="logoutAjax(); return false;">로그아웃</a></li>
							</ul>
						</c:if></li>
				</ul>
			</nav>
		</div>
		<!-- .rm-container -->
		<!-- End Responsive Menu HTML -->
	</div>
	<!-- .wrapper -->
    <!-- 반응형 헤더 끝 -->
        
    </header>
    <!-- 반응형 script 시작 -->
    <!-- google-code-prettify -->
<script
	src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
<script>
	$(function() {
		$('pre').addClass('prettyprint');
	})
</script>
 <!-- 반응형 script 끝 -->

