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
@RequestMapping(value = "owner")
public class OwnerController {
	@Autowired
	private OwnerService ownerService;
	@RequestMapping(value="JoinForm", method = RequestMethod.GET)
	public String ownerJoinForm() {
		return "owner/ownerJoin";
	}
	@RequestMapping(value="oidConfirm", method = RequestMethod.GET)
	public String oidConfirm(String oid, Model model) {
		model.addAttribute("oidConfrim", ownerService.oidConfirm(oid));
		return "owner/oidConfirm";
	}
	@RequestMapping(value="Join", method = RequestMethod.POST)
	public String ownerJoin(@ModelAttribute("oDto") Owner owner, HttpSession session, Model model) {
		model.addAttribute("joinResult", ownerService.ownerJoin(owner, session));
		return "forward:LoginForm.do";
	}
	@RequestMapping(value="LoginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String ownerLoginForm() {
		System.out.println("로그인 폼 간다");
		return "owner/ownerLogin";
	}
}
