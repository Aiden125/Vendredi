package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String mid;
	private String mname;
	private String mpw;
	private String mtel;
	private String memail;
	private String maddress;
	private Date mbirth;
	private String mprofile;
	private String mgender;
}
