package com.pro.vendredi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.dto.StoreLike;
import com.pro.vendredi.service.StoreLikeService;
import com.pro.vendredi.util.Paging;

@Controller
@RequestMapping(value="storeLike")
public class StoreLikeController {
	@Autowired
	private StoreLikeService storeLikeService;
	
	// 내가 찜한 가게 출력하기
	
	@RequestMapping(value = "myLikeList", method = {RequestMethod.POST, RequestMethod.GET} )
	public String myLikeList(String pageNum, Model model, StoreLike storeLike){
		System.out.println(1);
		model.addAttribute("myLikeList", storeLikeService.myLikeList(storeLike, pageNum));
		System.out.println(2);
		model.addAttribute("paging", new Paging(storeLikeService.myLikeCnt(storeLike), pageNum, 5, 1));
		return "member/myLikeList";
	}
	
	// 특정 가게 찜하기
	@RequestMapping(value = "insertLike", method = {RequestMethod.POST, RequestMethod.GET})
	public String insertLike(@ModelAttribute("storeLike") StoreLike storeLike, Model model) { 
		model.addAttribute("insertLikeResult", storeLikeService.insertLike(storeLike));
		System.out.println("storeLikeController 가게 찜하기" + storeLike);
		return "forward:../store/storeDetail.do";
	} 
	
	// 특정 가게 찜한거 취소하기
	@RequestMapping(value = "deleteLike", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteLike(@ModelAttribute("storeLike") StoreLike storeLike, Model model) {
		model.addAttribute("deleteLikeResult", storeLikeService.deleteLike(storeLike));
		System.out.println("storeLikeController 가게 삭제");
		return "forward:myLikeList.do";
	}
	
	@RequestMapping(value = "deleteLike1", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteLike1(@ModelAttribute("storeLike") StoreLike storeLike, Model model) {
		model.addAttribute("deleteLikeResult", storeLikeService.deleteLike(storeLike));
		System.out.println("storeLikeController 가게 삭제");
		return "forward:../store/storeDetail.do";
	}

}
