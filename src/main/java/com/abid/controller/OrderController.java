package com.abid.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abid.model.Cart;
import com.abid.model.Customer;
import com.abid.model.CustomerOrder;
import com.abid.service.CartService;
import com.abid.service.CustomerOrderService;

@Controller
public class OrderController {

	@Autowired
	private CartService cartService;

	@Autowired
	private CustomerOrderService customerOrderService;

	@RequestMapping("/order/{cartId}")
	public String createOrder(@PathVariable("cartId") String cartId) {

		CustomerOrder customerOrder = new CustomerOrder();

		Cart cart = cartService.getCartByCartId(cartId);
		// Update CartId for customerOrder - set CartId
		customerOrder.setCart(cart);

		Customer customer = cart.getCustomer();

		customerOrder.setCustomer(customer);
		// Set customerid
		// Set ShippingAddressId
		customerOrder.setShippingAddress(customer.getShippingAddress());

		customerOrder.setBillingAddress(customer.getBillingAddress());

		customerOrderService.addCustomerOrder(customerOrder);

		return "redirect:/checkout?cartId=" + cartId;
	}
}
