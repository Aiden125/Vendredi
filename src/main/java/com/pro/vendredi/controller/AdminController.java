package com.pro.vendredi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.dto.Admin;
import com.pro.vendredi.service.AdminService;

@Controller
@RequestMapping(value="admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 메인 화면 보기(+관리자 리스트)
	@RequestMapping(value="/main", method = {RequestMethod.GET, RequestMethod.POST})
	public String mainView(Model model) {
		model.addAttribute("adminList", adminService.adminList());
		return "admin/main";
	}
	
	// 로그인 화면 보기
	@RequestMapping(value="/loginView", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLoginView() {
		return "admin/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String adminLogin(String aid, String apw, HttpSession session, Model model) {
		String result = adminService.adminLogin(aid, apw, session);
		if(result.equals("로그인 성공")) {
			return "redirect:main.do";
		}else {
			model.addAttribute("aid", aid);
			model.addAttribute("apw", apw);
			model.addAttribute("result", result);
			return "forward:loginView.do";
		}
	}
	
	// 관리자 등록 화면 보기
	@RequestMapping(value="/joinView", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminJoinView() {
		return "admin/join";
	}
	
	// 관리자 등록 처리
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String adminJoin(@ModelAttribute("aDto") Admin admin, Model model) {
		model.addAttribute("joinResult", adminService.adminJoin(admin));
		return "forward:main.do";
	}
	
	// 관리자 정보수정 화면가기
	@RequestMapping(value="/modifyView", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminModifyView(String aid, Model model) {
		model.addAttribute("adminModify", adminService.adminDetail(aid));
		return "admin/modify";
	}
	
	// 관리자 정보수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String adminModify(@ModelAttribute("aDto") Admin admin, Model model, HttpSession session) {
		model.addAttribute("modifyResult", adminService.adminModify(admin));
		session.setAttribute("admin", admin);
		return "forward:main.do";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
}
