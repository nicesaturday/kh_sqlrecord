package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderExchange {
	private int oeno;
	private OrderDetail odno;
	private int pno; 							
	private String ex_status; 		
	private String reason;
	private int amount;
}
