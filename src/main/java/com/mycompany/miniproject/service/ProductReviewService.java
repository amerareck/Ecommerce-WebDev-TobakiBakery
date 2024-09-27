package com.mycompany.miniproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CenterImageDAO;
import com.mycompany.miniproject.dao.ProductReviewDAO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.dto.ProductReviewDTO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ProductReviewService {
	@Autowired
	private ProductReviewDAO productReviewDAO;
	@Autowired
	private CenterImageDAO imageDAO;
	
	public int insertReviewPost(ProductReviewDTO dto) {
		log.info("실행");
		productReviewDAO.insertReviewPost(dto);
		return productReviewDAO.getRecentReviewId(dto.getProductId());
	}
		/*dto.setProductReviewId(productReviewDAO.getRecentReviewId(dto.getProductId()));
		
		if(dto.getImageOriginalName()!=null) {
			imageDAO.insertProductReviewImage(dto);
		}*/
	
		/*Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String memberId = authentication.getName();
		reviewDTO.setMemberId(memberId);
		log.info("여기는 서비스"+memberId);
		return productReviewDAO.getRecentProductReviewId(reviewDTO.getMemberId());
	}*/
	
	public ProductReviewDTO getReviewPostByBoardNum(int boardNum) {
		return productReviewDAO.selectReviewSingleRow(boardNum);
	}
	public List<String> getBoardImageNames(int condition) {
		return imageDAO.selectBoardImageNamesFromProductReview(condition);
	}
	public ProductReviewDTO getImage(ProductReviewDTO dto) {
		return imageDAO.selectBoardImageFromProductReview(dto);
	}
	
	public void insertReviewImages(List<ProductReviewDTO> imageList) {
		log.info("실행");
		for(ProductReviewDTO dto : imageList) {
			
			imageDAO.insertProductReviewImage(dto);
		}
	}

	public List<ProductReviewDTO> getReviewsByMemberId(String memberId) {
        return productReviewDAO.selectReviewsByMemberId(memberId);
    }
	/*
	public ProductReviewDTO getProductReviewByProductId(int productId) {
		return productReviewDAO.selectProductReviewSingleRow(productId);
	}
	*/
	public void increaseReviewViews(int productId) {
		log.info("실행");
		
			productReviewDAO.updateReviewViews(productId);
		
	}
	/*
	public List<String> getProductReviewImageNames(int condition) {
		
			return centerImageDAO.selectProductReviewImageNamesFromProductReview(condition);	
	}
	public ProductReviewDTO getImage(ProductReviewDTO dto) {
		return centerImageDAO.selectBoardImageFromProductReview(dto);
	}
	*/
	public int getReviewAllCount() {
		return productReviewDAO.selectReviewAllCount();
		
	}
	
	public List<ProductReviewDTO> getReviewList(Pager pager) {
		return productReviewDAO.selectReviewList(pager);
	}
	/*public boolean deleteReviewImage(Map<String, Object> map) {
	    int res = centerImageDAO.deleteImageFromProductReview(map);  // review 테이블에서 이미지를 삭제하는 DAO 메서드
	    log.info("삭제된 레코드 수: " + res);
	    return res == 1;
	}
	*/
	public void updateReview(ProductReviewDTO reviewDTO) {
		productReviewDAO.updateReview(reviewDTO);
	}
/*
	public boolean removeProductReview(int productReviewId) {
	    // 이미지 이름을 가져옴
	    List<String> imageNames = getProductReviewImageNames(productReviewId);
	    Map<String, Object> map = new HashMap<>();
	    
	    // 이미지 삭제 로직
	    for (String imageName : imageNames) {
	        map.put("imageOriginalName", imageName);
	        map.put("productReviewId", productReviewId);
	        centerImageDAO.deleteImageFromProductReview(map);  // review 테이블에서 이미지를 삭제하는 DAO 메서드
	    }
	    
	    // 리뷰 삭제 로직
	    return productReviewDAO.deleteProductReview(productReviewId) == 1;  // 리뷰 삭제가 성공했는지 여부 반환
	}

*/
	
}

