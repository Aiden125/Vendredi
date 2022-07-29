package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Owner {
	private String oid;
	private String oname;
	private String opw;
	private String otel;
	private String oemail;
	private String oaddress;
	private Date obirth;
	private String ogender;
}
