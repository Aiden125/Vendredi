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
	private String qhit;
	private String qgroup;
	private Date qrdate;
	private String qsecret;
}
