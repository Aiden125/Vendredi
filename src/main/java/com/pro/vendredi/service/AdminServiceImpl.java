package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.vendredi.dao.AdminDao;
import com.pro.vendredi.dto.Admin;


@Service
public class AdminServiceImpl implements AdminService {
	// Dao Autowired
	@Autowired
	private AdminDao adminDao;
	
	// ID 중복확인
	@Override
	public int adminIdConfirm(String aid) {
		return adminDao.adminIdConfirm(aid);
	}
	
	// 관리자 등록
	@Override
	public int adminJoin(Admin admin) {
		return adminDao.adminJoin(admin);
	}
	
	// 관리자 로그인
	@Override
	public String adminLogin(String aid, String apw, HttpSession session) {
		String result = "로그인 성공";
		Admin admin = adminDao.adminDetail(aid);
		if(admin == null) {
			result = "아이디를 확인하세요";
		}else if(! apw.equals(admin.getApw())) {
			result = "비밀번호를 확인하세요";
		}else {
			// 로그인 성공
			session.setAttribute("admin", admin);
			session.setAttribute("aid", aid);
		}
		return result;
	}
	
	// 관리자 상세정보
	@Override
	public Admin adminDetail(String aid) {
		return adminDao.adminDetail(aid);
	}
	
	// 관리자 정보수정
	@Override
	public int adminModify(Admin admin) {
		return adminDao.adminModify(admin);
	}
	
	// 관리자 리스트
	@Override
	public List<Admin> adminList() {
		return adminDao.adminList();
	}

	// 관리자 삭제
	@Override
	public int adminDelete(String aid) {
		return adminDao.adminDelete(aid);
	}
	

}
