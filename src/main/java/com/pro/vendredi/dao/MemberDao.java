package com.pro.vendredi.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Kakao;
import com.pro.vendredi.dto.Member;
import com.pro.vendredi.dto.Naver;
@Mapper
public interface MemberDao {
	public int memberIdConfirm(String mid);
	public int memberEmailConfirm(String memail);
	public int memberJoin(Member member);
	public String memberLogin(Member member);
	public Member memberSearchId(Member member);
	public Member memberSearchPw(Member member);
	public Member memberGetDetail(String mid);
	public int memberModify(Member member);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
	//네이버 로그인
	public String naverLogin(Member member);
	//네이버 회원가입
	public int naverJoin(Member member);
//	//카카오 로그인
//	public void kakaoJoin(HashMap<String, Object> userInfo);
//	//카카오 확인
//	public Kakao kakaoLogin(HashMap<String, Object> userInfo);
}
