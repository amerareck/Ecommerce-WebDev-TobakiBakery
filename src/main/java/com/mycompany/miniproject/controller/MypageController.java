package com.mycompany.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Controller

@Slf4j
@RequestMapping("/mypage")
public class MypageController {	
	
	@RequestMapping("/mypage-main")	
	public String getmypagemain() {
		log.info("실행");
			return "mypage/mypage-main";
		}
	
	@RequestMapping("/mypage-order-delivery")	
	public String getmyorderdelivery() {
		log.info("실행");
			return "mypage/mypage-order-delivery";
		}
	
	@RequestMapping("/mypage-order")	
	public String getmypageorder() {
		log.info("실행");
			return "mypage/mypage-order";
		}
	
	@RequestMapping("/mypage-review")	
	public String getmypagereview() {
		log.info("실행");
			return "mypage/mypage-review";
		}
	
	
	}


