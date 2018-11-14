<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link href="/css/main_style.css" rel="stylesheet" type="text/css" />
<!--header,footer,전체셋팅-->
<link rel="stylesheet" type="text/css" href="/css/style(sub).css" />
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	function insertMember() {
		if(post_check()){
			$.ajax({
				type : "post",
				url : "/member/naverCallbackAjax.do",
				data : {
					memberId : $("#memberId").val(),
					memberPw : $("#memberPw").val(),
					memberName : $("#memberName").val(),
					memberGender : $("#memberGender").val()
				},
				dataType : "json",
				success : function(data){
					console.log(data);
					if(data.result == "ok"){
						alert(data.resultMsg);
						window.close();
						
						opener.$.ajax({
							type : "post",
							url : "/member/loginNaver.do",
							data : {
								memberId : document.getElementById("memberId").value
							},
							dataType : "json",
							success : function(data){
								console.log(data);
								if(data.result == "ok"){
									alert(data.resultMsg);
									
									
									return;
								}else{
									alert(data.resultMsg);
								}
							},
							error : function(xhr, status, error){
								console.log(xhr);
								alert("error\nxhr : " + xhr+ ", status"+status+", error : "+error);
							}
							
						});
						opener.document.location.href="/index.do";
						return;
					}else{
						alert(data.resultMsg);
					}
				},
				error : function(xhr, status, error){
					console.log(xhr);
					alert("error\nxhr : " + xhr+ ", status"+status+", error : "+error);
				}
				
			});
		}
		
			
		
	};
	function post_check(){
		  // 비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 6~16자리)
		  var ObjUserPassword = document.memberForm.memberPw;
		 
		  if(ObjUserPassword.value.length<6) {
		    alert("비밀번호는  6~16자까지 입력하세요.");
		    return false;
		  }
		 
		  if(!ObjUserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
		    alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여, 영문은 대소문자를 구분합니다.");
		    return false;
		  }
		  return true;
		  
		}
</script>
</head>
<body>
<script type="text/javascript">
var naver_id_login = new naver_id_login("LhPEYAyHP0rUBi63E8lB", "http://kostafesta.cafe24.com/naverCallback.do");
// 접근 토큰 값 출력
// alert(naver_id_login.oauthParams.access_token);
// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");
// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
//   alert(naver_id_login.getProfileData('email'));
//   alert(naver_id_login.getProfileData('name'));
//   alert(naver_id_login.getProfileData('age'));
//   alert(naver_id_login.getProfileData('gender'));
  
  var email = naver_id_login.getProfileData('email');
  var name = naver_id_login.getProfileData('name');
  var age = naver_id_login.getProfileData('age');
  var gender = naver_id_login.getProfileData('gender');
	$("#memberId").val(email);
	$("#memberName").val(name);
	$("#name").text(name);
	$("#memberGender").val(gender);


	$.ajax({
		type : "post",
		url : "/member/joinDoubleCheckProc.do",
		data : {
			memberId : $("#memberId").val()
		},
		dataType : "json",
		success : function(data){
			console.log(data);
			if(data.result == "ok"){
				window.close();
				opener.$.ajax({
					type : "post",
					url : "/member/loginNaver.do",
					data : {
						memberId : $("#memberId").val()
					},
					dataType : "json",
					success : function(data){
						console.log(data);
						if(data.result == "ok"){
							return;
						}else{
							return;
						}
					},
					error : function(xhr, status, error){
						console.log(xhr);
						alert("error\nxhr : " + xhr+ ", status"+status+", error : "+error);
					}
					
				});
				opener.document.location.href="/index.do";
				
				return;
			}else{
				alert("회원가입을 해주세요.");
			}
		},
		error : function(xhr, status, error){
			console.log(xhr);
			alert("error\nxhr : " + xhr+ ", status"+status+", error : "+error);
		}
		
	});
}
</script>
	<!-- 서브 내용 -->
					<div class="sub_content">
						 <img src="/images/title_subject.png" alt="로고" style="width: 100%">
						<form name="memberForm" class="join_table">
						    
						    <div class="login_box">
						    	<div class="tfield"><span id="name" style="font-size : 20px;"></span> 님 환영합니다.<br/> 비밀번호를 입력 후 회원가입하세요.</div>
						    	<div><input class="input" name="memberPw" id="memberPw" type="password" placeholder="비밀번호를 입력해 주세요"/><span class="small">* 비밀번호는 특수문자 포함하여 6자리 이상 입력해 주세요.</span></div>
						    	
						    </div>
								<input name="memberName" id="memberName" type="hidden" />
								<input name="token" id="token" type="hidden" />
								<input name="memberId" id="memberId" type="hidden" placeholder="아이디를 입력해 주세요"/>
								<input name="memberGender" id="memberGender" type="hidden" placeholder="아이디를 입력해 주세요"/>
							
							<div class="join_btn">
								<button class="btn_submit" type="button" onclick="insertMember(); return false;">가입하기</button>
								<button class="btn_back" type="button" onclick="window.close();">취소하기</button>
							</div>
						</form>
					</div>
				

</body>
</html>