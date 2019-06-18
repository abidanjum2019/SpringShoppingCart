package com.abid.dao;

import com.abid.model.Cart;
import com.abid.model.CartItem;

public interface CartItemDao {

	void addCartItem(CartItem cartItem);
	void removeCartItem(String CartItemId);
	void removeAllCartItems(Cart cart);

}
