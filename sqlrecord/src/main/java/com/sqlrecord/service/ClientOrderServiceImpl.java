package com.sqlrecord.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqlrecord.dao.ClientOrderDAO;
import com.sqlrecord.dto.OrderOne;

@Service
public class ClientOrderServiceImpl implements ClientOrderService {

	@Autowired
	private ClientOrderDAO clientOrderDAO;
	
	@Override
	public int getOrderCount() {
		return clientOrderDAO.getOrderCount();
	}

	@Override
	public List<OrderOne> getOrders() {
		return clientOrderDAO.getOrders();
	}

	@Override
	public OrderOne getOrder(int ono) {
		return clientOrderDAO.getOrder(ono);
	}

	@Override
	public void insOrder(OrderOne orderOne) {
		clientOrderDAO.insOrder(orderOne);
	}

	@Override
	public void delOrder(int ono) {
		clientOrderDAO.delOrder(ono);
	}
	
}
