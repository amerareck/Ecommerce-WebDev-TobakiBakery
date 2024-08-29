package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class OrderDTO {
	private int order_num;
	private String order_date; 
	private int pay_state;
	private String order_memo;
	private int delivery_num;
	private int delivery_post_num;
	private String delivery_address;
	private String delivery_address_detail;
	private String receiver_name;
	private String receiver_phone_num;
	private String delivery_memo;
	private int delivery_price;
	private String member_id;
	
	

}
