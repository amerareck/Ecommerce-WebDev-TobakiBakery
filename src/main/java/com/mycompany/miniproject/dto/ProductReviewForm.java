package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class ProductReviewForm {
	
	private String reviewTitle;
	private String reviewContent;
	private int reviewPoint;
	private String memberId;
	private int productId;
	
	private String imageOriginalName;
	private String imageType;
	private String imageData;
}
