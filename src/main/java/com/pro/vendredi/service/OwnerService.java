package com.pro.vendredi.service;

import javax.servlet.http.HttpSession;

import com.pro.vendredi.dto.Owner;

public interface OwnerService {
	public int oidConfirm(String oid);
	public int ownerJoin(Owner owner, HttpSession session);
	public String ownerLogin(String oid, String opw, HttpSession session);
	public String schOwnerId(Owner owner);
	public String schOwnerPw(Owner owner);
	public Owner getOwner(String oid);
	public int ownerModify(Owner owner);
}
