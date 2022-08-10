package com.pro.vendredi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.vendredi.dao.StoreLikeDao;
import com.pro.vendredi.dto.StoreLike;
import com.pro.vendredi.util.Paging;

	

@Repository
public class StoreLikeServiceImpl implements StoreLikeService {
	
	@Autowired
	public StoreLikeDao storeLikeDao;
	
	@Override
	public int insertLike(StoreLike storeLike) {
		return storeLikeDao.insertLike(storeLike);
	}

	@Override
	public int myLikeCnt(StoreLike storeLike) { 
		return storeLikeDao.myLikeCnt(storeLike);
	}

	@Override
	public int likeCnt(StoreLike storeLike) {
		return storeLikeDao.likeCnt(storeLike);
	}

	@Override
	public List<StoreLike> myLikeList(StoreLike storeLike, String pageNum) {
		Paging paging = new Paging(storeLikeDao.myLikeCnt(storeLike), pageNum, 5, 1);
		storeLike.setStartRow(paging.getStartRow());
		storeLike.setEndRow(paging.getEndRow());
		return storeLikeDao.myLikeList(storeLike);
	}

	@Override
	public int deleteLike(StoreLike storeLike) {
		return storeLikeDao.deleteLike(storeLike);
	}

	@Override
	public StoreLike likeDetail(int sno) { 
		return storeLikeDao.likeDetail(sno);
	}

}
