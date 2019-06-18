package com.abid.service;

import java.util.List;

import com.abid.model.Customer;

public interface CustomerService {

	void addCustomer(Customer customer);

	List<Customer> getAllCustomers();

	Customer getCustomerByemailId(String emailId);

}
