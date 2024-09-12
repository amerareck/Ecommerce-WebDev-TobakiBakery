package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.ProductDTO;

@Mapper
public interface CartDAO {

	
List<ProductDTO> selectCartItemsByMemberId(CartDTO cartDto);
	
	
	void deleteCartItem(@Param("productId") String productId);

	
	CartDTO findCartItem(String memberId, String productId);


	int insertCartItem(CartDTO cartDto);

	
	
	

	 

	




}