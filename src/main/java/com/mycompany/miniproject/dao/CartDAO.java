package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.ProductDTO;

@Mapper
public interface CartDAO {

	List<ProductDTO> selectCartItemsByMemberId(String memberId);
	
	
	void deleteCartItem(@Param("productId") String productId);

	void insertCartItem(@Param("memberId") String memberId, @Param("productId") int productId, @Param("cartCount") int cartCount);
	void updateCartCount(@Param("cartCount") int cartCount, @Param("productId") int productId);
	CartDTO findCartItem(String memberId, String productId);
}
