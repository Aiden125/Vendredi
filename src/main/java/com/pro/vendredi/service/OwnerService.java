package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.pro.vendredi.dto.Owner;
import com.pro.vendredi.dto.Reservation;
import com.pro.vendredi.dto.Store;

public interface OwnerService {
	public int owneridConfirm(String oid);
	public int owneremailConfirm(String oemail);
	public int ownerJoin(Owner owner, HttpSession session);
	public String ownerLogin(String oid, String opw, HttpSession session);
	public String ownerSearchId(Owner owner);
	public String ownerSearchPw(Owner owner);
	public Owner ownerInfo(String oid);
	public int ownerModify(Owner owner);
	public int ownerDelete(String oid);
	public List<Store> ownerStoreList(String oid);
	public Store ownerStoreDetail(int sno);
	public List<Reservation> ownerReState(String oid);
}
