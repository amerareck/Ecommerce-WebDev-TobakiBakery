package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CartDAO;
import com.mycompany.miniproject.dao.OrderDAO;
import com.mycompany.miniproject.dto.CartDTO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDao;
	
	public List<CartDTO> getCart(String memberId) {
		List<CartDTO> cartList =orderDao.getCartProuducts(memberId);
		return cartList;
	}
	
	public void addCart(CartDTO cartDto) {
		orderDao.addProductToCart(cartDto);
		
	} 
	public boolean checkCart(CartDTO cartDto) {
		if (orderDao.checkCartProduct(cartDto) == 0) {
			return true;
		}
		return false;
	}
	public void updateQty(CartDTO cartDto) {
		orderDao.updateProductQty(cartDto);
	}

	
	 
	   
}