package com.abid.service;

import com.abid.model.Cart;
import com.abid.model.CartItem;

public interface CartItemService {

	void addCartItem(CartItem cartItem);
	void removeCartItem(String CartItemId);
	void removeAllCartItems(Cart cart);
}
