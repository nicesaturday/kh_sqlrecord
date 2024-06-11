package com.sqlrecord.service;

import java.util.List;

import com.sqlrecord.dto.OrderOne;

public interface ClientOrderService {
	public int getOrderCount();
	public List<OrderOne> getOrders();
	public OrderOne getOrder(int ono);
	public void insOrder(OrderOne orderOne);
	public void delOrder(int ono);
}
