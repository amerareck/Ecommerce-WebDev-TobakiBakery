package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.ProductReviewDTO;

@Mapper

public interface ProductReviewDAO {
	
	public String selectProductNameByProductId(int productId);
	public List<ProductReviewDTO> selectReviewsByMemberId(String memberId);
	 public List<ProductReviewDTO> getReviewsByProductId(int productId); 
	
}
