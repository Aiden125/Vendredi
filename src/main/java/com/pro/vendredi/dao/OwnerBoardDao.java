package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.OwnerBoard;
@Mapper
public interface OwnerBoardDao {
	public List<OwnerBoard> oboardList(OwnerBoard ownerBoard);
	public int oboardtotCnt();
	public int oboardHitup(int bno);
	public OwnerBoard oboardContent(int bno);
	public int oboardWrite(OwnerBoard oboard);
	public int oboardModify(OwnerBoard oboard);
	public int oboardDelete(int bno);
	public int oboardComDelete(int bno);
}
