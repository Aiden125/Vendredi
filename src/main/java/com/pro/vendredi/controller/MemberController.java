package com.pro.vendredi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.dto.Member;
import com.pro.vendredi.service.MemberService;

@Controller
@RequestMapping(value = "member")
public class MemberController {
	@Autowired
	private MemberService memberService;

	// 회원 가입
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute("mDto") Member member, HttpSession httpSession, Model model) {
		model.addAttribute("joinResult", memberService.memberJoin(member, httpSession));
		return "forward:member.do?method=loginForm";
	}

	// 로그인
	@RequestMapping(value = "loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String mid, String mpw, Model model, HttpSession httpSession) {
		String result = memberService.memberLogin(mid, mpw, httpSession);
		if (result.equals("로그인 성공")) {
			return "redirect:main.do";
		} else {
			model.addAttribute("mid", mid);
			model.addAttribute("mpw", mpw);
			model.addAttribute("result", result);
			return "forward:member.do?method=loginForm";
		}
	}

	// 회원 수정
	@RequestMapping(value = "modifyForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyForm() {
		return "member/modifyForm";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("mDto") Member member, Model model, HttpSession httpSession) {
		model.addAttribute("modifyResult", memberService.memberModify(member));
		httpSession.setAttribute("member", member);
		return "forward:main.do";
	}
	//회원 탈퇴 
	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String withdrawal(String mid, Model model) {
		model.addAttribute("withdrawalResult",memberService.memberWithdrawal(mid));
		return "foward:main.do";
	}
	//아이디 중복 확인
	@RequestMapping(value = "idConfirm", method = RequestMethod.GET)
	public String idConfirm(String mid, Model model) {
		model.addAttribute("idConfirmResult", memberService.memberIdConfirm(mid));
		return "member/idConfirm";
	}
	//이메일 중복 확인
	@RequestMapping(value= "emailConfirm", method=RequestMethod.GET)
	public String emailConfirm(String memail, Model model) {
		model.addAttribute("emailConfirmResult", memberService.memberEmailConfirm(memail));
		return "member/emailConfirm";
	}
	//아이디 찾기
	@RequestMapping(value = "searchId", method=RequestMethod.GET)
	public String searchId(String mname, String memail, Model model) {
		model.addAttribute("searchIdResult", memberService.memberSearchId(mname, memail));
		return "member/loginForm";
	}
	//비밀번호 찾기
	@RequestMapping(value = "searchPw" , method=RequestMethod.GET)
	public String searchPw(String mid, String mname, Model model) {
		model.addAttribute("searchPwResult", memberService.memberSearchPw(mid, mname));
		return "member/loginForm";
	}
	
	//로그아웃
	@RequestMapping(params="method=logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}
}
