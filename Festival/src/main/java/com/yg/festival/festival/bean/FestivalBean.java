package com.yg.festival.festival.bean;

public class FestivalBean {
	private String festival_no; // 축제 고유번호
	private String festival_name; // 축제 이름
	private String festival_detail_intro; // 축제 개요
	private String festival_detail_fee; // 축제 이용요금
	private String festival_detail_parking; // 축제 주차여부
	private String festival_detail_time; // 축제 개장,폐장시간
	private String festival_detail_notice; // 축제 주의사항
	private String festival_location_x; // 축제위치 위도값
	private String festival_location_y; // 축제위치 경도값
	private String thema1; // 지역
	private String thema2; // 관계
	private String thema3; // 진행중, 완료
	
	private String ff_titleimage; // FestivalFileBean 서브쿼리 받을 변수
	
	public String getFestival_no() {
		return festival_no;
	}
	public void setFestival_no(String festival_no) {
		this.festival_no = festival_no;
	}
	public String getFestival_name() {
		return festival_name;
	}
	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}
	public String getFestival_detail_intro() {
		return festival_detail_intro;
	}
	public void setFestival_detail_intro(String festival_detail_intro) {
		this.festival_detail_intro = festival_detail_intro;
	}
	public String getFestival_detail_fee() {
		return festival_detail_fee;
	}
	public void setFestival_detail_fee(String festival_detail_fee) {
		this.festival_detail_fee = festival_detail_fee;
	}
	public String getFestival_detail_parking() {
		return festival_detail_parking;
	}
	public void setFestival_detail_parking(String festival_detail_parking) {
		this.festival_detail_parking = festival_detail_parking;
	}
	public String getFestival_detail_time() {
		return festival_detail_time;
	}
	public void setFestival_detail_time(String festival_detail_time) {
		this.festival_detail_time = festival_detail_time;
	}
	public String getFestival_detail_notice() {
		return festival_detail_notice;
	}
	public void setFestival_detail_notice(String festival_detail_notice) {
		this.festival_detail_notice = festival_detail_notice;
	}
	public String getFestival_location_x() {
		return festival_location_x;
	}
	public void setFestival_location_x(String festival_location_x) {
		this.festival_location_x = festival_location_x;
	}
	public String getFestival_location_y() {
		return festival_location_y;
	}
	public void setFestival_location_y(String festival_location_y) {
		this.festival_location_y = festival_location_y;
	}
	public String getThema1() {
		return thema1;
	}
	public void setThema1(String thema1) {
		this.thema1 = thema1;
	}
	public String getThema2() {
		return thema2;
	}
	public void setThema2(String thema2) {
		this.thema2 = thema2;
	}
	public String getThema3() {
		return thema3;
	}
	public void setThema3(String thema3) {
		this.thema3 = thema3;
	}
	public String getFf_titleimage() {
		return ff_titleimage;
	}
	public void setFf_titleimage(String ff_titleimage) {
		this.ff_titleimage = ff_titleimage;
	}
} // end of class FestivalBean
