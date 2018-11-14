package com.yg.festival.festival.bean;

import org.springframework.web.multipart.MultipartFile;

public class FestivalFileBean {
	private String ff_no; // 축제 파일 고유번호
	private String ff_name; // 축제 파일 이름
	private String ff_titleimage; // 축제 메인용 사진
	
	private String ff_realpath;
	private String ff_path; // 경로
	private String ff_size; // 크기
	private String ff_originname; // 파일진짜이름
	private MultipartFile upFile[];
	
	private String festival_no; // 축제 메인 고유번호(FK)
	public String getFf_realpath() {
		return ff_realpath;
	}
	public void setFf_realpath(String ff_realpath) {
		this.ff_realpath = ff_realpath;
	}
	public String getFf_no() {
		return ff_no;
	}
	public void setFf_no(String ff_no) {
		this.ff_no = ff_no;
	}
	public String getFf_name() {
		return ff_name;
	}
	public void setFf_name(String ff_name) {
		this.ff_name = ff_name;
	}
	public String getFf_titleimage() {
		return ff_titleimage;
	}
	public void setFf_titleimage(String ff_titleimage) {
		this.ff_titleimage = ff_titleimage;
	}
	public String getFestival_no() {
		return festival_no;
	}
	public void setFestival_no(String festival_no) {
		this.festival_no = festival_no;
	}
	public String getFf_path() {
		return ff_path;
	}
	public void setFf_path(String ff_path) {
		this.ff_path = ff_path;
	}
	public String getFf_size() {
		return ff_size;
	}
	public void setFf_size(String ff_size) {
		this.ff_size = ff_size;
	}
	public String getFf_originname() {
		return ff_originname;
	}
	public void setFf_originname(String ff_originname) {
		this.ff_originname = ff_originname;
	}
	public MultipartFile[] getUpFile() {
		return upFile;
	}
	public void setUpFile(MultipartFile[] upFile) {
		this.upFile = upFile;
	}
} // end of class
