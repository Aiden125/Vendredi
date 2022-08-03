package com.pro.vendredi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.Request; 
import com.pro.vendredi.service.RequestService;
import com.pro.vendredi.util.Paging;

@Controller
@RequestMapping(value="request")
public class RequestController {
	
	@Autowired
	public RequestService requestService;
	
	// 요청 등록 하기 -- 추후 storeRegisterView 기능로 이동
	@RequestMapping(value = "writeRequest", method = RequestMethod.POST)
	public String writeRequest(@ModelAttribute("request") Request request, MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("writeRequestResult", requestService.writeRequest(request)); 
		return "forward:store.do?method=storeRegisterView";
	}
	
	// 요청 목록 - 관리자용 (전체 목록) 
	@RequestMapping(value = "requestList", method = {RequestMethod.POST, RequestMethod.GET})
	public String requestList(String pageNum, Model model, Request request ) {
		model.addAttribute("requestList", requestService.requestList(request, pageNum));
		model.addAttribute("paging", new Paging(requestService.requestCnt(request), pageNum, 5, 3));
		return "request/requestList";
	}
	
	// 요청 목록 - 사업자용 (개인 목록) 
	@RequestMapping(value = "myRequestList", method = {RequestMethod.POST, RequestMethod.GET})
	public String myRequestList(String pageNum, Model model, Request request, String oid) {
		model.addAttribute("myRequestList", requestService.myRequestList(request, oid)); 
		return "request/myRequestList";
	}
	
	// 요청 목록에서 요청 처리하기 (request table 에서 처리 완료 문구 추가)
	@RequestMapping(value = "requestDoneReq", method = {RequestMethod.POST, RequestMethod.GET})
	public String requestDoneReq(String pageNum, Model model, Request request, int sno) {
		requestService.requestDoneReq(sno);
		return "forward:request.do?method=requestDoneSto";
	}
	
	// 요청 목록에서 요청 처리하기 (store table 에서 처리 완료 sConfirm = 'Y')
	@RequestMapping(value = "requestDoneSto", method = {RequestMethod.POST, RequestMethod.GET})
	public String requestDoneSto(String pageNum, Model model, Request request, int sno) {
		requestService.requestDoneSto(sno);
		return "forward:request.do?method=requestList";
	}
	
	
}
