package com.mycompany.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {

	@RequestMapping("/itemList-static")
	public String getProdutList() { 
		log.info("상품목록 실행");
		return "/product/itemList-static";
	}
	
	@RequestMapping("/itemDetail-static")
	public String getProductDetail() {
		log.info("상품상세 실행");
		return "/product/itemDetail-static";
	}
	
	@RequestMapping("/itemList-best")
	public String getProductBestList() {
		log.info("best상품 실행");
		return "/product/itemList-best";
	}
	
}

