package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.OboardCom;

@Mapper
public interface OboardComDao {
	public OboardCom oboardComWrite(OboardCom obCom);
	public List<OboardCom> oboardComList(int bno);
	public int oboardComModify(OboardCom obCom);
	public int oboardComDelete(int cno);
}
