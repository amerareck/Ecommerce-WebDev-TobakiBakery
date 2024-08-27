package com.mycompany.miniproject.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Controller

@Slf4j
@RequestMapping("/order")
public class OrderController {
	
	@RequestMapping("/orderDetail")	
	public String getorderDetail() {
		log.info("실행");
			return "order/order-Detail";
		}
	
	@RequestMapping("/orderCart-static")	
	public String getorderCartStatic() {
		log.info("실행");
			return "order/orderCart-static";
		}
	
	@RequestMapping("/orderPay")	
	public String getorderPay() {
		log.info("실행");
			return "order/orderPay";
		}
	
	
	
	

}
