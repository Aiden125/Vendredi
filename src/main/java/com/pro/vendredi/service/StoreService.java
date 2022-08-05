package com.pro.vendredi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.Store;

@Service
public interface StoreService {
	public int storeRegister (Store store, MultipartHttpServletRequest mRequest);
	public int storeModify (Store store, MultipartHttpServletRequest mRequest);
	public List<Store> storeList (String pageNum, Store store);
	public List<Store> storeListSearch (String pageNum, String ssearchtag, Store store);
	public Store storeDetail (int sno);
	public int storeCntSearch (String ssearchtag);
	public int storeCnt(Store store);
	public int storeCntMy(String oid);
	public Store storeScore (int sno);
	public List<Store> myStoreList(String pageNum, Store store, String oid);
}
