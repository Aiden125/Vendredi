package com.pro.vendredi.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.OwnerBoard;

public interface OboardService {
	public List<OwnerBoard> oboardList(String pageNum);
	public int totCnt();
	public int oboardHitup(int bno);
	public OwnerBoard oboardContent(int bno);
	public int oboardWrite(MultipartHttpServletRequest mRequest, OwnerBoard ownerBoard);
	public int oboardModify(MultipartHttpServletRequest mRequest, OwnerBoard ownerBoard);
	public int oboardDelete(int bno);
	
}
