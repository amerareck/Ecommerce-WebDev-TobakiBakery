package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private String productId;
	private String productName;
	private int productPrice;
	private Date productDateTime;
	private String productDetail;
	private int productState;
	private int productStock;
	private int productRecom;
	private String category_name;
	
	private String productUsecase;
	private String imageOriginalName;
	private String imageType;
	private byte[] imageData;
	
	private int productNew;
	private int productBest;
	

}
