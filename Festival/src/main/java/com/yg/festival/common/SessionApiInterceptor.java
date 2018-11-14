package com.yg.festival.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yg.festival.member.bean.MemberBean;


public class SessionApiInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception 
	{
		MemberBean mBean = 
				(MemberBean)request.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		if( mBean == null ) {
			//로그인 안됐따.
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			
			String josnMsg = "{'result': 'fail', 'resultMsg': '로그인후 호출 가능합니다.'}";
			writer.write(josnMsg);
			writer.flush();
			writer.close();
			
			return false;
		} else {
			//로그인 됐다.
			return true;
		}
		
	}
	
}
