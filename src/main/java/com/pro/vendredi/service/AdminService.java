package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.pro.vendredi.dto.Admin;

public interface AdminService {
	
	public int adminIdConfirm(String aid); // 아이디 중복조회
	public int adminJoin(Admin admin); // 관리자 등록
	public String adminLogin(String aid, String apw, HttpSession session); // 관리자 로그인
	public Admin adminDetail(String aid); // 관리자 정보가져오기
	public int adminModify(Admin admin); // 관리자 정보 수정
	
	public List<Admin> adminList(); // 관리자 리스트
	public int adminDelete(String aid); // 관리자 삭제
}
