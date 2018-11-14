package com.yg.festival.festival.service;

import java.util.List;

import com.yg.festival.common.bean.PagingBean;
import com.yg.festival.festival.bean.FestivalBasicBean;
import com.yg.festival.festival.bean.FestivalBean;
import com.yg.festival.festival.bean.FestivalFileBean;
import com.yg.festival.festival.bean.FestivalReplyBean;

public interface FestivalService {
//재환
	public List<FestivalBean> selectFestivalListAng(FestivalBean fBean, PagingBean pBean) throws Exception;
	public List<FestivalBasicBean> selectFestivalBasicListAng(FestivalBasicBean fBBean, PagingBean pBean) throws Exception;
	public int selectFestivalTotalCount();
	// 메인 축제정보 전체 불러오기
	public List<FestivalBean> selectFestivalList(PagingBean pBean) throws Exception;
	// 기본 축제정보 전체 불러오기
	public List<FestivalBasicBean> selectFestivalBasicList(FestivalBasicBean fBBean) throws Exception;
	// 파일 축제정보 전체 불러오기
	public List<FestivalFileBean> selectFestivalFileList(FestivalFileBean fFBean) throws Exception;
	
	// 메인 축제정보 전체 갯수
	public int selectFestivalCount() throws Exception;
	// 메인 축제정보 검색 리스트 / 현우
	public List<FestivalBean> searchSelectFestivalList(PagingBean pBean) throws Exception;
	// 게시글 정보를 전체 리스트 갯수를 가져온다. / 현우
	public int selectFestivalListTotalCount(PagingBean pBean) throws Exception;
	// 상세 축제 댓글 불러오기
	public List<FestivalReplyBean> selectFestivalReply(FestivalBean fBean) throws Exception;
	//축제 별점 계산하기 / 현우
	public List<FestivalBean> selectRatingStar(FestivalBean fBean) throws Exception;
	// 메인 축제정보 한건 불러오기
	public FestivalBean selectFestival(FestivalBean fBean) throws Exception;
	// 기본 축제정보 한건 불러오기
	public FestivalBasicBean selectFestivalBasic(FestivalBean fBean) throws Exception;
	// 파일 축제정보 한건 불러오기
	public List<FestivalFileBean> selectFestivalFile(FestivalBean fBean) throws Exception;
	
	// 축제 추가(FestivalBean)
	public int insertFestival(FestivalBean fBean) throws Exception;
	// 축제 추가(FestivalBasicBean)
	public int insertFestivalBasic(FestivalBasicBean fBBean) throws Exception;
	// 축제 추가(FestivalFileBean)
	public int insertFestivalFile(FestivalFileBean fFBean) throws Exception;
	// 축제 추가(FestivalReplyBean)
	public int insertFestivalReply(FestivalReplyBean fRBean) throws Exception;
	
	// 축제 변경(FestivalBean)
	public int updateFestival(FestivalBean fBean) throws Exception;
	// 축제 변경(FestivalBasicBean)
	public int updateFestivalBasic(FestivalBasicBean fBBean) throws Exception;
	// 축제 변경(FestivalFileBean)
	public int updateFestivalFile(FestivalFileBean fFBean) throws Exception;
	// 축제 댓글 수정(FestivalReplyBean)
	public int updateFestivalReply(FestivalReplyBean fRBean) throws Exception;
	
	// 축제 삭제(FestivalBean)
	public int deleteFestival(FestivalBean fBean) throws Exception;
	// 축제 삭제(FestivalBasicBean)
	public int deleteFestivalBasic(FestivalBasicBean fBBean) throws Exception;
	// 축제 삭제(FestivalFileBean)
	public int deleteFestivalFile(FestivalFileBean fFBean) throws Exception;
	// 축제 삭제(FestivalReplyBean)
	public int deleteFestivalReply(FestivalReplyBean fRBean) throws Exception;
	// 축제 삭제(FestivalReplyBean)
	public int deleteTotalFestivalReply(FestivalReplyBean fRBean) throws Exception;
	// 축제 삭제(FestivalFileBean)
	public int deleteFestivalImage(FestivalFileBean fFBean) throws Exception;
	
	//진행여부 - 진행중
   public int updateFestivalDate(FestivalBasicBean fBBean) throws Exception;
   //진행여부 - 완료
   public int updateFestivalEnd(FestivalBasicBean fBBean) throws Exception;
} // end of interface
