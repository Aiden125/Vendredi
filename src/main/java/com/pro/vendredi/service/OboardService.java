package com.pro.vendredi.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.OboardCom;
import com.pro.vendredi.dto.OwnerBoard;

public interface OboardService {
	public List<OwnerBoard> oboardList(String pageNum);
	public int oboardtotCnt();
	public OwnerBoard oboardContent(int bno);
	public OwnerBoard oboardModifyContent(int bno);
	public int oboardWrite(MultipartHttpServletRequest mRequest, OwnerBoard oboard);
	public int oboardModify(MultipartHttpServletRequest mRequest, OwnerBoard oboard);
	public int oboardDelete(int bno);
	public void dummyDataInsert();
	public List<OboardCom> oboardComList(int bno);
	public OboardCom oboardComWrite(OboardCom obCom);
	public int oboardComModify(OboardCom obCom);
	public int oboardComDelete(int cno);
}
