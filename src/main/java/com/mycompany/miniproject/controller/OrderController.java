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
import org.springframework.web.bind.annotation.RequestBody;
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
        	cartDto.setProductId(item.getProductId());
        	item.setProductPrice(orderService.getSingleProductTotalPrice(cartDto));
            totalPrice += item.getProductPrice();
        }
        model.addAttribute("cartItemList", cartItemList);
        model.addAttribute("totalPrice", totalPrice);
		 
		return "order/orderCart";
	}
	
	
	@PostMapping("/updateQty")
	public void updateQty(CartDTO dto, Authentication authentication, HttpServletResponse res) throws IOException {
		log.info("실행");
		
		JSONObject json = new JSONObject();
		String memberId = authentication.getName();
		dto.setMemberId(memberId);
		log.info(dto.toString());
		
		if(orderService.updateCartCount(dto)) {
			int productPrice = orderService.getSingleProductTotalPrice(dto);
			List<ProductDTO> cartItemList = orderService.getCartItemsByMemberId(dto);
			int totalPrice = 0;
	        for (ProductDTO item : cartItemList) {
	            totalPrice += item.getProductPrice() * item.getCartCount();
	        }
	        
			json.put("status", "ok");
			json.put("productPrice", productPrice);
			json.put("totalPrice", totalPrice);
		} else {
			json.put("status", "fail");
		}
		
		res.setContentType("applcation/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
		
	}
	
	@PostMapping("/deleteCartItem")
	public String removeItem(
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
	
	@PostMapping("/deleteCartItems")
	public void removeItems(
			@RequestBody List<CartDTO> list, 
			//@AuthenticationPrincipal UserDetails user,
			HttpServletResponse res) throws IOException {
		log.info("실행");
		JSONObject json = new JSONObject();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		String member = authentication.getName();
		if (member != null) {
			for(CartDTO dto : list) {
				dto.setMemberId(member);
			}
			orderService.removeCartItems(list);
			json.put("status", "ok");
		} else {
			json.put("status", "not-found-user");
		}
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json.toString());
		pw.flush();
		pw.close();
	}
	
}