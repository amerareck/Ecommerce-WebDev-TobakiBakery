package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class ProductDTO {
	int productId;
	String productName;
	int productPrice;
	String productDateTime;
	String productDetail;
	String productState;
	int productCount;
	String productRecom;
	String categoryName;
}
