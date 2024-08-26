package com.mycompany.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping("/getAdminMain")
	public String adminMain() {
		log.info("실행");
		return "admin/admin-main";
	}
	
	@RequestMapping("/addProduct")
	public String addProduct() {
		log.info("실행");
		return "admin/admin-product-details";
	}
}
