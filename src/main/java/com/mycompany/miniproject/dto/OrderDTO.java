package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private int orderNum;
	private Date orderDate; 
	private String orderMemo;
	private int deliveryNum;
	private int deliveryPostNum;
	private String deliveryAddress;
	private String deliveryAddressDetail;
	private String receiverName;
	private String receiverPhoneNum;
	private String deliveryMemo;
	private int deliveryPrice;
	private String deliveryStatus;
	private int orderTotalPrice; 
	private String memberId;
	
	

}
