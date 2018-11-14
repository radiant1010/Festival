<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function memberDeleteAjax(memNo){
	var result = confirm('정말로 지우시겠습니까?');
	if(result) { 
		$.ajax({
			url : "/member/memberDeleteAjax.do",
			method : "POST",
			data : {
				memberNo: memNo
			},
			dataType : "json",
			async: false,
			success : function(data) {
				if (data.result == "ok") {
					alert(data.resultMsg);
					location.replace("/member/memberList.do");
				} else {
					alert(data.resultMsg);
				}
			}
		});
	} else { 
	}
}
</script>
</head>

	<!--메인 -->
		<section>
			<div class="sub_wrap">
				<div class="sub_bg">
					<h1>멤버관리 MemberManagement</h1>
					<img src="/images/sub_bg.png" alt="서브배경" />	
				</div>
				<!-- 서브 네비 -->
				<div class="sub_nav">
					<div class="sub_menu">
						<h3>멤버관리</h3>
						<ul>
					    <li><a href="/member/memberList.do" class="on">멤버관리</a></li>
						</ul>
					</div>
					<div class="sub_title">
						<div class="rout">
							<ul>
								<li>홈</li>>
								<li>멤버관리</li> 
							</ul>
						</div>
						<h2>멤버관리</h2>
					</div>

					<!-- 서브 내용 -->
					<div class="sub_content">
						<div class="notice_table">
							<table>
								<colgroup>
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>핸드폰 번호</th>
									<th>나이</th>
									<th>성별</th>
									<th>삭제</th>
								</tr>
								<c:forEach var="bean" items="${memberList}" varStatus="status">
								<tr>
									<td>${bean.memberNo}</td>
									<td style="text-align:center">${bean.memberId}</td>
									<td>${bean.memberName}</td>
									<td>${bean.memberPhone}</td>
									<td>${bean.memberAge}</td>
									<td>${bean.memberGender}</td>
									<td><button class="btn_write" onclick="memberDeleteAjax(${bean.memberNo}); return false;" >회원삭제</button></td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<div class="page">
							<ul>
								<li><a href="#" class="on">1</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--메인끝 -->
	</body>
</body>
</html>