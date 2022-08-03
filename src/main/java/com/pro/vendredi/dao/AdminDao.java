package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Admin;

@Mapper
public interface AdminDao {
	
	public int adminIdConfirm(String aid); // 아이디중복조회
	public int adminJoin(Admin admin); // 관리자등록
	public Admin adminDetail(String aid); // 관리자 정보 가져오기
	public int adminModify(Admin admin); // 정보수정
	
	public List<Admin> adminList(); // 관리자 리스트
	public int adminDelete(String aid); // 관리자 삭제
}
