package com.pro.vendredi.service;

import javax.servlet.http.HttpSession;

import com.pro.vendredi.dto.Member;

public interface MemberService {
	public int memberIdConfirm(String mid);
	public int memberEmailConfirm(String memail);
	public int memberJoin(Member member, HttpSession httpSession);
	public String memberLogin(String mid, String mpw, HttpSession httpSession );
	public String memberSearchId(Member member);
	public String memberSearchPw(Member member);
	public Member memberGetDetail(String mid);
	public int memberModify(Member member);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
}
