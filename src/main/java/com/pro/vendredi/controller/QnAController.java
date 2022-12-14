package com.pro.vendredi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
		model.addAttribute("qnaList", qnaService.qnaQuestionList(pageNum));
		model.addAttribute("paging",new Paging(qnaService.qnaQuestionTotCnt(), pageNum));
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
		System.out.println("저장할 글 : "+qna);
		model.addAttribute("writeResult",qnaService.qnaWrite(qna));
		return "forward:list.do";
	}
	//문의글 상세보기
	@RequestMapping(value="/detail", method= {RequestMethod.GET,RequestMethod.POST})
	public String detail(int qno, int qgroup, Model model) {
		model.addAttribute("qDto",qnaService.qnaDetail(qno));
		model.addAttribute("replyDto", qnaService.qnaReplyDetail(qgroup));
		return "qna/detail";
	}
	//문의글 수정 뷰단(조회수 안올리는 용도)
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
	
	//문의글 삭제 처리 - 사용자
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int qno, Model model) {
		model.addAttribute("deleteResult",qnaService.qnaDelete(qno));
		return  "forward:list.do";
	}

	/*
	 * //문의글 수정 후 상세보기가면 조회수는 그대로
	 * 
	 * @RequestMapping(value="/modify",method=RequestMethod.POST) public String
	 * modifyAfter(int qno, Model model, HttpServletRequest request) {
	 * model.addAttribute("modifyResult",qnaService.qnaModifyReplyView(qno)); return
	 * "forward:detail.do"; }
	 */
	
	//문의글 리스트 - 관리자
	@RequestMapping(value= "/listAdminVer" , method= {RequestMethod.GET,RequestMethod.POST})
	public String listAdminVer(String pageNum, Model model) {
		model.addAttribute("qnaList", qnaService.qnaQuestionList(pageNum));
		model.addAttribute("paging",new Paging(qnaService.qnaQuestionTotCnt(), pageNum));
		return "admin/qnaList";
	}
	
	//문의글 상세보기 - 관리자
	@RequestMapping(value="/detailAdminVer", method= {RequestMethod.GET,RequestMethod.POST})
	public String detailAdminVer(int qno, int qgroup, Model model) {
		model.addAttribute("qDto",qnaService.qnaDetail(qno));
		model.addAttribute("replyDto", qnaService.qnaReplyDetail(qgroup));
		return "admin/qnaDetail";
	}
	
	//문의글 삭제 처리 - 관리자
	@RequestMapping(value="/deleteAdminVer", method=RequestMethod.GET)
	public String deleteAdminVer(int qno, Model model) {
		model.addAttribute("deleteResult",qnaService.qnaDelete(qno));
		return  "forward:listAdminVer.do";
	}
	
	//문의글 답변 뷰 - 관리자
	@RequestMapping(value = "/replyView", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyView(int qno, Model model) {
		model.addAttribute("qDto",qnaService.qnaModifyReplyView(qno));
		return "admin/qnaReply";
	}
	
	//문의글 답변 처리 - 관리자
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public String reply(QnA qna, HttpServletRequest request, Model model) {
		model.addAttribute("replyResult",qnaService.qnaReply(qna, request));
		return "forward:replyYetList.do";
	}
	
	//문의글 수정 뷰단 - 관리자
	@RequestMapping(value = "/modifyViewAdminVer",method=RequestMethod.GET)
	public String modifyViewAdminVer(int qno, Model model) {
		System.out.println(qnaService.qnaModifyReplyView(qno));
		model.addAttribute("qDto",qnaService.qnaModifyReplyView(qno));
		return "admin/qnaModify";
	}
	
	//문의글 수정 처리 - 관리자
	@RequestMapping(value="/modifyAdminVer",method=RequestMethod.POST)
	public String modifyAdminVer(QnA qna, Model model) {
		model.addAttribute("modifyResult",qnaService.qnaModify(qna));
		return "forward:listAdminVer.do";
	}
	
	//답변안된 질문글 리스트 - 관리자
	@RequestMapping(value= "/replyYetList" , method= {RequestMethod.GET,RequestMethod.POST})
	public String replyYetList(String pageNum, Model model) {
		model.addAttribute("qnaList", qnaService.qnaReplyYetList(pageNum));
		model.addAttribute("paging",new Paging(qnaService.qnaReplyYetTotCnt(), pageNum));
		return "admin/qnaReplyYetList";
	}
	
	//답변글 관리 - 관리자
	@RequestMapping(value= "/replyList" , method= {RequestMethod.GET,RequestMethod.POST})
	public String replyList(String pageNum, Model model) {
		model.addAttribute("qnaList", qnaService.qnaReplyList(pageNum));
		model.addAttribute("paging",new Paging(qnaService.qnaReplyTotCnt(), pageNum));
		return "admin/qnaReplyList";
	}
	
	//답변글 상세보기(원글이랑 같이 볼 때 용도)
	@RequestMapping(value= "replyDetail", method=RequestMethod.GET)
	public String replyDetail(int qgroup, Model model) {
		model.addAttribute("qDto", qnaService.qnaReplyDetail(qgroup));
		return "admin/qnaModify";
	}
	
	//답변글만 상세보기
	@RequestMapping(value= "qnaOnlyReplyDetail", method=RequestMethod.GET)
	public String qnaOnlyReplyDetail(int qno, Model model) {
		model.addAttribute("qDto", qnaService.qnaOnlyReplyDetail(qno));
		return "admin/qnaModify";
	}
}
