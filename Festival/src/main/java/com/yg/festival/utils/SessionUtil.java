package com.yg.festival.utils;

import javax.servlet.http.HttpServletRequest;

import com.yg.festival.common.Constants;
import com.yg.festival.member.bean.MemberBean;

/**
 * 세션  Util
 * 
 * @author CSG
 */
public class SessionUtil {

	/**
	 * 세션에 memberBean을 셋팅한다.
	 */
	public static void setMemberBean(HttpServletRequest request, MemberBean memberBean){
		request.getSession().setAttribute(Constants.SESSION_MEMBER_BEAN, memberBean);
	}

	/**
	 * 세션에서 memberBean을 가져온다.
	 */
	public static MemberBean getMemberBean(HttpServletRequest request){
		return (MemberBean)request.getSession().getAttribute(Constants.SESSION_MEMBER_BEAN);
	}
	
	/**
	 * 세션에서 memberId를 가져온다.
	 */
	public static String getMbId(HttpServletRequest request){
		MemberBean memberBean = (MemberBean)request.getSession().getAttribute(Constants.SESSION_MEMBER_BEAN);
		String mbId = null;
		if ( memberBean != null ){
			mbId = memberBean.getMemberId();
		}
		return mbId;
	}
	
	/**
	 * 세션에서 sellerBean을 제거한다
	 */
	public static void removeMemberBean(HttpServletRequest request){
		request.getSession().removeAttribute(Constants.SESSION_MEMBER_BEAN);
	}
	
}
