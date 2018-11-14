package com.yg.festival.board.bean;

import org.springframework.web.multipart.MultipartFile;

import com.yg.festival.common.bean.CommonBean;

public class BoardFileBean extends CommonBean {
	
	private MultipartFile upFile[];
	
	private String bfNo;
	private String bfName;
	private String boardNo;
	private String filePath;
	private String fileOriginName;
	private String fileImgPath;
	
	
	public MultipartFile[] getUpFile() {
		return upFile;
	}
	public void setUpFile(MultipartFile[] upFile) {
		this.upFile = upFile;
	}
	public String getBfNo() {
		return bfNo;
	}
	public void setBfNo(String bfNo) {
		this.bfNo = bfNo;
	}
	public String getBfName() {
		return bfName;
	}
	public void setBfName(String bfName) {
		this.bfName = bfName;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getFilePath() {
		return filePath;
	}
	public String getFileOriginName() {
		return fileOriginName;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}
	public String getFileImgPath() {
		return fileImgPath;
	}
	public void setFileImgPath(String fileImgPath) {
		this.fileImgPath = fileImgPath;
	}
	
}
