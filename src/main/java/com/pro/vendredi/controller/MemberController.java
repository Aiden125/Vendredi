package com.pro.vendredi.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.Member;
import com.pro.vendredi.dto.Naver;
import com.pro.vendredi.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	// 회원 가입 화면
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}
	// 회원 가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("mDto") Member member, HttpSession httpSession, Model model) {
		model.addAttribute("joinResult", memberService.memberJoin(member, httpSession));
		return "forward:loginForm.do";
	}

	// 로그인 화면
	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		return "member/loginForm";
	}
	// 로그인 처리
	@RequestMapping(value = "/mlogin", method = RequestMethod.POST)
	public String login(String mid, String mpw, Model model, HttpSession httpSession) {
		String result = memberService.memberLogin(mid, mpw, httpSession);
		if (result.equals("로그인 성공")) {
			return "redirect:../main.do";
		} else {
			model.addAttribute("mid", mid);
			model.addAttribute("mpw", mpw);
			model.addAttribute("result", result);
			return "forward:loginForm.do";
		}
	}
	//카카오 로그인 
	@RequestMapping(value="/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
		System.out.println("code:"+code);
//		String access_Token = memberService.getAccessToken(code);
//		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token); //hash
//		System.out.println("code"+code);
//	    System.out.println("controller access_token : " + access_Token);
//	    System.out.println("login Controller : " + userInfo); //userInfo 출력 안됨 
	    
//	    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//	    if (userInfo.get("email") != null) {
//	        session.setAttribute("userId", userInfo.get("email"));
//	        session.setAttribute("access_Token", access_Token);
//	    }
		return "member/testpage";
	}
	//네이버 로그인
	@RequestMapping(value="callBack",method = RequestMethod.GET)
	public String callBack() {
		return "member/callBack";
	}
	@RequestMapping(value="naverSave", method=RequestMethod.POST)
	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName) {
	System.out.println("#############################################");
	System.out.println(n_age);
	System.out.println(n_birthday);
	System.out.println(n_email);
	System.out.println(n_gender);
	System.out.println(n_id);
	System.out.println(n_name);
	System.out.println(n_nickName);
	System.out.println("#############################################");

	Naver naver = new Naver();
	naver.setN_age(n_age);
	naver.setN_birthday(n_birthday);
	naver.setN_email(n_email);
	naver.setN_gender(n_gender);
	naver.setN_id(n_id);
	naver.setN_name(n_name);
//	naver.setN_nickName(n_nickName);
    
	// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
	String result = "no";
    
	if(naver!=null) {
		// naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
		result = "ok";
	}

	return result;
    
	}
//	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
//	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
//		System.out.println("#########" + code);
//		
//		String access_Token = memberService.getAccessToken(code);
//		System.out.println("###access_Token#### : " + access_Token);
//		return "member/testpage" ;
//	}
//	@RequestMapping(value="/kakao", method=RequestMethod.GET)
//	 public String getCI(@RequestParam String code, Model model) throws Exception {
//        System.out.println("code = " + code);
//        String access_token = memberService.getToken(code); 
//        Map<String, Object> userInfo = memberService.getUserInfo(access_token);
//        model.addAttribute("code", code);
//        model.addAttribute("access_token", access_token);
//        model.addAttribute("userInfo", userInfo);
//
//        //ci는 비즈니스 전환후 검수신청 -> 허락받아야 수집 가능
//        return "index";
//    }
	// 회원 수정 화면
	@RequestMapping(value = "/modify", method =  RequestMethod.GET)
	public String modifyView() {
		return "member/modify";
	}
	// 회원 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("mDto") Member member, Model model, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		model.addAttribute("modifyResult", memberService.memberModify(member,mRequest));
		httpSession.setAttribute("member", member);
		return "forward:../main.do";
	}
	//회원 탈퇴 
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public String withdrawal(String mid, Model model) {
		model.addAttribute("withdrawalResult",memberService.memberWithdrawal(mid));
		return "foward:../main.do";
	}
	//아이디 중복 확인
	@RequestMapping(value = "/idConfirm", method = RequestMethod.GET)
	public String idConfirm(String mid, Model model) {
		model.addAttribute("idConfirmResult", memberService.memberIdConfirm(mid));
		return "member/idConfirm";
	}
	//이메일 중복 확인
	@RequestMapping(value= "/emailConfirm", method=RequestMethod.GET)
	public String emailConfirm(String memail, Model model) {
		model.addAttribute("emailConfirmResult", memberService.memberEmailConfirm(memail));
		return "member/emailConfirm";
	}
	//아이디or비번 찾기 view
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String searchAccount() {
		return "member/search";
	}
	//아이디 찾기 
	@RequestMapping(value = "/searchId", method=RequestMethod.GET)
	public String searchId(@ModelAttribute("mDto") Member member, Model model) {
		model.addAttribute("searchIdResult", memberService.memberSearchId(member));
		return "forward:loginForm.do";
	}
	//비밀번호 찾기
	@RequestMapping(value = "/searchPw" , method=RequestMethod.GET)
	public String searchPw(@ModelAttribute("mDto") Member member, Model model) {
		model.addAttribute("searchPwResult", memberService.memberSearchPw(member));
		return "forward:loginForm.do";
	}
	
	//로그아웃
	@RequestMapping(params="method=logout")
	public String logout(String mid, HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:../main.do";
	}
	
}
