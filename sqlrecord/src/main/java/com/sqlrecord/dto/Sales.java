package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Sales {
	private int sno;
 	private String  content;			
    private int amount;	
    private int tot;				 
    private String id;		
    private String paymethod;	
    private int paynum;	
    private String addr;	
    private String tel; 		
    private String delcom;	
    private String deltel; 	 
    private String delno; 	
    private String delstatus; 
    private String st;			
}
