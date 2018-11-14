package com.yg.festival.festival.bean;

public class FestivalBasicBean {
	private String fb_no; // 축제 기본정보 고유번호
	private String fb_address; // 축제 기본정보 주소
	private String fb_startdate; // 축제 기본정보 시작일
	private String fb_enddate; // 축제 기본정보 종료일
	private String fb_org_name; // 축제 기본정보 주최 이름
	private String fb_org_phone; // 축제 기본정보 주최 전화번호
	private String fb_org_link; // 축제 기본정보 주최 홈페이지
	
	private String festival_no; // festival_no : 축제 메인 고유번호(FK)
	
	public String getFb_no() {
		return fb_no;
	}
	public void setFb_no(String fb_no) {
		this.fb_no = fb_no;
	}
	public String getFb_address() {
		return fb_address;
	}
	public void setFb_address(String fb_address) {
		this.fb_address = fb_address;
	}
	public String getFb_startdate() {
		return fb_startdate;
	}
	public void setFb_startdate(String fb_startdate) {
		this.fb_startdate = fb_startdate;
	}
	public String getFb_enddate() {
		return fb_enddate;
	}
	public void setFb_enddate(String fb_enddate) {
		this.fb_enddate = fb_enddate;
	}
	public String getFb_org_name() {
		return fb_org_name;
	}
	public void setFb_org_name(String fb_org_name) {
		this.fb_org_name = fb_org_name;
	}
	public String getFb_org_phone() {
		return fb_org_phone;
	}
	public void setFb_org_phone(String fb_org_phone) {
		this.fb_org_phone = fb_org_phone;
	}
	public String getFb_org_link() {
		return fb_org_link;
	}
	public void setFb_org_link(String fb_org_link) {
		this.fb_org_link = fb_org_link;
	}
	public String getFestival_no() {
		return festival_no;
	}
	public void setFestival_no(String festival_no) {
		this.festival_no = festival_no;
	}
} // end of class FestivalBasicBean
