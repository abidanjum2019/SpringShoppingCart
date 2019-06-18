package com.abid.service;

import com.abid.model.CustomerOrder;

public interface CustomerOrderService {

	void addCustomerOrder(CustomerOrder customerOrder);
	double getCustomerOrderGrandTotal(String cartId);
}
