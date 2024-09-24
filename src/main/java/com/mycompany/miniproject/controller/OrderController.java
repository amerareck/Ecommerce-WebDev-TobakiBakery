package com.mycompany.miniproject.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@PostMapping("/addCart")
	public void addItemCart(CartDTO cartDto, HttpServletResponse res) throws IOException{
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String memberId = authentication.getName(); 
	    JSONObject json = new JSONObject();
	    if(!memberId.equals("anonymousUser")) {
	    	log.info("productId: " + cartDto.getProductId());
			cartDto.setMemberId(memberId);
			
			
			if(orderService.addItemToCart(cartDto)) {
				json.put("status", "ok");
			} else {
				json.put("status", "fail");
			}
	    } else {
	    	json.put("status", "fail");
	    }
		
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter printwriter = res.getWriter();
		printwriter.println(json.toString());
		printwriter.flush();
		printwriter.close();
	}
	
	@GetMapping("/cart")
	public String getCart(Model model) {
		CartDTO cartDto = new CartDTO();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		cartDto.setMemberId(authentication.getName());
		
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
	public void updateQty(
			@RequestParam("productId") int productId, 
			@RequestParam("cartCount") int cartCount,
			Authentication authentication) {
		
		CartDTO cartDto = new CartDTO();
		cartDto.setProductId(productId);
		String memberId = authentication.getName();
		cartDto.setMemberId(memberId);
		cartDto.setCartCount(cartCount);
		orderService.updateQty(cartDto);
		
		
	}
	
	@PostMapping("/deleteCartItem")
	public String deleteItem(
			@RequestParam(value="productId", required=true) int productId,
			Authentication authentication) {
		
		log.info("productId: "+productId);
		CartDTO cartDto = new CartDTO();
		authentication = SecurityContextHolder.getContext().getAuthentication();
		cartDto.setMemberId(authentication.getName());
		cartDto.setProductId(productId);
		
		orderService.removeCartItem(cartDto);
		
		return "redirect:/order/cart";
	}
	@GetMapping("/countCartItem")
	public String getCartItemCount(Model model, Authentication authentication) {
		String memberId = authentication.getName();
		int cartItemCount = orderService.getCartItemCount(memberId);
		model.addAttribute("cartItemCount", cartItemCount);
		return "redirect:/order/cart";
	}
}