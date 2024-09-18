package com.mycompany.miniproject.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.miniproject.dto.CartDTO;
import com.mycompany.miniproject.service.OrderService;
import com.mycompany.miniproject.service.ProductService;

import lombok.extern.slf4j.Slf4j;
@Controller

@Slf4j
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	private ProductService productService;
	
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
	@Secured("user")
	@GetMapping("/addCart")	
	
	public String addCart(int productId, Authentication authentication) {
		
		CartDTO cartDto = new CartDTO();
		cartDto.setProductId(productId);
	    String memberId = authentication.getName(); 
		
		cartDto.setMemberId(memberId);
		if(orderService.checkCart(cartDto)) {
			cartDto.setCartCount(1);
			orderService.addCart(cartDto);
		}
       
		return "redirect:/order/orderCart";
		}
	@Secured("user")
	@GetMapping("/orderCart")
	public String orderCart(Authentication authentication, Model model) {
		String userId = authentication.getName();
		List<CartDTO> cartList = orderService.getCart(userId);
		model.addAttribute("cartList", cartList);
		log.info(cartList.toString());
		return "order/orderCart";
	}
	@PostMapping("/updateQty")
	@ResponseBody
	public void updateQty(@RequestParam("productId") int productId, @RequestParam("cartCount") int cartCount,
			Authentication authentication) {
		CartDTO cartDto = new CartDTO();
		cartDto.setProductId(productId);
		String memberId = authentication.getName();
		cartDto.setMemberId(memberId);
		cartDto.setCartCount(cartCount);
		orderService.updateQty(cartDto);
	}
}

	
