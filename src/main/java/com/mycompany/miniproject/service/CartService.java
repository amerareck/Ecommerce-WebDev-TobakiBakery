package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CartDAO;
import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<ProductDTO> getCartItemsByMemberId(CartDTO cartDto) {
		log.info("실행");
		return cartDAO.selectCartItemsByMemberId(cartDto);
	}
	@Repository
	public class CartRepository {

	    // 장바구니 상품 삭제 쿼리
	    public void deleteCartItem(String productId) {
	        cartDAO.deleteCartItem(productId);
	    }
	}
	public void addItemToCart(CartDTO cartDto) {
		cartDAO.insertCartItem(cartDto);
		
	} 

	 
	   // private CartRepository cartRepository;

	   

	    // 장바구니 상품 삭제
	   /* public boolean deleteCartItem(int productId) {
	        try {
	            cartRepository.deleteCartItem(productId);
	            return true;
	        } catch (Exception e) {
	            return false;
	        }
	    }*/
	   
}