package com.pro.vendredi.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.OwnerBoard;
import com.pro.vendredi.service.OboardService;
import com.pro.vendredi.util.Paging;

@Controller
@RequestMapping(value="oboard")
public class OboardController {
	@Autowired
	private OboardService oboardService;
	@RequestMapping(value="/dummyDataInsert", method = RequestMethod.GET)
	public String dummyData() {
		oboardService.dummyDataInsert();
		return "forward:List.do";
	}
	@RequestMapping(value="/List", method = {RequestMethod.GET, RequestMethod.POST})
	public String oboardList(String pageNum, Model model) {
		model.addAttribute("oboardList", oboardService.oboardList(pageNum));
		model.addAttribute("paging", new Paging(oboardService.oboardtotCnt(), pageNum, 10, 10));
		return "ownerBoard/oboardList";
	}
	@RequestMapping(value="/WriteForm", method = RequestMethod.GET)
	public String oboardWriteForm() {
		return "ownerBoard/oboardWrite";
	}
	@RequestMapping(value="/Write", method = RequestMethod.POST)
	public String oboardWrite(MultipartHttpServletRequest mRequest, OwnerBoard oboard, Model model) {
		model.addAttribute("writeResult", oboardService.oboardWrite(mRequest, oboard));
		return "ownerBoard/oboardList";
	}
	@RequestMapping(value="/Content", method = RequestMethod.GET)
	public String oboardContent(int bno, Model model) {
		model.addAttribute("oboard", oboardService.oboardContent(bno));
		return "ownerBoard/oboardContent";
	}
	@RequestMapping(value="/ModifyForm", method = RequestMethod.GET)
	public String oboardModifyForm(int bno, Model model) {
		model.addAttribute("oboard", oboardService.oboardContent(bno));
		return "ownerBoard/oboardModify";
	}
	@RequestMapping(value="/Modify", method = RequestMethod.POST)
	public String oboardModify(MultipartHttpServletRequest mRequest, @ModelAttribute("bDto") OwnerBoard oboard, Model model, String pageNum) {
		model.addAttribute("oboardModify", oboardService.oboardModify(mRequest, oboard));
		return "forward:List.do?pageNum="+pageNum;
	}
	@RequestMapping(value="/Delete", method = RequestMethod.GET)
	public String oboardDelete(int bno, Model model) {
		model.addAttribute("oboardDelete", oboardService.oboardDelete(bno));
		return "ownerBoard/oboardList";
	}
}
