package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CartDAO;
import com.mycompany.miniproject.dao.OrderDAO;
import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.OrderDTO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class OrderService {
	
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private OrderDAO orderDAO;
	
	public List<ProductDTO> getCartItemsByMemberId(CartDTO cartDto) {
		log.info("장바구니 로딩");
		return cartDAO.selectCartItemsByMemberId(cartDto);
	}
	
	public void addItemToCart(CartDTO cartDto) {
		cartDAO.insertCartItem(cartDto);
		
	} 
	public boolean checkCart(CartDTO cartDto) {
		if (cartDAO.checkCartProduct(cartDto) == 0) {
			return true;
		}
		return false;
	}

	public void updateQty(CartDTO cartDto) {
		cartDAO.updateProductQty(cartDto);
		
	}

	public void deleteItem(CartDTO cartDto) {
		cartDAO.deleteCartProduct(cartDto);
		
	}

	public int getOrderAllCount() {
		return orderDAO.selectAllCount();
	}

	public List<OrderDTO> getAllOrderList(Pager pager) {
		return orderDAO.selectAllOrderList(pager);
	}

	 
	   
}