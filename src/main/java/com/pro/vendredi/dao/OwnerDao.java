package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Owner;
import com.pro.vendredi.dto.Reservation;
import com.pro.vendredi.dto.Store;

@Mapper
public interface OwnerDao {
	public int owneridConfirm(String oid);
	public int owneremailConfirm(String oemail);
	public int ownerJoin(Owner owner);
	public String ownerLogin(String oid, String opw);
	public Owner ownerSearchId(Owner owner);
	public Owner ownerSearchPw(Owner owner);
	public Owner ownerInfo(String oid);
	public int ownerModify(Owner owner);
	public int ownerDelete(String oid);
	public int ownerDeleteB(String oid);
	public int ownerDeleteC(String oid);
	public List<Store> ownerStoreList(String oid);
	public Store ownerStoreDetail(int sno);
	public List<Reservation> ownerReState(String oid);
}
