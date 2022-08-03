package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.vendredi.dao.AdminDao;
import com.pro.vendredi.dto.Admin;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public int adminIdConfirm(String aid) {
		return adminDao.adminIdConfirm(aid);
	}

	@Override
	public int adminJoin(Admin admin) {
		return adminDao.adminJoin(admin);
	}

	@Override
	public String adminLogin(String aid, String apw, HttpSession session) {
		String result = "로그인 성공";
		Admin admin = adminDao.adminDetail(aid);
		if(admin == null) {
			result = "유효하지 않은 아이디";
		}else if(! apw.equals(admin.getApw())) {
			result = "비밀번호를 확인하세요";
		}else {
			// 로그인 성공
			session.setAttribute("admin", admin);
			session.setAttribute("aid", aid);
		}
		return result;
	}

	@Override
	public Admin adminDetail(String aid) {
		return adminDao.adminDetail(aid);
	}

	@Override
	public int adminModify(Admin admin) {
		return adminDao.adminModify(admin);
	}

	@Override
	public List<Admin> adminList() {
		return adminDao.adminList();
	}

	@Override
	public int adminDelete(String aid) {
		return adminDao.adminDelete(aid);
	}
	

}
