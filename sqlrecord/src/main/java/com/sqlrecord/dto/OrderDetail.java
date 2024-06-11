package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
	private int odno;
	private OrderOne ono;
	private int amount;
	private int total_d_price;		
	private String status;
}
