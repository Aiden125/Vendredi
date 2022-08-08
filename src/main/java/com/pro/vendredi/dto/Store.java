package com.pro.vendredi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Store {
	private int sno;         
	private String oid;          
	private String simage;       
	private String sname;        
	private String saddress;     
	private String slocation;   
	private String stel;        
	private String stype;      
	private String sprice;      
	private String stime;      
    private String sholiday;   
    private String smenu1;
    private String smenu1cost;
    private String smenu2;
    private String smenu2cost;
    private String smenu3;
    private String smenu3cost;
    private String smenu4;
    private String smenu4cost;
    private String smenu5;
    private String smenu5cost;
    private String ssearchtag;
    private String sconfirm;
    private int sstart;
    private int send;
    private int sreplycnt;
    private int sscore;
    private int slike;
    private int startRow;
    private int endRow;
    private double stscore;
    private double slati;
    private double slongti;
}
