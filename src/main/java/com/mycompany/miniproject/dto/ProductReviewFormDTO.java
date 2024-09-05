package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class ProductReviewFormDTO {
	
	private String reviewTitle;
	private String reviewContent;
	private int reviewPoint;
	private String memberId;
	private int productId;
	
	private String imageOriginalName;
	private String imageType;
	private String imageData;
}
