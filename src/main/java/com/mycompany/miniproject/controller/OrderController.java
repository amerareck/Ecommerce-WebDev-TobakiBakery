package com.mycompany.miniproject.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.dto.ProductDTO;
import com.mycompany.miniproject.service.CartService;

import lombok.extern.slf4j.Slf4j;
@Controller

@Slf4j
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private CartService cartService;
	
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
	@RequestMapping("/orderCart")	
	public String addCart(Model model, CartDTO cartDto) {
		/*String memberId = (String)session.getAttribute("memberId");
		if(memberId == null) {
			return "redirect:/member/login";
		}*/
		
		cartDto.setMemberId("yoony");
		 cartService.addItemToCart(cartDto);
		 
	
			return "order/orderCart";
		}
}

	
