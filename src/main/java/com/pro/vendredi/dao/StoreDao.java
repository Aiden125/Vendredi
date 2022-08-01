package com.pro.vendredi.dao;

import java.util.List; 
import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Store;
 
@Mapper
public interface StoreDao {
	public int storeRegister (Store store);
	public int storeModify (Store store);
	public List<Store> storeList (Store store);
	public List<Store> storeListSearch (Store store);
	public Store storeDetail (int sno);
	public int storeCntSearch (String ssearchtag);
	public Store storeScore (int sno);
}
