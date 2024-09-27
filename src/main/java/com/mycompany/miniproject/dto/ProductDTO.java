package com.mycompany.miniproject.dto;

import java.util.Date;

import com.mycompany.miniproject.type.Category;
import com.mycompany.miniproject.type.ProductState;
import com.mycompany.miniproject.type.ProductUsecase;

import lombok.Data;

@Data
public class ProductDTO {
	private int productId;
	private String productName;
	private int productPrice;
	private Date productDateTime;
	private String productDetail;
	private ProductState productState;
	private int productStock;
	private int productRecom;
	private Category categoryName;
	
	private ProductUsecase productUsecase;
	private String imageOriginalName;
	private String imageType;
	private byte[] imageData;
	
	private int productNew;
	private int productBest;
	private int cartCount;

		
	

}
