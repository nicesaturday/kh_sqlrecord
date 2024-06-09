package com.sqlrecord.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sqlrecord.dto.basket.Basket;

@Repository
public class BasketDAOImpl implements BasketDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Basket> getBaskets() {
		return sqlSession.selectList("basket.getBaskets");
	}

	@Override
	public void delBasket(int bskno) {
		sqlSession.delete("basket.delBasket",bskno);
	}
	
}
