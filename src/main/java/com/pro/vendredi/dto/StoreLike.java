package com.pro.vendredi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreLike {
		private int slno;
		private String mid;
		private int sno;
		private String sname;
		private int startRow;
		private int endRow;
}
