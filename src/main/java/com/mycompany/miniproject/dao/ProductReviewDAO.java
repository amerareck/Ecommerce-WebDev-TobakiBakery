package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductReviewDTO;

@Mapper

public interface ProductReviewDAO {
	
	public int insertReviewPost(ProductReviewDTO dto);
	public int selectReviewSequence();
	public int getRecentReviewId(int productId);
	public ProductReviewDTO selectReviewSingleRow(int boardNum);
	public List<ProductReviewDTO> selectReviewsByMemberId(String memberId);
	/*public String selectProductNameByProductId(int productId);
	
	 public List<ProductReviewDTO> getReviewsByProductId(int productId);
	*/
	public int updateReviewViews(int productReviewId);
	
	public int selectReviewAllCount();
	
	public List<ProductReviewDTO> selectReviewList(Pager pager);
	
	public int updateReview(ProductReviewDTO reviewDTO);
	/*
	public int deleteProductReview(int productReviewIndex);
	
	*/
}
