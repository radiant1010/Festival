'use strict';

var temp = {
		now_Record : "",
		total_Record : "",
		onePage_Record : "",
};

festivalApp.filter("myFilter", function(){
	return function(items, param){
		var arr = [];
		
		if (param != undefined && param != "") {
			for (var i = 0; i < items.length; i++) {
				if (items[i].thema1 == param || items[i].thema2 == param || items[i].thema3 == param) {
					arr.push(items[i]);
				}
			}
			return arr;
		}
		return items;
	}
});


festivalApp.controller('FestivalController', FestivalController);

FestivalController.$inject = ['$rootScope', '$scope', 'FestivalService'];

// 컨트롤러
function FestivalController($rootScope, $scope, FestivalService) {
	
	// 축제 전체조회
	$scope.selectFestivalList = function() {
		var totalFestivalInfo = [];
		
		FestivalService.selectFestivalList().then(function(data){
			
			console.log(JSON.stringify(data)); // JSON.stringify(data) : json형태로 바꾸어준다.
			
			$scope.festivalList = data.fListBean; // data.변수명 : fListBean은 서버에서 키값으로 넘겨준 이름이다!!!!!! 명심!!!
			$scope.memberBean = data.memberBean;
		});
	}; 
	
	// 관리자 - 축제관리 
	$scope.master_selectFestivalList = function() {
		var totalFestivalInfo = [];
		
		FestivalService.master_selectFestivalList().then(function(data){ // festivalApp.js 에서 정의한 함수 호출 / 성공하면 .then 실행
			console.log(JSON.stringify(data));
			
			if (data.fBeanList.length == data.fBBeanList.length) {
				for (var i = 0; i < data.fBeanList.length; i++) {
					totalFestivalInfo[i] = {
							festival_no : data.fBeanList[i].festival_no,
							festival_name : data.fBeanList[i].festival_name,
							festival_detail_intro : data.fBeanList[i].festival_detail_intro,
							thema1 : data.fBeanList[i].thema1,
							thema2 : data.fBeanList[i].thema2,
							thema3 : data.fBeanList[i].thema3,
							
							fb_startdate : data.fBBeanList[i].fb_startdate,
							fb_enddate : data.fBBeanList[i].fb_enddate
					}
				}
			} else {
				alert("DB정보가 잘못되었습니다. 메인 축제정보와 기본 축제정보 테이블 갯수가 일치하지 않습니다.");
				return;
			}
			
			$scope.festivalList = totalFestivalInfo;
		});
	};
    //재환
	$scope.selectFestivalListAng = function(pageNo) {
		var totalFestivalInfo = [];	
    	if( $scope.pBean == undefined ) {
    		$scope.pBean = {};
    	}
    	
    	$scope.pBean.pageNo = pageNo;
    	
    	FestivalService.selectFestivalListAng($scope.pBean).then(function(data) {
    		
    		if (data.festivalList.length == data.festivalBasicList.length) {
				for (var i = 0; i < data.festivalList.length; i++) {
					totalFestivalInfo[i] = {
							festival_no : data.festivalList[i].festival_no,
							festival_name : data.festivalList[i].festival_name,
							festival_detail_intro : data.festivalList[i].festival_detail_intro,
							thema1 : data.festivalList[i].thema1,
							thema2 : data.festivalList[i].thema2,
							thema3 : data.festivalList[i].thema3,
							
							fb_startdate : data.festivalBasicList[i].fb_startdate,
							fb_enddate : data.festivalBasicList[i].fb_enddate
					}
				}
			} else {
				alert("DB정보가 잘못되었습니다. 메인 축제정보와 기본 축제정보 테이블 갯수가 일치하지 않습니다.");
				return;
			}
			
			$scope.fBean = totalFestivalInfo;
    		$scope.pBean = data.pagingBean; //페이징 정보
    		
    	});
    	
    };
    //배열 생성 함수
    $scope.getArr = function(num) {
    	return new Array(num);
    };
};

