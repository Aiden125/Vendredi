package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.OwnerBoard;
@Mapper
public interface OwnerBoardDao {
	public List<OwnerBoard> oboardList(OwnerBoard ownerBoard);
	public int totCnt();
	public int oboardHitup(int bno);
	public OwnerBoard oboardContent(int bno);
	public int oboardWrite(OwnerBoard ownerBoard);
	public int oboardModify(OwnerBoard ownerBoard);
	public int oboardDelete(int bno);
}
