<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	function search() {

		var searchText = $("#searchText").val();

		if (searchText == "") {
			alert("검색어를 입력하세요.");
			$("#searchText").focus();
			return;
		}

		//검색실행
		showList(searchText);
	};
	//웹용 아작스
	function showList(searchTextVal) {
		$.ajax({
			type : "post",
			url : "/festival/searchViewProc.do",
			data : {
				pageNo : "${param.pageNo}",
				'searchText' : searchTextVal
			},
			dataType : "json",
			success : function(data) {
				console.log(data);

				if (data.result == "ok") {

					$("#searchBody").empty();

					//리스트 출력
					$.each(data.festivalBean, function(i, fBean) {
						var str = "";
						str += "<tr>";
						str += "<td><a href='/festival/festival_view.do?festival_no="+ fBean.festival_no + "&'>" + fBean.festival_name+ "</a></td>";
						str += "<td>" + fBean.thema1 + "</td>";
						str += "<td>" + fBean.thema2 + "</td>";
						str += "<td>" + fBean.thema3 + "</td>";
						str += "</tr>";

						$("#searchBody").append(str);
					});

				} else {
					alert(data.resultMsg);
				}

			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status
						+ ", error : " + error);
			}
		});
	};

	//////////////////////////////////////////////
	$(function() {

		showList('${param.searchText}');

	});//end ready
</script>


<style>
@media screen and (max-width:767px) {
	form.search_form {
		width: 100%;
		margin: auto;
	}
	.search_form .form_search_info {
		height: 40px;
		width: 55%;
		border: 1px solid #1b5ac2;
		background: #ffffff;
		margin: auto;
	}
	.search_form .form_search_info .search_text {
		font-size: 16px;
		width: 75%;
		outline: none;
		float: left;
		height: 95%;
	}
	.search_form .form_search_info .search_btn {
		width: 25%;
		height: 100%;
		border: 0px;
		background: #1b5ac2;
		outline: none;
		float: right;
		color: #ffffff;
		font-size: 12px;
	}
	h1.searchresult {
		font-size: 28px;
		margin-left: 3%;
	}
	form.search_form {
		margin: 0 40% 0 0;
	}
	div.search_area {
		width: 95%;
		margin: auto;
		height: auto;
		margin-left: 2%;
		margin-right: 8%;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	span.search_info_info {
		margin-left: 3%;
		word-spacing: normal;
		font-size: 13px;
	}
}

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

.search_festival {
	margin: 0 auto;
	width: 1200px;
}

.search_info {
	text-indent: 20px;
}

.search_form {
	width: 1200px;
	margin: 0 750px;
}

input:-ms-input-placeholder {
	color: #a8a8a8;
}

input::-webkit-input-placeholder {
	color: #a8a8a8;
}

input::-moz-placeholder {
	color: #a8a8a8;
}

h1 {
	width: 1200px;
	margin: 0 auto;
}

.form_search_info {
	height: 40px;
	width: 400px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
}

.search_text {
	font-size: 16px;
	width: 325px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
	height: 95%;
}

.search_btn {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff;
}

.search_area {
	width: 1200px;
	margin: 0 auto;
}

.paging {
	width: 1200px;
	text-align: center;
	margin: 0 auto;
}

.search_info_info {
	/* margin: 0 20px; */
	word-spacing: normal;
	margin-right: 5%;
}

.search_form {
	width: 1200px;
	margin: 0 40%;
}
</style>
</head>
<body>

	<!-- 섹션 -->
	<section>

		<select name="searchType" style="display: none">
			<option value="title">제목</option>
		</select>

	<div class="form_search_info">
		<input class="search_text" type="text" name="searchText" id="searchText" value="${searchText}" />
		<button type="button" class="search_btn"
			onClick="search(); return false;">검색</button>
	</div>

	</hr>
	</br>

	<div class="search_area">
		<hr />
		<div class="notice_table">
			<table>
				<colgroup>
					<col width="10%" class="col1" >
					<col width="10%" class="col2" >
					<col width="10%" class="col3" >
					<col width="10%" class="col4" >
					
				</colgroup>
				<tr>
					<th style="text-align: center;">축제명</th>
					<th style="text-align: center;">지역</th>
					<th style="text-align: center;">분류</th>
					<th style="text-align: center;">진행여부</th>
				</tr>

				<tbody id="searchBody">
				</tbody>

			</table>
		</div>

	</div>

	<!-- 검색 결과 나오는 화면 -->


	<div class="page">

		<ul>
			<c:if test="${pagingBean.groupNo > 1}">
				<li><a
					href="/festival/searchView.do?pageNo=${pBean.pageStartNo - 1}"
					class="on">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pagingBean.pageStartNo}"
				end="${pagingBean.pageEndNo}">
				<c:choose>
					<c:when test="${pagingBean.pageNo != i}">
						<li><a
							href="/festival/searchView.do?pageNo=${i}&searchType=${param.searchType}&searchText=${param.searchText}"
							class="on">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="on">${i}</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingBean.groupNo < pagingBean.totalGroupCount}">
				<li><a
					href="/festival/searchView.do?pageNo=${pBean.pageEndNo + 1}"
					class="on">&gt;</a></li>
			</c:if>

		</ul>
	</div>

	</section>
	<!-- 색션 끝 -->

</body>
</html>