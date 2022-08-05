package com.pro.vendredi.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.Member;

public interface MemberService {
	public int memberIdConfirm(String mid);
	public int memberEmailConfirm(String memail);
	public int memberJoin(Member member, HttpSession httpSession);
	public String memberLogin(String mid, String mpw, HttpSession httpSession );
	public String memberSearchId(Member member);
	public String memberSearchPw(Member member);
	public Member memberGetDetail(String mid);
	public int memberModify(Member member , MultipartHttpServletRequest mRequest);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
	public String getAccessToken (String authorize_code);
//	public HashMap<String, Object> getUserInfo(String access_Token);
//	public String getToken(String code) throws IOException, Exception;
//	public Map<String, Object> getUserInfo(String access_token) throws Exception;
//	public String getAgreementInfo(String access_token);
}
