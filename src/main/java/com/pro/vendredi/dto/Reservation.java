package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	private int rno;
	private String mid;
	private int sno;
	private Date rdate;
	private int rtime;
	private int rmember;
	private String rchk;
}
