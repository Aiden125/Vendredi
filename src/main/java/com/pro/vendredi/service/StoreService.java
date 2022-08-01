package com.pro.vendredi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dto.Store;

@Service
public interface StoreService {
	public int storeRegister (Store store, MultipartHttpServletRequest mRequest);
	public int storeModify (Store store, MultipartHttpServletRequest mRequest);
	public List<Store> storeList ();
	public List<Store> storeListSearch (String pageNum, String ssearchtag, Store store);
	public Store storeDetail (int sno);
	public int storeCntSearch (String ssearchtag);
	public Store storeScore (int sno);
}
