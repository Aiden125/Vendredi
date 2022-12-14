package com.pro.vendredi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.dto.Owner;
import com.pro.vendredi.service.OwnerService;

@Controller
@RequestMapping(value="owner")
public class OwnerController {
	@Autowired
	private OwnerService ownerService;
	// 오너 회원가입폼
	@RequestMapping(value="/JoinForm", method = RequestMethod.GET)
	public String ownerJoinForm() {
		return "owner/ownerJoin";
	}
	// 오너 아이디 중복확인
	@RequestMapping(value="/idConfirm", method = RequestMethod.GET)
	public String oidConfirm(String oid, Model model) {
		model.addAttribute("confirmResult", ownerService.owneridConfirm(oid));
		return "owner/oidConfirm";
	}
	// 오너 이메일 중복확인
	@RequestMapping(value="/emailConfirm", method = RequestMethod.GET)
	public String oemailConfirm(String oemail, Model model) {
		model.addAttribute("confirmResult", ownerService.owneremailConfirm(oemail));
		return "owner/oemailConfirm";
	}
	// 오너 회원가입
	@RequestMapping(value="/Join", method = RequestMethod.POST)
	public String ownerJoin(@ModelAttribute("oDto") Owner owner, HttpSession session, Model model) {
		model.addAttribute("joinResult", ownerService.ownerJoin(owner, session));
		return "forward:LoginForm.do";
	}
	// 오너 로그인폼
	@RequestMapping(value="/LoginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String ownerLoginForm() {
		return "owner/ownerLoginForm";
	}
	// 오너 로그인
	@RequestMapping(value="/Login", method = RequestMethod.POST)
	public String ownerLogin(String oid, String opw, Model model, HttpSession session) {
		String result = ownerService.ownerLogin(oid, opw, session);
		if(result.equals("로그인 성공")) {
			return "redirect:../main.do";
		}else {
			model.addAttribute("oid", oid);
			model.addAttribute("opw", opw);
			model.addAttribute("result", result);
			return "forward:LoginForm.do";
		}
	}
	// 오너 로그아웃
	@RequestMapping(value="/Logout", method = RequestMethod.GET)
	public String ownerLogout(String oid, Model model, HttpSession session) {
		session.invalidate();
		return "forward:../main.do";
	}
	// 오너 정보
	@RequestMapping(value="/Info", method = {RequestMethod.GET, RequestMethod.POST})
	public String ownerInfo(String oid, Model model) {
		model.addAttribute("owner", ownerService.ownerInfo(oid));
		return "owner/ownerInfo";
	}
	// 오너 정보수정폼
	@RequestMapping(value="/ModifyForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String ownerModifyForm(String oid, Model model) {
		model.addAttribute("owner", ownerService.ownerInfo(oid));
		return "owner/ownerModify";
	}
	// 오너 정보수정
	@RequestMapping(value="/Modify", method = RequestMethod.POST)
	public String ownerModify(@ModelAttribute("oDto") Owner owner, Model model, HttpSession session) {
		model.addAttribute("modifyResult", ownerService.ownerModify(owner));
		session.setAttribute("owner", owner);
		return "forward:Info.do";
	}
	// 오너 회원탈퇴 폼
	@RequestMapping(value="/DeleteForm", method = RequestMethod.GET)
	public String ownerDeleteForm(String oid, Model model) {
		model.addAttribute("owner", ownerService.ownerInfo(oid));
		return "owner/ownerDelete";
	}
	// 오너 회원탈퇴
	@RequestMapping(value="/Delete", method = RequestMethod.POST)
	public String ownerDelete(String oid, Model model, HttpSession session) {
		model.addAttribute("Delete", ownerService.ownerDelete(oid));
		session.invalidate();
		return "forward:../main.do";
	}
	// 오너 ID찾기 폼
	@RequestMapping(value="/SearchIdForm", method = RequestMethod.GET)
	public String ownerSearchIdForm() {
		return "owner/ownerSearchId";
	}
	
	// 오너 ID찾기
	@RequestMapping(value="/SearchId", method = RequestMethod.GET)
	public String ownerSearchId(Owner owner, Model model) {
		model.addAttribute("searchId", ownerService.ownerSearchId(owner));
		return "owner/ownerLoginForm";
	}
	
	// 오너 PW찾기 폼
	@RequestMapping(value="/SearchPwForm", method = RequestMethod.GET)
	public String ownerSearchPwForm() {
		return "owner/ownerSearchPw";
	}
	// 오너 PW찾기
	@RequestMapping(value="/SearchPw", method = RequestMethod.GET)
	public String ownerSearchPw(Owner owner, Model model) {
		model.addAttribute("searchPw", ownerService.ownerSearchPw(owner));
		return "owner/ownerLoginForm";
	}
	// 내 가게 리스트
	@RequestMapping(value="/StoreList", method = RequestMethod.GET)
	public String ownerStoreList(String oid, Model model) {
		model.addAttribute("storeList", ownerService.ownerStoreList(oid));
		return "store/myStoreList";
	}
	// 내 가게 상세보기
	@RequestMapping(value="/StoreDetail", method = RequestMethod.GET)
	public String ownerStoreDetail(int sno, Model model) {
		model.addAttribute("storeDetail", ownerService.ownerStoreDetail(sno));
		return "store/storeDetail";
	}
	// 예약현황
	@RequestMapping(value="/ReState", method = RequestMethod.GET)
	public String ownerReState(String oid, Model model) {
		model.addAttribute("reState", ownerService.ownerReState(oid));
		return "owner/ownerReState";
	}
	
}
