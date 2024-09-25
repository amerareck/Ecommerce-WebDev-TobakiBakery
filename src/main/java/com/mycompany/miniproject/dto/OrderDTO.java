package com.mycompany.miniproject.dto;

import java.util.Date;
import java.util.List;

import com.mycompany.miniproject.type.DeliveryStatus;

import lombok.Data;

@Data
public class OrderDTO {
	private int orderNumber;
	private Date orderDate; 
	private String orderMemo;
	private int deliveryNum;
	private int deliveryPostNum;
	private String deliveryAddress;
	private String deliveryAddressDetail;
	private String receiverName;
	private String receiverPhoneNum;
	private String receiverEmail;
	private String deliveryMemo;
	private int deliveryPrice;
	private DeliveryStatus deliveryStatus;
	private int orderTotalPrice;
	
	private String memberId;
	private int productId;
	private int orderProductCount;
	private int orderProductPrice;
	
	private List<ProductDTO> productList;

}
