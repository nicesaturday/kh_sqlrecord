package com.sqlrecord.dao;

import java.util.List;

import com.sqlrecord.dto.basket.Basket;

public interface BasketDAO {
	public List<Basket> getBaskets();
	public void delBasket(int bskno);
}
