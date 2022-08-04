package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.StoreReview;
@Mapper
public interface StoreReviewDao {
	public int reviewWrite (StoreReview storeReview);
	public int addScore (int sno);
	public List<StoreReview> storeReviewList (StoreReview storeReview);
	public int reviewModify (StoreReview storeReview);
	public int reviewDelete (int srno);
	public int reviewCnt (int sno);
}
