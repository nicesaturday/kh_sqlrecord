package com.sqlrecord.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sqlrecord.dto.OrderOne;

@Repository
public class ClientOrderDAOImpl implements ClientOrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getOrderCount() {
		return sqlSession.selectOne("clientOrder.getOrderCount");
	}

	@Override
	public List<OrderOne> getOrders() {
		return sqlSession.selectList("clientOrder.getOrders");
	}

	@Override
	public OrderOne getOrder(int ono) {
		return sqlSession.selectOne("clientOrder.getOrder",ono);
	}

	@Override
	public void insOrder(OrderOne orderOne) {
		sqlSession.insert("clientOrder.insOrder", orderOne);
	}

	@Override
	public void delOrder(int ono) {
		sqlSession.delete("clientOrder.delOrder", ono);
	}
	
}
