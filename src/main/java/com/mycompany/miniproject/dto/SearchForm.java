package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class SearchForm {
	private String type;
	private String keyword;
	private String productName;
	private int orderNumber;
	private String deliveryStatus;
	private int pageNo;
	
}
