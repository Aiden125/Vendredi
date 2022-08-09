package com.pro.vendredi.service;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.Kakao;
import com.pro.vendredi.dto.Member;
import com.pro.vendredi.dto.Naver;

public interface MemberService {
	public int memberIdConfirm(String mid);
	public int memberEmailConfirm(String memail);
	public int memberJoin(Member member, HttpSession httpSession);
	public String memberLogin(String mid, String mpw, HttpSession httpSession );
	public String naverLogin(Member member,HttpSession httpSession) ;
	public int naverJoin(Member member, HttpSession httpSession);
	public String memberSearchId(Member member);
	public String memberSearchPw(Member member);
	public Member memberGetDetail(String mid);
	public int memberModify(Member member , MultipartHttpServletRequest mRequest);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
//	public String naverSave(Naver naver, HttpSession session);
//	public String getAccessToken (String authorize_code) throws ParseException;
//	public Kakao getUserInfo(String access_Token);
//	public Kakao kakaoNumber(Kakao userInfo);
//	public String getToken(String code) throws IOException, Exception;
//	public Map<String, Object> getUserInfo(String access_token) throws Exception;
//	public String getAgreementInfo(String access_token);
}
