package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.OrderDTO;

@Mapper

public interface OrderDAO {
	public List<OrderDTO> getOrderDetailByOrder(String memberId);

	public OrderDTO getOrderInfo(int orderNum);
	
	public int addProductToCart(CartDTO cartDto);

	public List<CartDTO> getCartProuducts(String memberId);

	public int checkCartProduct(CartDTO cartDto);

	public int updateProductQty(CartDTO cartDto);
	
}
