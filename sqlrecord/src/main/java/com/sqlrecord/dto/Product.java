package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	int pno;
    String name;
    String remark1;
    String remark2;
    int price;
    String img1;
    String img2;
    String img3;
    String img4;				
    String img5;					
    String tag;
}
