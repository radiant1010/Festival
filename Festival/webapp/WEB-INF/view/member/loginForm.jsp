<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	var userInputId = getCookie("userInputId");
// 	$("input[name='memberId']").val(userInputId);
	//엔터키 이벤트
	$("#memberId").keydown(function(key) {
		if(key.keyCode == 13) {
			memberLoginAjax();
		}
	});
	$("#memberPw").keydown(function(key) {
		if(key.keyCode == 13) {
			memberLoginAjax();
		}
	});
});
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate()+exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "": "; exprires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
function getCookie(cookieName) {
	cookieName = cookieName + "=";
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = "";
	if(start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(";", start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

function memberLoginAjax(){
	var userInputId = $("#memberId").val();
	$("#memberId").empty();
	$.ajax({
		url : "/member/loginAjax.do",
		method : "POST",
		data : {
			memberId : $("#memberId").val(),
			memberPw : $("#memberPw").val(),
		},
		dataType : "json",

		success : function(data) {
			if (data.result == "ok") {
				setCookie("userInputId", userInputId, 30);//30일 동안 쿠키 저장
				//android 호출
				try {
					// 값 전달
					var memId = $("#memberId").val();
					window.mJSInterface.updateAndToken(memId);
				} catch(e) {
					console.log(e);
				}
// 				//로그인 성공
// 				location.replace("/index.do");
// 				return;
				location.href="/index.do"
			} else {
				alert(data.resultMsg);
			}
		}
	});
}
	
</script>

</head>
<body>

	<!--메인 -->
		<section>
			<div class="sub_wrap">
				<div class="sub_bg">
					<h1>로그인 Login</h1>
					<img src="/images/sub_bg.png" alt="서브배경" />	
				</div>
				<!-- 서브 네비 -->
				<div class="sub_nav">
					<div class="sub_menu">
						<h3>계정관리</h3>
						<ul>
					    <li><a href="/member/loginForm.do" class="on">로그인</a></li>
						</ul>
					</div>
					<div class="sub_title">
						<div class="rout">
							<ul>
							    <li>홈</li>>
								<li>로그인</li>
							</ul>
						</div>
						<h2>로그인</h2>
					</div>
					<!-- 서브 내용 -->
					<div class="sub_content">
						<div class="login_box">
							<input type="text" placeholder="아이디" id="memberId" name="memberId" class="input" />
							<input type="password" placeholder="비밀번호" id="memberPw" name="memberPw" class="input" />
							<button class="btn_submit" type="button" onclick="memberLoginAjax(); return false;">로그인</button>
							 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
							<div id="naver_id_login" style="text-align: center;"></div>
								  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
							 <script type="text/javascript">
								var naver_id_login = new naver_id_login("LhPEYAyHP0rUBi63E8lB", "http://kostafesta.cafe24.com/member/naverCallback.do");
								var state = naver_id_login.getUniqState();
								naver_id_login.setButton("Green", 5, 45);
								naver_id_login.setDomain("http://kostafesta.cafe24.com");
								naver_id_login.setState(state);
								naver_id_login.setPopup();
								naver_id_login.init_naver_id_login();
							</script>
							<div class="join">
								<ul>
									<li><a href="/join.do">회원가입</a></li>
									<!--<li><a href="find.html">ID/PW찾기</a></li>-->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--메인끝 -->
</body>
</html>