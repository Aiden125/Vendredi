package com.pro.vendredi.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.pro.vendredi.dto.Kakao;
import com.pro.vendredi.dto.Member;
import com.pro.vendredi.dto.Naver;
import com.pro.vendredi.service.MemberService;
import com.pro.vendredi.util.NaverLoginBO;

@Controller
@RequestMapping(value="member")
public class MemberController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HttpSession session;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
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
	public String loginForm(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);
		//개발자센터 > Application > 내 애플리케이션'의 '네아로 검수 상태' 탭에서 검수를 요청을 해야 검수가 승인되고 제약 없이 모든 아이디에서 네아로 이용 가능. 그 전엔 개발자 아이디로만 가능
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
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/logintest", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model,HttpSession httpSession,@RequestParam String code, @RequestParam String state) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(httpSession, code, state);
       
        //1. 로그인 사용자 정보를 읽어온다 
		apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String mid = (String)response_obj.get("id"); // API 호출 결과로 네이버 아이디값은 제공하지 않으며, 대신 'id'라는 애플리케이션당 유니크한 일련번호값을 이용해서 자체적으로 회원정보를 구성하셔야 합니다.
		String mname = (String)response_obj.get("name");
		String mtel = (String)response_obj.get("email");
		String memail = (String)response_obj.get("email");
		String mbirth = (String)response_obj.get("birth");
		
		model.addAttribute("member",apiResult);
		
		return "member/logintest";
	 }
//			//카카오 로그인 
//			@RequestMapping(value="/kakaoLogin", method = RequestMethod.GET)
//			public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
//				System.out.println("code:"+code);
////				String access_Token = memberService.getAccessToken(code);
////				HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token); //hash
////				System.out.println("code"+code);
////			    System.out.println("controller access_token : " + access_Token);
////			    System.out.println("login Controller : " + userInfo); //userInfo 출력 안됨 
//			    
////			    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
////			    if (userInfo.get("email") != null) {
////			        session.setAttribute("userId", userInfo.get("email"));
////			        session.setAttribute("access_Token", access_Token);
////			    }
//				return "member/testpage";
//			}
			
//			//네이버 로그인 저장
//			@RequestMapping(value="/naverSave",method = {RequestMethod.GET,RequestMethod.POST})
//			public @ResponseBody String naverSave(@RequestParam("n_id")String n_id, @RequestParam("n_name")String n_name,
//					@RequestParam("n_email")String n_email, @RequestParam("n_phone")String n_phone) {
//				System.out.println(n_id);
//				System.out.println(n_name);
//				System.out.println(n_email);
//				System.out.println(n_phone);
//				Naver naver = new Naver();
//				naver.setN_id(n_id);
//				naver.setN_name(n_name);
//				naver.setN_phone(n_phone);
//				naver.setN_email(n_email);
//				String result = memberService.naverSave(naver,session);
//				return result;
//			}
			
			//로그아웃
			@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
			public String logout(HttpSession session)throws IOException {
					System.out.println("여기는 logout");
					session.invalidate();
		 
			        
					return "redirect:../main.do";
				}
//	@RequestMapping(value="naverSave", method=RequestMethod.POST)
//	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName) {
//	System.out.println("#############################################");
//	System.out.println(n_age);
//	System.out.println(n_birthday);
//	System.out.println(n_email);
//	System.out.println(n_gender);
//	System.out.println(n_id);
//	System.out.println(n_name);
//	System.out.println(n_nickName);
//	System.out.println("#############################################");
//
//	Naver naver = new Naver();
//	naver.setN_age(n_age);
//	naver.setN_birthday(n_birthday);
//	naver.setN_email(n_email);
//	naver.setN_gender(n_gender);
//	naver.setN_id(n_id);
//	naver.setN_name(n_name);
////	naver.setN_nickName(n_nickName);
//    
//	// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
//	String result = "no";
//    
//	if(naver!=null) {
//		// naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
//		result = "ok";
//	}
//
//	return result;
//}    

//			// 카카오 로그인 토큰 받기
//			@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
//			public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
//		        System.out.println("#########" + code);
//		        String access_Token = memberService.getAccessToken(code);
//		        Kakao userInfo = memberService.getUserInfo(access_Token);
//		        session.invalidate();
//		        session.setAttribute("kakaoName", userInfo.getK_name());
//		        session.setAttribute("kakaoEmail", userInfo.getK_email());
//		        return "redirect:../main.do";
//		    }
//			
//			// 로그인 api 용 Main
//			@RequestMapping(value="Main", method=RequestMethod.GET)
//			public String Main(){
//				return "redirect:../main.do";
//			}
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
