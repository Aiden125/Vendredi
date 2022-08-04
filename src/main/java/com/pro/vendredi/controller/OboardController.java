package com.pro.vendredi.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.OboardCom;
import com.pro.vendredi.dto.OwnerBoard;
import com.pro.vendredi.service.OboardService;
import com.pro.vendredi.util.Paging;

@Controller
@RequestMapping(value="oboard")
public class OboardController {
	@Autowired
	private OboardService oboardService;
	
	// 더미데이터 넣기
	@RequestMapping(value="/dummyDataInsert", method = RequestMethod.GET)
	public String dummyData() {
		oboardService.dummyDataInsert();
		return "forward:List.do";
	}
	
	// 오너게시판 글목록
	@RequestMapping(value="/List", method = {RequestMethod.GET, RequestMethod.POST})
	public String oboardList(String pageNum, Model model) {
		model.addAttribute("oboardList", oboardService.oboardList(pageNum));
		model.addAttribute("paging", new Paging(oboardService.oboardtotCnt(), pageNum, 10, 10));
		return "ownerBoard/oboardList";
	}
	
	// 오너게시판 글작성 폼
	@RequestMapping(value="/WriteForm", method = RequestMethod.GET)
	public String oboardWriteForm() {
		return "ownerBoard/oboardWrite";
	}
	
	// 오너게시판 글작성
	@RequestMapping(value="/Write", method = RequestMethod.POST)
	public String oboardWrite(MultipartHttpServletRequest mRequest, OwnerBoard oboard, Model model) {
		model.addAttribute("writeResult", oboardService.oboardWrite(mRequest, oboard));
		System.out.println(1);
		return "forward:List.do";
	}
	
	// 오너게시판 상세보기
	@RequestMapping(value="/Content", method = {RequestMethod.GET, RequestMethod.POST})
	public String oboardContent(int bno, Model model) {
		model.addAttribute("oboard", oboardService.oboardContent(bno));
		model.addAttribute("commentList", oboardService.oboardComList(bno));
		return "ownerBoard/oboardContent";
	}
	
	// 오너게시판 글수정 폼
	@RequestMapping(value="/ModifyForm", method = RequestMethod.GET)
	public String oboardModifyForm(int bno, Model model) {
		model.addAttribute("oboard", oboardService.oboardModifyContent(bno));
		return "ownerBoard/oboardModify";
	}
	
	// 오너게시판 글수정
	@RequestMapping(value="/Modify", method = RequestMethod.POST)
	public String oboardModify(MultipartHttpServletRequest mRequest, @ModelAttribute("bDto") OwnerBoard oboard, Model model, String pageNum) {
		model.addAttribute("oboardModify", oboardService.oboardModify(mRequest, oboard));
		return "forward:List.do?pageNum="+pageNum;
	}
	
	// 오너게시판 글삭제
	@RequestMapping(value="/Delete", method = RequestMethod.GET)
	public String oboardDelete(int bno, Model model) {
		model.addAttribute("oboardDelete", oboardService.oboardDelete(bno));
		return "forward:List.do";
	}
	/*
	 * // 댓글목록
	 * 
	 * @RequestMapping(value="/ComList", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String oboardComList(int bno, Model model, String
	 * pageNum) { model.addAttribute("commentList",
	 * oboardService.oboardComList(bno)); return "forward:Content.do"; }
	 */
	
	// 댓글쓰기
	@RequestMapping(value="/ComWrite", method = RequestMethod.POST)
	public String oboardComWrite(OboardCom obCom, Model model, String pageNum) {
		model.addAttribute("commentWrite", oboardService.oboardComWrite(obCom));
		return "forward:Content.do";
	}
	
	// 댓글삭제
	@RequestMapping(value="/ComDelete", method = RequestMethod.GET)
	public String oboardComDelete(int cno, Model model, String pageNum) {
		model.addAttribute("commentDelete", oboardService.oboardComDelete(cno));
		return "forward:Content.do?pageNum="+pageNum;
	}
	
}
