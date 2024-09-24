package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductReviewDTO {
	private int productReviewId;
	private String reviewTitle;
	private String reviewContent;
	private int reviewPoint;
	private int reviewViews;
	private Date reviewDate;
	private String memberId;
	private int productId;
	
	private String imageOriginalName;
	private String imageType;
	private byte[] imageData;
}
