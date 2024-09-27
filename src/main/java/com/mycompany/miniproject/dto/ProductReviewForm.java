package com.mycompany.miniproject.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductReviewForm {
	
	private String reviewTitle;
	private String reviewContent;
	private int reviewPoint;
	private String memberId;
	private int productId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date reviewDate;
	
	private MultipartFile[] attach;
	
}
