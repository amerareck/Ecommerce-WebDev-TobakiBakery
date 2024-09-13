package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class CartDTO {
	String memberId;
	int productId;
	int cartCount;
}
