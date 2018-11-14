package com.yg.festival.board.dao;

import java.util.List;

import com.yg.festival.board.bean.BoardReplyBean;

public interface BoardReplyDao {

	/** 댓글 쓰기 처리 **/
	public int writeBoardReply(BoardReplyBean bean);
	
	/** 댓글 리스트 조회 **/
	public List<BoardReplyBean> selectBoardReplyList(BoardReplyBean bean);
	
	/** 댓글 1건 조회 **/
	public BoardReplyBean selectBoardReply(BoardReplyBean bean);
	
	/** 댓글 삭제 처리 **/
	public int deleteBoardReply(BoardReplyBean bean);
}
