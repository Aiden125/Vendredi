package com.pro.vendredi.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.pro.vendredi.dto.StoreLike;

@Mapper 
public interface StoreLikeDao {
	public int insertLike (StoreLike storeLike);
	public int myLikeCnt (StoreLike storeLike);
	public int likeCnt (StoreLike storeLike);
	public List<StoreLike> myLikeList (StoreLike storeLike);
	public int deleteLike (StoreLike storeLike);
	public StoreLike likeDetail (int sno);
}
