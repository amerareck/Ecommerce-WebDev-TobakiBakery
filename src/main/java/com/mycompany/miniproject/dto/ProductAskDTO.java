package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class ProductAskDTO {
	int productAskId;
	String productAskTitle;
	String productAskDatetime;
	int productAskViews;
	String productAskContent;
	boolean lockState;
	int productId;
	String memberId;
	
}
