package com.sqlrecord.dao;

import java.util.List;

import com.sqlrecord.dto.Sales;
import com.sqlrecord.dto.basket.Basket;

public interface ClientSalesDAO {
	public List<Sales> getSales();
	public Sales getSale();
	public void upSalesForRefund();
	public void upSalesForFinOfSales(int sno);
	public void delSales(int sno);
}
