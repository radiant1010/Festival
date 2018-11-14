package com.yg.festival.member.service;

import java.util.List;

import com.yg.festival.common.bean.PagingBean;
import com.yg.festival.member.bean.MemberBean;


public interface MemberService {

	/** 회원 가입하기 **/
	public int insertMember(MemberBean Bean) throws Exception;
	
	/** 로그인 **/
	public int login(MemberBean memberBean) throws Exception;
	/** 네이버 로그인 회원 가입하기 **/
	public int insertMemberNaver(MemberBean Bean) throws Exception;
	/** 네이버 로그인 **/
	public int loginNaver(MemberBean memberBean) throws Exception;
	/** 회원 정보 가져오기 **/
	public MemberBean selectLoginMember(MemberBean bean) throws Exception;
	
	/** 회원 정보 가져오기 **/
	public MemberBean selectJoinMember(MemberBean bean) throws Exception;

	/** 회원정보를 조회해서 리스트로 가져온다. **/
	public List<MemberBean> selectMemberList(MemberBean memberBean) throws Exception;
	
	/** 회원정보를 수정한다. **/
	public int updateMember(MemberBean memberBean) throws Exception;
	
	/** 회원정보를 삭제한다. **/
	public void deleteMember(MemberBean memberBean) throws Exception;

	/** 아이디 중복 체크 **/
	public int chkId(MemberBean memberBean)throws Exception;

	/** 회원 아이디 찾기 **/
	public MemberBean selectMemberId(MemberBean memberBean) throws Exception;
	
	/** token값을 넣는다. **/
	public int updateToken(MemberBean memberBean) throws Exception;
//	
//	/** 회원 리스트 **/
//	public List<MemberBean> memberList(PagingBean pagingBean) throws Exception;
}
