package com.pro.vendredi.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.pro.vendredi.dto.Request;

@Mapper
public interface RequestDao {
	public int writeRequest(Request request);
	public List<Request> requestList (Request request);
	public List<Request> myRequestList (Request request, String oid);
	public int requestDoneReq (int sno);
	public int requestDoneSto (int sno);
	public int requestCnt(Request request);
}
