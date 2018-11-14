package com.yg.festival.board.service;

import java.util.List;

import com.yg.festival.board.bean.BoardBean;
import com.yg.festival.board.bean.BoardFileBean;
import com.yg.festival.board.bean.BoardReplyBean;
import com.yg.festival.common.bean.PagingBean;

public interface BoardService {
	
	/** 게시글 insert 처리 **/
	public int insertBoard(BoardBean bBean);
	
	/** 게시글 insert 업로드 처리 **/
	public int insertBoardFile(BoardBean bBean, BoardFileBean bfBean, String upPath);
	
	/** 게시글 1건 조회 **/
	public BoardBean selectBoard(BoardBean bean);
	
	/** 게시글 정보 조회 **/
	public List<BoardBean> selectBoardInfo(BoardBean bean);
	
	/** 게시판 게시글 수정 **/
	public int updateBoard(BoardBean bean);
	
	public int updateBoardFile(BoardBean bBean, BoardFileBean bfBean, String upPath);
	
	/** 게시판 조회수 증가 **/
	public int updateBoardJoin(BoardBean bean);

	
	/** 파일 List **/
	public List<BoardFileBean> selectBoardFileList(BoardBean bean);
	
	/** 게시판 게시글 삭제 **/
	public int deleteBoard(BoardBean bean);
	
	/** 게시판 글 및 파일 삭제 **/
	public int deleteBoardFile(BoardBean bBean, BoardFileBean bfBean);
	
	/** 게시판 파일만 삭제 **/
	public int deleteBoardOnlyFile(BoardFileBean bfBean);
	
	/** 게시판를 조회해서 리스트로 가져온다. **/
	public List<BoardBean> selectBoardList(PagingBean bean) throws Exception;

	/** 전체 레코드 개수를 가져온다. **/
	public int selectBoardListTotalConut(PagingBean bean) throws Exception;
	
	/** 댓글 작성 부분 (재현) **/
	public int writeBoardReply(BoardReplyBean rBean);
	
	/** 댓글 조회 (재현) **/
	public List<BoardReplyBean> selectBoardReplyList(BoardReplyBean bean);
	
	/** 댓글 1건 조회 **/
	public BoardReplyBean selectBoardReply(BoardReplyBean bean);
	
	/** 댓글 삭제 처리 **/
	public int deleteBoardReply(BoardReplyBean bean);
	
}
