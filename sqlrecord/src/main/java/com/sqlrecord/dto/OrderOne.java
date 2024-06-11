package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderOne {
	private int ono;
	private String id;
	private String addr1;
	private String addr2;
	private String postcode;
	private int total_price;
}
