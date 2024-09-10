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
	
	int productNew;
	int productBest;
	
    private int deliveryPrice;//배송비를 조인해서 찾아오려면 필요하다고 합니다...다른 방법이 있으면 찾아볼게요

}
