package com.pro.vendredi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pro.vendredi.dto.Request;

@Service
public interface RequestService {
	public int writeRequest(Request request);
	public List<Request> requestList (Request request, String pageNum);
	public List<Request> myRequestList (Request request);
	public int requestDoneReq (int sno);
	public int requestDoneSto (int sno);
	public int requestCnt (Request request);
}
