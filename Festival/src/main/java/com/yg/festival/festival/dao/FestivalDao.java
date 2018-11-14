package com.yg.festival.festival.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yg.festival.common.bean.PagingBean;
import com.yg.festival.festival.bean.FestivalBasicBean;
import com.yg.festival.festival.bean.FestivalBean;
import com.yg.festival.festival.bean.FestivalFileBean;
import com.yg.festival.festival.bean.FestivalReplyBean;

public interface FestivalDao {
	//재환
	public List<FestivalBean> selectFestivalListAng(@Param("festivalBean") FestivalBean fBean,@Param("pagingBean") PagingBean pBean);
	public List<FestivalBasicBean> selectFestivalBasicListAng(@Param("festivalBasicBean") FestivalBasicBean fBBean,@Param("pagingBean") PagingBean pBean);
	public int selectFestivalTotalCount();
	// 전체 레코드 갯수를 가져온다.(페이징) / 현우
	public int selectFestivalListTotalCount(PagingBean pBean);
	// 메인 축제정보 전체 불러오기
	public List<FestivalBean> selectFestivalList(PagingBean pBean);
	// 메인 축제정보 검색해서 불러오기 / 현우
	public List<FestivalBean> searchSelectFestivalList(PagingBean pBean);
	// 기본 축제정보 전체 불러오기
	public List<FestivalBasicBean> selectFestivalBasicList(FestivalBasicBean fBBean);
	// 파일 축제정보 전체 불러오기
	public List<FestivalFileBean> selectFestivalFileList(FestivalFileBean fFBean);

	/** 게시판를 조회해서 리스트로 가져온다. **/
	public List<FestivalBean> selectBoardList(PagingBean bean);
	/** 전체 레코드 갯수를 가져온다. **/
	public int selectBoardListTotalCount(PagingBean bean);
	
	//축제 별점 계산
	public List<FestivalBean> selectRatingStar(FestivalBean fBean);
	// 메인 축제정보 한건 불러오기
	public FestivalBean selectFestival(FestivalBean fBean);
	// 메인 축제정보 전체 갯수 
	public int selectFestivalCount();
	// 기본 축제정보 한건 불러오기
	public FestivalBasicBean selectFestivalBasic(FestivalBean fBean);
	// 파일 축제정보 한건 불러오기
	public List<FestivalFileBean> selectFestivalFile(FestivalBean fBean);
	// 상세 축제 댓글 정보 불러오기
	public List<FestivalReplyBean> selectFestivalReply(FestivalBean fBean);
	
	// 축제 추가(FestivalBean)
	public int insertFestival(FestivalBean fBean);
	// 축제 추가(FestivalBasicBean)
	public int insertFestivalBasic(FestivalBasicBean fBBean);
	// 축제 추가(FestivalFileBean)
	public int insertFestivalFile(FestivalFileBean fFBean);
	// 축제 추가(FestivalReplyBean)
	public int insertFestivalReply(FestivalReplyBean fRBean);
	
	// 축제 변경(FestivalBean)
	public int updateFestival(FestivalBean fBean);
	// 축제 변경(FestivalBasicBean)
	public int updateFestivalBasic(FestivalBasicBean fBBean);
	// 축제 변경(FestivalFileBean)
	public int updateFestivalFile(FestivalFileBean fFBean);
	// 축제 댓글 수정(FestivalReplyBean)
	public int updateFestivalReply(FestivalReplyBean fRBean);
	
	// 축제 삭제(FestivalBean)
	public int deleteFestival(FestivalBean fBean);
	// 축제 삭제(FestivalBasicBean)
	public int deleteFestivalBasic(FestivalBasicBean fBBean);
	// 축제 삭제(FestivalFileBean)
	public int deleteFestivalFile(FestivalFileBean fFBean);
	// 축제 삭제(FestivalReplyBean)
	public int deleteFestivalReply(FestivalReplyBean fRBean);
	// 축제 삭제(FestivalReplyBean)
	public int deleteTotalFestivalReply(FestivalReplyBean fRBean);
	// 축제 삭제(FestivalReplyBean)
	public int deleteFestivalImage(FestivalFileBean fFBean);
	
	//진행여부 - 진행중
	   public int updateFestivalDate(FestivalBasicBean fBBean);
	   //진행여부 - 완료
	   public int updateFestivalEnd(FestivalBasicBean fBBean);
} // end of interface
