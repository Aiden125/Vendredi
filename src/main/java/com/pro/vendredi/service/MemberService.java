package com.pro.vendredi.service;

import javax.servlet.http.HttpSession;

import com.pro.vendredi.dto.Member;

public interface MemberService {
	public int memberIdConfirm(String mid);
	public String memberEmailConfirm(String memail);
	public int memberJoin(Member member, HttpSession httpSession);
	public String memberLogin(String mid, String mpw, HttpSession httpSession );
	public Member memberGetDetail(String mid);
	public Member memberSearchId(String mname, String memail);
	public Member memberSearchPw(String mid, String mname);
	public int memberModify(Member member);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
}
