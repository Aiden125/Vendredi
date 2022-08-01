package com.pro.vendredi.dao;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Member;
@Mapper
public interface MemberDao {
	public int memberIdConfirm(String mid);
	public String memberEmailConfirm(String memail);
	public int memberJoin(Member member);
	public String memberLogin(String mid, String mpw);
	public Member memberGetDetail(String mid);
	public Member memberSearchId(String mname, String memail);
	public Member memberSearchPw(String mid, String mname);
	public int memberModify(Member member);
	public int memberTotCnt();
	public int memberWithdrawal(String mid);
}
