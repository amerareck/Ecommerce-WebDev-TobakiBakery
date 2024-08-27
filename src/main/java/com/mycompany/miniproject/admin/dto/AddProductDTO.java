package com.mycompany.miniproject.admin.dto;

import lombok.Data;

@Data
public class AddProductDTO {
	String productName;
	int productPrice;
	String productDateTime;
	String productDetail;
	String productState;
	int productCount;
	String productRecom;
	String categoryName;
}
