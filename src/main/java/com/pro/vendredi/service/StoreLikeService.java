package com.pro.vendredi.service;

import java.util.List; 
import org.springframework.stereotype.Service;

import com.pro.vendredi.dto.StoreLike;

@Service
public interface StoreLikeService {
	public int insertLike (StoreLike storeLike);
	public int myLikeCnt (StoreLike storeLike);
	public int likeCnt (StoreLike storeLike);
	public List<StoreLike> myLikeList (StoreLike storeLike, String pageNum);
	public int deleteLike (StoreLike storeLike);
	public StoreLike likeDetail (int sno);
}
