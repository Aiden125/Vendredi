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
	
	//문의글 리스트
	@RequestMapping(value= "/list" , method= {RequestMethod.GET,RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("qnaList", qnaService.qnaList(pageNum));
		model.addAttribute("paging",new Paging(qnaService.qnaTotCnt(), pageNum));
		return "qna/list";
	}
	//문의글 쓰기 뷰단
	@RequestMapping(value= "/writeView", method=RequestMethod.GET)
	public String writeView() {
		return "qna/write";
	}
	//문의글 쓰기 처리
	@RequestMapping(value="/write", method= RequestMethod.POST)
	public String write(QnA qna, Model model) {
		model.addAttribute("writeResult",qnaService.qnaWrite(qna));
		return "forward:list.do";
	}
	//문의글 상세보기
	@RequestMapping(value="/detail", method= {RequestMethod.GET,RequestMethod.POST})
	public String detail(int qno,Model model) {
		model.addAttribute("qDto",qnaService.qnaDetail(qno));;
		return "qna/detail";
	}
	//문의글 수정 뷰단
	@RequestMapping(value = "/modifyView",method=RequestMethod.GET)
	public String modifyView(int qno, Model model) {
		model.addAttribute("qDto",qnaService.qnaModifyReplyView(qno));
		return "qna/modify";
	}
	//문의글 수정 처리
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modify(QnA qna, Model model) {
		model.addAttribute("modifyResult",qnaService.qnaModify(qna));
		return "forward:detail.do";
	}

	/*
	 * //문의글 수정 후 상세보기가면 조회수는 그대로
	 * 
	 * @RequestMapping(value="/modify",method=RequestMethod.POST) public String
	 * modifyAfter(int qno, Model model, HttpServletRequest request) {
	 * model.addAttribute("modifyResult",qnaService.qnaModifyReplyView(qno)); return
	 * "forward:detail.do"; }
	 */
	
	//문의글 삭제 처리 - 관리자
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int qno, Model model) {
		model.addAttribute("deleteResult",qnaService.qnaDelete(qno));
		return  "forward:list.do";
	}
	//문의글 답변 뷰 - 관리자
	@RequestMapping(value = "/reply", method=RequestMethod.GET)
	public String replyView(int qno, Model model) {
		model.addAttribute("qDto",qnaService.qnaModifyReplyView(qno));
		return "qna/reply";
	}
	//문의글 답변 처리 - 관리자
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public String reply(QnA qna, HttpServletRequest request, Model model) {
		model.addAttribute("replyResult",qnaService.qnaReply(qna, request));
		return "forward:list.do";
	}
}
