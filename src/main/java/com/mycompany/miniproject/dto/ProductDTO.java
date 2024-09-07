package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	String productId;
	String productName;
	int productPrice;
	Date productDateTime;
	String productDetail;
	int productState;
	int productStock;
	int productRecom;
	String category_name;
	
	String productUsecase;
	String imageOriginalName;
	String imageType;
	byte[] imageData;
	
	boolean newProduct;
	boolean bestProduct;
}
