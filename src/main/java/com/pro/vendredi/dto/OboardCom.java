package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OboardCom {
	private int cno;
	private int bno;
	private String oid;
	private String ccontent;
	private Date cdate;
}
