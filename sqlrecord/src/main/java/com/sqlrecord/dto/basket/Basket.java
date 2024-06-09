package com.sqlrecord.dto.basket;

import java.lang.reflect.Member;

import com.sqlrecord.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 장바구니는 해당 유저만 보기 때문에 유저의 정보는 필요가 없다.
// 제품의 pno를 갖고 있어야 해당 제품의 pno와 join 가능.
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Basket {
	private int bskno;
	private String id;
	private int amount;
	private Product product;
}
