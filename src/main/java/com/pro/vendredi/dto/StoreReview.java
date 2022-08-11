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
	 public String mid;
	 public String mprofile;
	 public String srcontent;
	 public String srimage1; 
     public int srscore;
     public Date srdate;
     public int startRow;
 	 public int endRow;
}
