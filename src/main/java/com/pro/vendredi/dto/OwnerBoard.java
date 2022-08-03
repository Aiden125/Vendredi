package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OwnerBoard {
	private int bno;
	private String oid;
	private String sname;
	private String bloc;
	private String btitle;
	private String bcontent;
	private String bphoto1;
	private String bphoto2;
	private String bphoto3;
	private String bphoto4;
	private String bphoto5;
	private int bhit;
	private Date bdate;
	private int startRow;
	private int endRow;
}
