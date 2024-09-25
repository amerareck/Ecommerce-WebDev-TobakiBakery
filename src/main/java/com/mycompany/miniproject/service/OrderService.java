package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CartDAO;
import com.mycompany.miniproject.dao.OrderDAO;
import com.mycompany.miniproject.dao.OrderProductDAO;
import com.mycompany.miniproject.dao.ProductDAO;
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
	@Autowired
	private OrderProductDAO orderProductDAO;
	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductDTO> getCartItemsByMemberId(CartDTO cartDto) {
		log.info("장바구니 로딩");
		return cartDAO.selectCartItemsByMemberId(cartDto);
	}
	
	public boolean addItemToCart(CartDTO cartDto) {
		CartDTO dto = checkCart(cartDto);
		
		if (dto==null) {
			return cartDAO.insertCartItem(cartDto) == 1;
		} else {
			cartDto.setCountHandler(cartDto.getCartCount()+1);
			return cartDAO.updateCartCount(cartDto) == 1;
		}
		
	}
		
	public CartDTO checkCart(CartDTO cartDto) {
		return cartDAO.checkCartProduct(cartDto);
	}
	
	public boolean updateCartCount(CartDTO cartDto) {
		return cartDAO.updateCartCount(cartDto) == 1;
	}

	public void deleteItem(CartDTO cartDto) {
		try {
			cartDAO.deleteCartProduct(cartDto);
			
		}catch(Exception e) {
			throw e;
		}		
	}

	public int getOrderAllCount() {
		return orderDAO.selectAllCount();
	}

	public List<OrderDTO> getAllOrderList(Pager pager) {
		return orderDAO.selectAllOrderList(pager);
	}

	public boolean removeCartItem(CartDTO cartDto) {
		return cartDAO.deleteCartItem(cartDto) == 1;
		
	}
	public int getCartItemCount(String memberId) {
		return cartDAO.countCartItem(memberId);
	}

	public boolean removeCartItems(List<CartDTO> list) {
		for(CartDTO dto : list) {
			if(!removeCartItem(dto)) {
				return false;
			}
		}
		return true;
	}

	public int getSingleProductTotalPrice(CartDTO dto) {
		return productDAO.selectTotalPrice(dto);
	}

	public int addOrder(OrderDTO dto) {
		//트랜잭션 요망
		int result = 0;
		if(orderDAO.insertOrder(dto) == 1) {
			int orderNumber = orderDAO.selectRecentOrderNumber(dto);
			for(ProductDTO prodDTO : dto.getProductList()) {
				dto.setOrderNumber(orderNumber);
				dto.setOrderProductCount(prodDTO.getCartCount());
				dto.setOrderProductPrice(prodDTO.getProductPrice());
				dto.setProductId(prodDTO.getProductId());
				if(orderProductDAO.insertOrderProduct(dto) == 1) {
					result = orderNumber;
				}
			}
		}
		return result;
	}

	 
	   
}