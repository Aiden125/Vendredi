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
import com.pro.vendredi.service.StoreLikeService;
import com.pro.vendredi.service.StoreReviewService;
import com.pro.vendredi.service.StoreService;

@Controller
@RequestMapping(value="store")
public class StoreController {
	// 해당 컨트롤러에서는 Store table StoreReview table의 기능을 다룹니다. 
	
	@Autowired
	private StoreService storeService; 
	@Autowired
	private StoreReviewService storeReviewService; 
	@Autowired
	private StoreLikeService storeLikeService;

	// 가게 등록 화면 보기
	@RequestMapping(value="/storeRegisterView", method = {RequestMethod.GET, RequestMethod.POST}  )
	public String storeRegisterView() {
		return "store/StoreRegister";
	}
	// 가게 등록 하기 -- 추후 request의 테이블에 등록 파일로 고침
	@RequestMapping(value = "storeRegister", method = {RequestMethod.GET, RequestMethod.POST} )
	public String storeRegister(@ModelAttribute("store") Store store , MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("storeRegisterResult", storeService.storeRegister(store, mRequest));
		System.out.println("컨트롤러 화인 : "+ store);
		return "forward:myStoreList.do";
	}
	
	// 가게 수정 입력창 보기
	@RequestMapping(value = "storeModifyView", method = { RequestMethod.GET, RequestMethod.POST })
	public String storeModifyView(int sno, Model model) {
		model.addAttribute("store", storeService.storeDetail(sno));
		return "store/storeModifyView";
	}
	
	// 가게 수정 하기 -- 추후 storeDetail 페이지로 이동
	@RequestMapping(value = "storeModify", method = RequestMethod.POST)
	public String storeModify(@ModelAttribute("store") Store store , MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("storeModifyResult", storeService.storeModify(store, mRequest));
		return "forward:storeDetail.do";
	}
	
	// 가게 상세 보기
	@RequestMapping(value = "storeDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String storeDetail(int sno, Model model, String pageNum, StoreReview storeReview) {
		model.addAttribute("store", storeService.storeDetail(sno));
		model.addAttribute("storeLike", storeLikeService.likeDetail(sno));
		model.addAttribute("storeReviewList", storeReviewService.storeReviewList(storeReview, pageNum, sno) );
		model.addAttribute("paging", new Paging(storeReviewService.reviewCnt(sno), pageNum, 3, 1));
		return "store/storeDetail";
	} 
	
	// 가게 목록 보기 - 무조건 키워드 입력 ?ssearchtag='강남' 처럼 가능 input-text에 value="#{param.ssearchtag}" 개체값 입력
	@RequestMapping(value = "storeListSearch", method = {RequestMethod.POST, RequestMethod.GET})
	public String storeListSearch(String pageNum, Model model, Store store, String ssearchtag ) {
		model.addAttribute("storeList", storeService.storeListSearch(pageNum, ssearchtag, store) );
		model.addAttribute("paging", new Paging(storeService.storeCntSearch(ssearchtag), pageNum, 4, 1));
		return "store/storeListSearch";
	}
	
	// 가게 목록 보기 - 등록된 가게들 중 최신순
		@RequestMapping(value = "storeList", method = {RequestMethod.POST, RequestMethod.GET})
		public String storeList(String pageNum, Model model, Store store ) {
			model.addAttribute("storeList", storeService.storeList(pageNum, store));
			model.addAttribute("paging", new Paging(storeService.storeCnt(store), pageNum, 4, 1));
			return "store/storeList";
	}
	// 가게 목록 보기 - 등록된 가게들 중 최신순
		@RequestMapping(value = "myStoreList", method = {RequestMethod.POST, RequestMethod.GET})
		public String myStoreList(String pageNum, Model model, Store store, String oid ) {
			model.addAttribute("storeList", storeService.myStoreList(pageNum, store, oid));
			model.addAttribute("paging", new Paging(storeService.storeCntMy(oid), pageNum, 5, 1));
			return "store/myStoreList";
		}
	
	
//	// --------------------------------storeReview----------------------------------------------------
//	
//	
//	// 가게 리뷰 목록 
//	@RequestMapping(value = "storeReviewList", method = {RequestMethod.POST, RequestMethod.GET})
//	public String storeReviewList(String pageNum, Model model, StoreReview storeReview , int sno ) {
//		model.addAttribute("storeReviewList", storeReviewService.reviewList(storeReview, pageNum, sno) );
//		model.addAttribute("paging", new Paging(storeReviewService.reviewCnt(sno), pageNum, 5, 3));
//		return "store/storeReviewList";
//	}
//	// 리뷰 등록 하기 -- 추후 addScore (Store Table에 리뷰 수 + 1 / 리뷰 점수 추가) 기능로 이동
//	@RequestMapping(value = "writeReview", method = RequestMethod.POST)
//	public String storeRegister(@ModelAttribute("storeReview") StoreReview storeReview, MultipartHttpServletRequest mRequest, Model model) {
//		model.addAttribute("writeReviewResult", storeReviewService.reviewWrite(storeReview, mRequest));
//		return "forward:store.do?method=storeaddScore";
//	}
//	
//	// 리뷰 등록 후 Store Table에 리뷰 수 + 1 / 리뷰 점수 추가하기 
//	@RequestMapping(value = "addScore", method = RequestMethod.POST)
//	public String addScore(int sno) {
//		storeReviewService.addScore(sno);
//		return "forward:store.do?method=storeReviewList";
//	}
//	
//	// 리뷰 수정 보기 
//	@RequestMapping(value = "reviewModifyView", method = { RequestMethod.GET, RequestMethod.POST })
//	public String reviewModifyView() {
//		return "store/reviewModifyView";
//	}
//	
//	// 리뷰 수정 하기 -- 추후 storeReviewList 파일로 이동
//	@RequestMapping(value = "reviewModify", method = RequestMethod.POST)
//	public String reviewModify(@ModelAttribute("storeReview") StoreReview storeReview, MultipartHttpServletRequest mRequest, Model model) {
//		model.addAttribute("reviewModify", storeReviewService.reviewModify(storeReview, mRequest));
//		return "forward:store.do?method=storeReviewList";
//	}
//	
//	// 리뷰 삭제하기 
//	@RequestMapping(value = "reviewDelete", method = RequestMethod.POST)
//	public String reviewDelete(int srno) {
//		storeReviewService.reviewDelete(srno);
//		return "forward:store.do?method=storeReviewList";
//	}
//	
	
		
	
	
}
