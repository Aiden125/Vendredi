package com.pro.vendredi.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.vendredi.dao.RequestDao;
import com.pro.vendredi.dto.Request;
import com.pro.vendredi.util.Paging;

@Repository
public class RequestServiceImpl implements RequestService {

	@Autowired
	public RequestDao requestDao;
	
	@Override
	public int writeRequest(Request request) {
		System.out.println("가게 요청 등록 완료");
		return requestDao.writeRequest(request);
	}

	@Override
	public List<Request> requestList(Request request, String pageNum) {
		Paging paging = new Paging(requestDao.requestCnt(request), pageNum, 10, 5);
		request.setStartRow(paging.getStartRow());
		request.setEndRow(paging.getEndRow());
		return requestDao.requestList(request);
	}

	@Override
	public List<Request> myRequestList(Request request, @Param("oid") String oid) {
		 System.out.println("사업자 개인 요청 리스트");
		return requestDao.myRequestList(request, oid);
	}

	@Override
	public int requestDoneReq(int sno) { 
		return requestDao.requestDoneReq(sno);
	}

	@Override
	public int requestDoneSto(int sno) {
		return requestDao.requestDoneSto(sno);
	}

	@Override
	public int requestCnt(Request request) { 
		return requestDao.requestCnt(request);
	}

}
