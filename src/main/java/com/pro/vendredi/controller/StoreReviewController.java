package com.pro.vendredi.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
 
import com.pro.vendredi.util.Paging;
import com.pro.vendredi.dto.Store;
import com.pro.vendredi.dto.StoreReview;
import com.pro.vendredi.service.StoreReviewService;
import com.pro.vendredi.service.StoreService;

@Controller
@RequestMapping(value="storeReview")
public class StoreReviewController { 
	@Autowired
	private StoreReviewService storeReviewService;

	 
	
	// --------------------------------storeReview----------------------------------------------------
	
	
	// 가게 리뷰 목록 
	@RequestMapping(value = "storeReviewList", method = {RequestMethod.POST, RequestMethod.GET})
	public String storeReviewList(String pageNum, Model model, StoreReview storeReview , int sno ) {
		model.addAttribute("storeReviewList", storeReviewService.storeReviewList(storeReview, pageNum, sno) );
		model.addAttribute("paging", new Paging(storeReviewService.reviewCnt(sno), pageNum, 5, 3));
		return "storeReview/storeReviewList";
	}
	// 리뷰 등록 하기 -- 추후 addScore (Store Table에 리뷰 수 + 1 / 리뷰 점수 추가) 기능로 이동
	@RequestMapping(value = "writeReview", method = RequestMethod.POST)
	public String storeRegister(@ModelAttribute("storeReview") StoreReview storeReview, MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("writeReviewResult", storeReviewService.reviewWrite(storeReview, mRequest));
		return "forward:store.do?method=storeaddScore";
	}
	
	// 리뷰 등록 후 Store Table에 리뷰 수 + 1 / 리뷰 점수 추가하기 
	@RequestMapping(value = "addScore", method = RequestMethod.POST)
	public String addScore(int sno) {
		storeReviewService.addScore(sno);
		return "forward:store.do?method=storeReviewList";
	}
	
	// 리뷰 수정 보기 
	@RequestMapping(value = "reviewModifyView", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewModifyView(int srno, Model model) {
		model.addAttribute("storeReview", storeReviewService.reviewDetail(srno));
		return "store/reviewModifyView";
	}
	
	// 리뷰 수정 하기 -- 추후 storeReviewList 파일로 이동
	@RequestMapping(value = "reviewModify", method = RequestMethod.POST)
	public String reviewModify(@ModelAttribute("storeReview") StoreReview storeReview, MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("reviewModify", storeReviewService.reviewModify(storeReview, mRequest));
		return "forward:store.do?method=storeReviewList";
	}
	
	// 리뷰 삭제하기 
	@RequestMapping(value = "reviewDelete", method = RequestMethod.POST)
	public String reviewDelete(int srno) {
		storeReviewService.reviewDelete(srno);
		return "forward:store.do?method=storeReviewList";
	}
	
	
		
	
	
}
