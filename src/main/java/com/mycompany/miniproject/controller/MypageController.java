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
	public String getmypageorder() {
	     log.info("실행");
	     return "mypage/mypageOrder";
	 }
	
	@RequestMapping("/mypageReview")	
	public String getmypagereview() {
		log.info("실행");
			return "mypage/mypageReview";
		}
	
	
	}


