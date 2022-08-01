package com.pro.vendredi.dao;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Owner;

@Mapper
public interface OwnerDao {
	public int oidConfirm(String oid);
	public int ownerJoin(Owner owner);
	public String ownerLogin(String oid, String opw);
	public String schOwnerId(Owner owner);
	public String schOwnerPw(Owner owner);
	public Owner getOwner(String oid);
	public int ownerModify(Owner owner);
}
