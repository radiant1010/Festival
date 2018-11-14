package com.yg.festival.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yg.festival.common.Constants;
import com.yg.festival.festival.bean.FestivalBasicBean;
import com.yg.festival.festival.bean.FestivalBean;
import com.yg.festival.festival.dao.FestivalDao;
import com.yg.festival.festival.service.FestivalService;
import com.yg.festival.member.bean.MemberBean;
import com.yg.festival.member.service.MemberService;

@Controller
public class IndexController {
	@Autowired
	private FestivalDao festivalDao;
	@Autowired
	private FestivalService festivalService;
	@Autowired
	private MemberService memberService;
	
	// 관리자 - 축제 한건 정보 페이지 이동
	@RequestMapping("/index")
	public String index(FestivalBean fBean, FestivalBasicBean fBBean, Model model) {
		try {
			int res1 = festivalService.updateFestivalDate(fBBean);
			int res2 = festivalService.updateFestivalEnd(fBBean);
			if (res1 <= 0 && res2 <= 0) {
				return "/errorPage500";
			}
			List<FestivalBean> fRstar = festivalService.selectRatingStar(fBean);
			model.addAttribute("fFBeanList", fRstar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/index";
	}
	
	/**
	 * 사용자의 토큰값을 받아서 정보를 업데이트 해준다.
	 * @return
	 */
	@RequestMapping("/updatePushToken")
	@ResponseBody
	public Map<String, Object> updatePushToken(MemberBean mBean) {
		
		//받아야 되는 정보?
		//안드로이드 정보전송 --> token, id ===> member테이블 (70%)
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "토큰정보 업데이트 실패");
		
		try {
			
			int resVal = memberService.updateToken(mBean);
			if(resVal > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "토큰정보 업데이트 성공");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
}
