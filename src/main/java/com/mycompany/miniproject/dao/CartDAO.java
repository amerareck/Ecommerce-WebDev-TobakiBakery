package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.ProductDTO;

@Mapper
public interface CartDAO {

	
	List<ProductDTO> selectCartItemsByMemberId(CartDTO cartDto);
	
	public int insertCartItem(CartDTO cartDto);
	
	public CartDTO checkCartProduct(CartDTO cartDto);
	public int updateProductQty(CartDTO cartDto);
	public int deleteCartProduct(CartDTO cartDto);

	public int deleteCartItem(CartDTO cartDto);
	public int countCartItem(String memberId);
}