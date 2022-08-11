package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	private int rno;
	private String mid;
	private String mtel;
	private int sno;
	private String sname;
	private Date rdate;
	private int rtime;
	private int rmember;
	@Override
	public String toString() {
		return "{'rdate':'" + rdate +"', 'rtime':"+rtime+"}";
	}
}
