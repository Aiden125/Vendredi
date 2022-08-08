package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Naver {
	private String n_id;
	private String n_name;
	private String n_phone;
	private String n_email;
	private String n_profile;
	private Date n_birth;
}
