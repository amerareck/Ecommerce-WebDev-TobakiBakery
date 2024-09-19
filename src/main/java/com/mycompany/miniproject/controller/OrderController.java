package com.mycompany.miniproject.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String memberId = authentication.getName(); 
		log.info("productId: " + cartDto.getProductId());
		cartDto.setMemberId(memberId);
		orderService.addItemToCart(cartDto);
		List<ProductDTO> cartItemList = orderService.getCartItemsByMemberId(cartDto);
		int totalPrice = 0;
        for (ProductDTO item : cartItemList) {
            totalPrice += item.getProductPrice() * item.getCartCount();
        }
        model.addAttribute("cartItemList", cartItemList);
        model.addAttribute("totalPrice", totalPrice);
		 
	
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
	@GetMapping("/deleteItem")
	public String deleteItem(int productId, Authentication authentication) {
		CartDTO cartDto = new CartDTO();
		cartDto.setProductId(productId);
		String memberId = authentication.getName();
		cartDto.setMemberId(memberId);
		orderService.deleteItem(cartDto);
		return "redirect:/order/basket";
	}
	
}