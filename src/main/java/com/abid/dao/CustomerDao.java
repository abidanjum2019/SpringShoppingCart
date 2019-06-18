package com.abid.dao;

import java.util.List;

import com.abid.model.Customer;

public interface CustomerDao {

	void addCustomer(Customer customer);

	List<Customer> getAllCustomers();

	Customer getCustomerByemailId(String emailId);

}
