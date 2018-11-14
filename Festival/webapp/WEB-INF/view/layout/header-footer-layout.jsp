<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>LOGIN</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link href="/css/main_style.css" rel="stylesheet" type="text/css" />
<!--header,footer,전체셋팅-->
<link rel="stylesheet" type="text/css" href="/css/style(sub).css" />
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function logoutAjax() {
		$.ajax({
			url : "/member/logoutAjax.do",
			method : "POST",
			data : {},
			dataType : "json",

			success : function(data) {
				if (data.result == "ok") {
					location.href = "/index.do"
				} else {
					alert(data.resultMsg);
				}
			}
		});
	}
</script>
<style>
/* festival main페이지 반응형 설정 */
@media screen and (max-width: 767px) {
	.gallery .gallery_box {
	    margin-top: 30px;
	    width: 30%;
	    float: left;
	    margin-left: 8px;
	    margin-right : 0;
	    box-shadow: 0 1px 10px rgba(0, 0, 0, 0.15);
	}
	.gallery .gallery_box a img {
	    max-width: 100%;
	    opacity: 1;
	    -webkit-transition: .3s ease-in-out;
	    transition: .3s ease-in-out;
	    height: 150px;
	    width: 100%;
	}
	.gallery .gallery_box .caption {
	    padding: 10px;
	    height: 50px;
	}
	.gallery .gallery_box a {
	    display: block;
	    background-color: #fff;
	    position: relative;
	    text-decoration: underline;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    font-size: 13px;
	}
	.caption p {
	   display : none;
	}
}
</style>
<decorator:head />
</head>
<c:choose>
   	<c:when test="${!empty sessionScope.memberBean.memberAdmin}">
      <body onload="window.open('/websocket.do', 'popup01', 'left=400, top=200, width=500, height=300, scrollbars= 0, toolbar=0, menubar=no')">
   	</c:when>
   	<c:otherwise>
<body>
	</c:otherwise>
</c:choose>
	<!-- header : s -->
	<c:import url="/WEB-INF/view/layout/header-layout.jsp"></c:import>
	<!-- header : e -->
	<div>
		<decorator:body />
	</div>
	<!-- footer : s -->
	<c:import url="/WEB-INF/view/layout/footer-layout.jsp"></c:import>
	<!-- footer : e -->

</body>
</html>