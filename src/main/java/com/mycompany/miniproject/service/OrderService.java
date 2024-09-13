package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CartDAO;
import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class OrderService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<ProductDTO> getCartItemsByMemberId(CartDTO cartDto) {
		log.info("장바구니 로딩");
		return cartDAO.selectCartItemsByMemberId(cartDto);
	}
	
	public void addItemToCart(CartDTO cartDto) {
		cartDAO.insertCartItem(cartDto);
		
	} 
	public void deleteCartItem(int productId) {
		log.info("상품삭제 : "+productId);
	}

	 
	   
}