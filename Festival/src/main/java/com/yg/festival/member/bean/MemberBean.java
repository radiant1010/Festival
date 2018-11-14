package com.yg.festival.member.bean;

public class MemberBean {
	private String memberNo;
	private String memberId;
	private String memberPw;
	private String memberPw2;
	private String memberName;
	private String memberAge;
	private String memberGender;
	private String memberPhone;
	private String hp1;
	private String hp2;
	private String hp3;
	private String token;
	private String memberAdmin;
	
	public String getMemberAdmin() {
		return memberAdmin;
	}
	public void setMemberAdmin(String memberAdmin) {
		this.memberAdmin = memberAdmin;
	}
	public String getMemberPw2() {
		return memberPw2;
	}
	public void setMemberPw2(String memberPw2) {
		this.memberPw2 = memberPw2;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(String memberAge) {
		this.memberAge = memberAge;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String hp) {
		this.memberPhone = hp;
		if(hp != null) {
			try {
				String[] strArr = hp.split("-");
				for(int i=0; i<strArr.length; i++) {
					if(i == 0) hp1 = strArr[i];
					if(i == 1) hp2 = strArr[i];
					if(i == 2) hp3 = strArr[i];
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
}
