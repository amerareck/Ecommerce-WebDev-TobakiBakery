package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.ProductReviewDTO;

@Mapper

public interface ProductReviewDAO {
	
	String selectProductNameByProductId(int productId);
	List<ProductReviewDTO> selectReviewsByMemberId(String memberId);
	
	
}
