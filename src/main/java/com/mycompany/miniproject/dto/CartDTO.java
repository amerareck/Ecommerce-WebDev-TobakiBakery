package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class CartDTO {
	private String memberId;
	private int productId;
	private int cartCount;
	private int countHandler;
}
