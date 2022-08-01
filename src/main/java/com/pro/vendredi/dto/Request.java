package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Request {
	public int rno;    
	public int sno;
	public String oid; 
	public String aid;
	public String sname;
	public Date rdate;
	public int startRow;
	public int endRow;
}
