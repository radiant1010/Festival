package com.yg.festival.board.dao;

import java.util.List;

import com.yg.festival.board.bean.BoardBean;
import com.yg.festival.common.bean.PagingBean;

public interface BoardDao {
	
	/** 게시판를 조회해서 가져온다. **/
	public BoardBean selectBoard(BoardBean bean);
	
	/** 게시판 게시글 저장 **/
	public int insertBoard(BoardBean bean);
	
	/** 게시글 정보 조회 **/
	public List<BoardBean> selectBoardInfo(BoardBean bean);
	
	/** 게시판 게시글 수정 **/
	public int updateBoard(BoardBean bean);
	
	/** 게시판 조회수 증가 **/
	public int updateBoardJoin(BoardBean bean);
	
	/** 게시판 게시글 삭제 **/
	public int deleteBoard(BoardBean bean);
	
	/** 게시판를 조회해서 리스트로 가져온다. **/
	public List<BoardBean> selectBoardList(PagingBean bean);

	/** 전체 레코드 개수를 가져온다. **/
	public int selectBoardListTotalConut(PagingBean bean);

}
