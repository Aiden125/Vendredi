package com.pro.vendredi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.dto.QnA;
import com.pro.vendredi.service.QnAService;
import com.pro.vendredi.util.Paging;

@Controller
@RequestMapping(value="qna")
public class QnAController {
	@Autowired
	private QnAService qnaService;
	
	@RequestMapping(value= "/list" , method= {RequestMethod.GET,RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("qnaList", qnaService.qnaList(pageNum));
		model.addAttribute("paging",new Paging(qnaService.qnaTotCnt(), pageNum));
		return "qna/list";
	}
	@RequestMapping(value= "/writeView", method=RequestMethod.GET)
	public String writeView() {
		return "qna/write";
	}
	@RequestMapping(value="/write", method= RequestMethod.POST)
	public String write(QnA qna, HttpServletRequest request, Model model) {
		model.addAttribute("writeResult",qnaService.qnaWrite(qna, request));
		return "forward:list.do";
	}
	@RequestMapping(value="/detail", method= {RequestMethod.GET,RequestMethod.POST})
	public String detail(int qno, Model model) {
		model.addAttribute("qDto",qnaService.qnaDetail(qno));;
		return "qna/detail";
	}
	@RequestMapping(value = "/modfiy",method=RequestMethod.GET)
	public String modifyView(int qno, Model model) {
		model.addAttribute("qDto",qnaService.qnaModifyReplyView(qno));
		return "qna/modify";
	}
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modify(QnA qna, Model model, HttpServletRequest request) {
		model.addAttribute("modifyResult",qnaService.qnaModify(qna, request));
		return "forward:detail.do";
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int qno, Model model) {
		model.addAttribute("deleteResult",qnaService.qnaDelete(qno));
		return  "forward:list.do";
	}
	@RequestMapping(value = "/reply", method=RequestMethod.GET)
	public String replyView(int qno, Model model) {
		model.addAttribute("qDto",qnaService.qnaModifyReplyView(qno));
		return "qna/reply";
	}
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public String reply(QnA qna, HttpServletRequest request, Model model) {
		model.addAttribute("replyResult",qnaService.qnaReply(qna, request));
		return "forward:list.do";
	}
}
