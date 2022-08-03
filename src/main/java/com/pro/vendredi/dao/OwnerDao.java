package com.pro.vendredi.dao;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Owner;

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
}
