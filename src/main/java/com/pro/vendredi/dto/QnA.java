package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QnA {
	private int qno;
	private String qid;
	private String qsubject;
	private String qcontent;
	private String qfile;
	private int qhit;
	private int qgroup;
	private int qstep;
	private Date qrdate;
	private String qsecret;
	private int startRow;
	private int endRow;
}
