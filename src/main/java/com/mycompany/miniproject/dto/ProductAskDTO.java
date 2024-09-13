package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class ProductAskDTO {
	private int productAskId;
	private String productAskTitle;
	private String productAskDatetime;
	private int productAskViews;
	private String productAskContent;
	private boolean lockState;
	private int productId;
	private String memberId;
	
}
