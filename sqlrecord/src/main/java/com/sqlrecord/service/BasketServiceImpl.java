package com.sqlrecord.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqlrecord.dao.BasketDAO;
import com.sqlrecord.dto.basket.Basket;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;
	
	@Override
	public List<Basket> getBaskets() {
		return basketDAO.getBaskets();
	}

	@Override
	public void delBasket(int bskno) {
		basketDAO.delBasket(bskno);
	}
	
}
