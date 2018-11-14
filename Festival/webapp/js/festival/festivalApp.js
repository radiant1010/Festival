'use strict';

var festivalApp = angular.module('festivalApp', []);

// 서비스 정의
festivalApp.factory("FestivalService", function($http){
	var service = {};
	
	// service.메서드명 : 선언메서드와 동일하게 가져오자
	//  			 = 메서드명 : 아래 메서드 이름
	service.selectFestivalList = selectFestivalList;
	service.master_selectFestivalList = master_selectFestivalList;
	service.selectFestivalListAng = selectFestivalListAng;
	return service;
	
	function selectFestivalList(objParam) {
		return $http({
			url : "/festival/festival_main_Proc.do",
			method : "post",
			data : json2PostParams(objParam),
			headers : {'Content-Type' : 'application/x-www-form-urlencoded'}
		}).then(handlerSuccess, handlerError);
	};
	function master_selectFestivalList(objParam) {
		return $http({
			url : "/festival/master_selectFestivalListProc.do",
			method : "post",
			data : json2PostParams(objParam),
			headers : {'Content-Type' : 'application/x-www-form-urlencoded'}
		}).then(handlerSuccess, handlerError);
	};
    //재환
	function selectFestivalListAng(objParam) {
		return $http({
			url : "/festival/selectFestivalListAng.do",
			method : "post",
			data : json2PostParams(objParam),
			headers : {'Content-Type' : 'application/x-www-form-urlencoded'}
		}).then(handlerSuccess, handlerError);
	};
	// 공통 response 부분
	function handlerSuccess(res) {
		return res.data;
	}
	function handlerError(res) {
		return res.data;
	}
});


