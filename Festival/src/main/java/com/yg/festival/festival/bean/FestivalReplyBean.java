package com.yg.festival.festival.bean;

public class FestivalReplyBean {
	private String fr_no; // 축제 댓글 고유번호 
	private String fr_content; // 축제 댓글 내용
	private String fr_starpoint; // 축제 댓글 별점
	private String fr_date; // 축제 댓글 생성날짜
	private String fr_member_ideaname;
	private String ff_titleimage;
	private String ff_realpath;
	private String festival_no; // 축제 메인 고유번호(FK)
	private String memberNo; // 회원아이디(FK)
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getFr_no() {
		return fr_no;
	}
	public void setFr_no(String fr_no) {
		this.fr_no = fr_no;
	}
	public String getFr_content() {
		return fr_content;
	}
	public void setFr_content(String fr_content) {
		this.fr_content = fr_content;
	}
	public String getFr_starpoint() {
		return fr_starpoint;
	}
	public void setFr_starpoint(String fr_starpoint) {
		this.fr_starpoint = fr_starpoint;
	}
	public String getFr_date() {
		return fr_date;
	}
	public void setFr_date(String fr_date) {
		this.fr_date = fr_date;
	}
	public String getFestival_no() {
		return festival_no;
	}
	public void setFestival_no(String festival_no) {
		this.festival_no = festival_no;
	}
	
	public String getFr_member_ideaname() {
		return fr_member_ideaname;
	}
	public void setFr_member_ideaname(String fr_member_ideaname) {
		this.fr_member_ideaname = fr_member_ideaname;
	}
	public String getFf_titleimage() {
		return ff_titleimage;
	}
	public void setFf_titleimage(String ff_titleimage) {
		this.ff_titleimage = ff_titleimage;
	}
	public String getFf_realpath() {
		return ff_realpath;
	}
	public void setFf_realpath(String ff_realpath) {
		this.ff_realpath = ff_realpath;
	}
} // end of class
