package com.pro.vendredi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
=======
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.dto.Admin;
import com.pro.vendredi.service.AdminService;
>>>>>>> 6ff635ff5c450819ff4b2e1c10fefa0ea6e8ac07

@Controller
@RequestMapping(value="admin")
public class AdminController {
<<<<<<< HEAD

=======
	@Autowired
	private AdminService adminService;
	
	
	// 메인 화면 보기
	@RequestMapping(value="/main", method = {RequestMethod.GET, RequestMethod.POST})
	public String mainView() {
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
			return "forward:admin.do?mehtod=loginView";
		}
	}
	
	// 회원가입 화면 보기
	@RequestMapping(value="/joinView", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminJoinView() {
		return "admin/join";
	}
	
	// 회원가입 처리
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String adminJoin(@ModelAttribute("aDto") Admin admin, Model model) {
		model.addAttribute("joinResult", adminService.adminJoin(admin));
		return "admin/main";
	}
	
	
>>>>>>> 6ff635ff5c450819ff4b2e1c10fefa0ea6e8ac07
}
