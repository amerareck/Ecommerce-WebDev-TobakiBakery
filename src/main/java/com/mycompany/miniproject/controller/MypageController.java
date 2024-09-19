package com.mycompany.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.miniproject.dao.ProductDAO;

import lombok.extern.slf4j.Slf4j;
@Controller

@Slf4j
@RequestMapping("/mypage")
public class MypageController {	
	
	@RequestMapping("/mypageMain")	
	public String getmypagemain() {
		log.info("실행");
			return "mypage/mypageMain";
		}
	
	@RequestMapping("/mypageOrderDelivery")	
	public String getmyorderdelivery() {
		log.info("실행");
			return "mypage/mypageOrderDelivery";
		}
	
	@RequestMapping("/mypageOrder")	
	public String getmypageorder(@RequestParam("productId") String productId, Model model) {
	     // productId를 사용하여 상품 정보를 가져옴
	     ProductDAO product = ProductDAO.getProductById(productId);
	     
	     // 상품 정보를 모델에 추가하여 JSP로 전달
	     model.addAttribute("product", product);
	     log.info("실행");
	     return "mypage/mypageOrder";
	 }
	
	@RequestMapping("/mypageReview")	
	public String getmypagereview() {
		log.info("실행");
			return "mypage/mypageReview";
		}
	
	
	}


