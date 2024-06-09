package com.sqlrecord.service;

import java.util.List;

import com.sqlrecord.dto.basket.Basket;

public interface BasketService {
	public List<Basket> getBaskets();
	public void delBasket(int bskno);
}
