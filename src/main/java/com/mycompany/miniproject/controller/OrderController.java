package com.mycompany.miniproject.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.service.OrderService;

import lombok.extern.slf4j.Slf4j;
@Controller

@Slf4j
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/orderDetail")	
	public String getorderDetail() {
		log.info("실행");
			return "order/orderDetail";
		}
	@RequestMapping("/orderPay")	
	public String getorderPay() {
		log.info("실행");
			return "order/orderPay";
		}
	@GetMapping("/orderCart")	
	
	public String addCart(Model model, CartDTO cartDto) {
		
		log.info("productId: " + cartDto.getProductId());
		cartDto.setMemberId("yoony");
		orderService.addItemToCart(cartDto);
		List<ProductDTO> cartItemList = orderService.getCartItemsByMemberId(cartDto);
		int totalPrice = 0;
        for (ProductDTO item : cartItemList) {
            totalPrice += item.getProductPrice() * 1;
        }
        model.addAttribute("cartItemList", cartItemList);
        model.addAttribute("totalPrice", totalPrice);
		 
	
			return "order/orderCart";
		}
	
	
}

	
