package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class OrderProductDTO {
	private int orderNumber;
	private int productId;
	private int orderProductCount;
	private int orderProductPrice;
}
