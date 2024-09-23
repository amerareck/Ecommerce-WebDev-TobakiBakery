package com.mycompany.miniproject.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductForm {
	private int productId;
	private String productName;
	private String productDetail;
	private String categoryName;
	private int productPrice;
	private int productCount;
	private String productState;
	private boolean productRecom;
	
	private MultipartFile productDetailImagefile;
	private MultipartFile[] productThumbnailImagefile;
	
	private int pageNo;
	
}
