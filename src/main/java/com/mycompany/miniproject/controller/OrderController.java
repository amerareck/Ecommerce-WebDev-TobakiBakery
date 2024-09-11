package com.mycompany.miniproject.controller;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/orderCart")	
	public String getorderCart(Model model, HttpSession session) {
		/*String memberId = (String)session.getAttribute("memberId");
		if(memberId == null) {
			return "redirect:/member/login";
		}*/
		String memberId = "yoony"; //테스트 위해 임시로 하드코딩
		
		 List<ProductDTO> cartItemList = cartService.getCartItemsByMemberId(memberId);
		 
		 model.addAttribute("cartItemList", cartItemList);
		 
	
			return "order/orderCart";
		}
	
	@RequestMapping("/orderPay")	
	public String getorderPay() {
		log.info("실행");
			return "order/orderPay";
		}
	
    // 상품 삭제 요청 처리
    @PostMapping("/delete")
    public ResponseEntity<Map<String, Object>> deleteCartItem(@RequestBody Map<String, Object> requestData) {
        String productId = requestData.get("productId").toString();
        boolean success = cartService.deleteCartItem(productId);

        Map<String, Object> response = new HashMap<>();
        response.put("success", success);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    
    @GetMapping("/setSession")
    public String setSession(HttpSession session) {
        // 임의로 'yoony'라는 memberId를 세션에 저장
        session.setAttribute("memberId", "yoony");
        return "redirect:/"; // 메인 페이지로 리다이렉트
    }
   
}
	
