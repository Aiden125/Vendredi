package com.pro.vendredi.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreReview {
	 public int srno;
	 public int sno; 
	 public int mprofile;
	 public int mid;
	 public String srcontent;
	 public String srimage1;
	 public String srimage2;
	 public String srimage3;
	 public String srimage4;
	 public String srimage5;
     public int srscore;
     public Date srdate;
}
