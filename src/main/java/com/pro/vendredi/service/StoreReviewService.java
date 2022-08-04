package com.pro.vendredi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.StoreReview;

@Service
public interface StoreReviewService {
	public int reviewWrite (StoreReview storeReview, MultipartHttpServletRequest mReques);
	public int addScore (int sno);
	public List<StoreReview> storeReviewList (StoreReview storeReview, String pageNum, int sno);
	public int reviewModify (StoreReview storeReview, MultipartHttpServletRequest mRequest);
	public int reviewDelete (int srno);
	public int reviewCnt (int sno);
}
