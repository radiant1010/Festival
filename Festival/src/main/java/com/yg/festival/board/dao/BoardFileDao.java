package com.yg.festival.board.dao;

import java.util.List;

import com.yg.festival.board.bean.BoardBean;
import com.yg.festival.board.bean.BoardFileBean;

public interface BoardFileDao {
	
	/** 파일 insert **/
	public int insertBoardFile(BoardFileBean bean);
	
	/** 파일 List **/
	public List<BoardFileBean> selectBoardFileList(BoardBean bean);
	
	/** 파일 삭제 **/
	public int deleteBoardFile(BoardFileBean bean);
	

}
