package com.pro.vendredi.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.Member;

public interface MemberService {
	public int memberIdConfirm(String mid);
	public int memberEmailConfirm(String memail);
	public int memberJoin(Member member, HttpSession httpSession);
	public String memberLogin(String mid, String mpw, HttpSession httpSession );
	public Member memberSearchId(Member member);
	public Member memberSearchPw(Member member);
	public Member memberGetDetail(String mid);
	public int memberModify(Member member , MultipartHttpServletRequest mRequest);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
}
