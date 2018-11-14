package com.yg.festival.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yg.festival.board.bean.BoardBean;
import com.yg.festival.board.bean.BoardFileBean;
import com.yg.festival.board.bean.BoardReplyBean;
import com.yg.festival.board.service.BoardService;
import com.yg.festival.common.Constants;
import com.yg.festival.common.bean.PagingBean;
import com.yg.festival.member.bean.MemberBean;
import com.yg.festival.utils.SessionUtil;

@Controller
public class BoardController {
	
	//파일 업로드 저장경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;
	@Value("#{config['upload.board.img.path']}")
	private String FILE_IMG_PATH;
	
	@Autowired
	private BoardService boardService;

	/** 게시판 View 화면 **/
	/**
	 * 
	 * @param model 조회한 객체를 심어서 보낼 model
	 * @param bBean
	 * @param bfBean
	 * @return
	 */
	@RequestMapping("/board/noticeView")
	public String noticeView(Model model, BoardBean bBean, BoardFileBean bfBean, BoardReplyBean brBean) {
		
		// 게시글 조회
		BoardBean tempBean = boardService.selectBoard(bBean);
		
		// 조회수 증가
		int tempBeanJoin = boardService.updateBoardJoin(bBean);
		
		// 파일 업로드 조회
		List<BoardFileBean> tempbfBean = boardService.selectBoardFileList(bBean);
		
//		BoardReplyBean tempbrBean = boardService.selectBoardReply(brBean);
		
		List<BoardReplyBean> tempbrList = boardService.selectBoardReplyList(brBean);
		
		List<BoardReplyBean> tt = new ArrayList<BoardReplyBean>();
		for (int i = 0; i < tempbrList.size(); i++) {
			if (tempbrList.get(i).getBoardNo().equals(bBean.getBoardNo())){
				tt.add(tempbrList.get(i));
			}
		}
		
		model.addAttribute("boardList",tempBean);
		model.addAttribute("tempBeanJoin", tempBeanJoin);
		model.addAttribute("fileList", tempbfBean);
		model.addAttribute("boardReplyList", tt);
//		model.addAttribute("boardReplyBean", tempbrBean);
		
		
		return "/board/noticeView";
	}
	
	/** 게시판 View AJAX **/
	@RequestMapping("/board/noticeViewAjax") 
	@ResponseBody
	public Map<String, Object> noticeViewAjax(BoardBean bean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 상세보기 실패");
		
		
		BoardBean bBean =  boardService.selectBoard(bean);
		
		resMap.put(Constants.RESULT, Constants.RESULT_OK);
		resMap.put(Constants.RESULT_MSG, "게시글 상세보기 성공");
		resMap.put("bBean", bBean); // 게시글 저장
		
		return resMap;
	}
	
	/** 게시판  InsertReply AJAX **/
	@RequestMapping("/board/noticeReplyViewAjax")
	@ResponseBody
	public Map<String, Object> noticeReplyViewAjax (BoardBean bean, BoardReplyBean rBean, HttpServletRequest request) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "댓글 작성 실패");
		
		MemberBean mBean = SessionUtil.getMemberBean(request);
		
		rBean.setMemberNo(mBean.getMemberNo());
		rBean.setMemberName(mBean.getMemberName());
		
		try {
			int res = boardService.writeBoardReply(rBean);

			List<BoardReplyBean> LbBean = boardService.selectBoardReplyList(rBean);

			BoardReplyBean LbBeanIndex = LbBean.get(LbBean.size()-1);

			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "댓글 작성 성공");
				resMap.put("BoardReplyBean", LbBeanIndex); // 게시글 저장
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	
	/** 게시판 List 화면 **/
	@RequestMapping("/board/noticeList")
	public String noticeList(Model model, BoardBean bBean, PagingBean pagingBean) {
		try {
			int totRecord = boardService.selectBoardListTotalConut(pagingBean);
			pagingBean.calcPage(totRecord);
			model.addAttribute("pagingBean",pagingBean);
			List<BoardBean> list = boardService.selectBoardList(pagingBean);
			model.addAttribute("boardList", list);
		} catch(Exception e){
			e.printStackTrace();
		}
		return "/board/noticeList";
	}
	
	/** 게시판 List AJAX **/
	@RequestMapping("/board/noticeListProc")
	@ResponseBody
	public Map<String, Object> boardListProcAjax(PagingBean pagingBean, BoardReplyBean boardReplyBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 조회 실패");

		try {
			int totRecord = boardService.selectBoardListTotalConut(pagingBean);
			pagingBean.calcPage(totRecord);
			List<BoardBean> list = boardService.selectBoardList(pagingBean);
			resMap.put(Constants.RESULT, Constants.RESULT_OK);
			resMap.put(Constants.RESULT_MSG, "게시글 조회 성공");

			resMap.put("boardBean", list);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}
	
	/** 게시판 쓰기 화면 **/
	@RequestMapping("/board/noticeWrite") 
		public String noticeWrite() {
			return "/board/noticeWrite";
	}
	
	/** 게시판 쓰기 AJAX **/
	@RequestMapping("/board/noticeWriteAjax")
	@ResponseBody
	public Map<String, Object> noticeWriteAjax(BoardBean bBean, BoardFileBean bfBean, HttpServletRequest request) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 작성 실패");
		
		MemberBean mBean = SessionUtil.getMemberBean(request);
		
		bBean.setMemberNo(mBean.getMemberNo());
		
		try {
			int res = boardService.insertBoardFile(bBean, bfBean, FILE_UPLOAD_PATH + "/upfile");

			List<BoardBean> LbBean = boardService.selectBoardInfo(bBean);

			BoardBean LbBeanIndex = LbBean.get(LbBean.size()-1);

			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "게시글 작성 성공");
				resMap.put("LbBean", LbBeanIndex); // 게시글 저장
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	
	
	/** 게시판 글쓰기 수정 화면 **/
	@RequestMapping("/board/noticeUpdate") 
	public String noticeUpdate(BoardBean bBean, Model model) {

		BoardBean tempBean =  boardService.selectBoard(bBean);
		
		// 파일 업로드 조회
		List<BoardFileBean> tempbfBean = boardService.selectBoardFileList(bBean);

		model.addAttribute("boardList", tempBean);
		model.addAttribute("fileList", tempbfBean);

		return "/board/noticeUpdate";
	}
	
	/** 게시판 글쓰기 수정 AJAX **/
	@RequestMapping("/board/noticeUpdateAjax")
	@ResponseBody
	public Map<String, Object> noticeUpdateAjax(BoardBean bBean, BoardFileBean bfBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 수정 실패");

		try {
			
			int res = boardService.updateBoardFile(bBean, bfBean, FILE_UPLOAD_PATH + "/upfile");
			
			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "게시글 수정 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	/** 게시글 글 및 파일 삭제 AJAX **/
	@RequestMapping("/board/deleteBoardAjax")
	@ResponseBody
	public Map<String, Object> deleteBoardAjax(BoardBean bBean, BoardFileBean bfBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 삭제 실패");
		
		try {
			int res = boardService.deleteBoardFile(bBean, bfBean);
			
			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "게시글 삭제 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	
	/** 게시글  파일 삭제 AJAX **/
	@RequestMapping("/board/deleteBoardFileAjax")
	@ResponseBody
	public Map<String, Object> deleteBoardFileAjax(BoardFileBean bfBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "파일 삭제 실패");
		
		try {
			int res = boardService.deleteBoardOnlyFile(bfBean);
			
			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "파일 삭제 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	
	/** 댓글 삭제 AJAX **/
	@RequestMapping("/board/deleteBoardReplyAjax")
	@ResponseBody
	public Map<String, Object> deleteBoardReplyAjax(BoardReplyBean brBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "댓글 삭제 실패");
		
		try {
			int res = boardService.deleteBoardReply(brBean);
			
			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "댓글 삭제 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	/** 웹 소켓 **/
	@RequestMapping("/websocket")
	   public String websocket() {
	      return "/websocket";
   }
}
