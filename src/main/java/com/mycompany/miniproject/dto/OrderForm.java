package com.mycompany.miniproject.dto;

import java.util.List;

import lombok.Data;

@Data
public class OrderForm {
	private int orderNumber;
	private int deliveryPostNum;
	private String deliveryAddress;
	private String deliveryAddressDetail;
	private String receiverName;
	private String receiverPhoneNum;
	private String orderMemo;
	private String deliveryStatus;
	
	private int orderTotalPrice;
	private List<ProductDTO> productList;
}
