package com.mycompany.miniproject.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.miniproject.dao.CartDAO;
import com.mycompany.miniproject.dto.ProductDTO;

@Service
public class CartService {
	
	private static final Logger logger = LoggerFactory.getLogger(CartService.class);
	@Autowired
	private CartDAO cartDAO;
	
	public List<ProductDTO> getCartItemsByMemberId(String memberId) {
		return cartDAO.selectCartItemsByMemberId(memberId);
	}
	@Repository
	public class CartRepository {

	    // 장바구니 상품 삭제 쿼리
	    public void deleteCartItem(String productId) {
	        cartDAO.deleteCartItem(productId);
	    }
	} 

	 @Autowired
	    private CartRepository cartRepository;

	   

	    // 장바구니 상품 삭제
	    public boolean deleteCartItem(String productId) {
	        try {
	            cartRepository.deleteCartItem(productId);
	            return true;
	        } catch (Exception e) {
	            return false;
	        }
	    }
	   

		
		}
	   
