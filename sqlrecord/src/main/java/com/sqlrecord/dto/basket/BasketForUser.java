package com.sqlrecord.dto.basket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketForUser {
	private int bskno;
	private String id;
	private int amount;
	private int pno;
	private String name;
	private int price;
	private String img1;
}
