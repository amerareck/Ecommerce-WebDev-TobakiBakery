package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.ProductReviewDAO;
import com.mycompany.miniproject.dto.ProductReviewDTO;
@Service
public class ProductReviewService {
	@Autowired
	private ProductReviewDAO productReviewDAO;
	
	public List<ProductReviewDTO> getReviewsByMemberId(String memberId) {
        return productReviewDAO.selectReviewsByMemberId(memberId);
    }
	 public List<ProductReviewDTO> getReviewsByProductId(int productId) {
	        return productReviewDAO.getReviewsByProductId(productId);
	    }
}

