package com.pro.vendredi.dao;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Member;
@Mapper
public interface MemberDao {
	public int memberIdConfirm(String mid);
	public int memberEmailConfirm(String memail);
	public int memberJoin(Member member);
	public String memberLogin(Member member);
	public String memberSearchId(Member member);
	public String memberSearchPw(Member member);
	public Member memberGetDetail(String mid);
	public int memberModify(Member member);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
}
