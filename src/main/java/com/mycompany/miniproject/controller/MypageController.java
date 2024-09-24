package com.mycompany.miniproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.miniproject.dto.ProductReviewDTO;
import com.mycompany.miniproject.service.CenterService;
import com.mycompany.miniproject.service.MemberService;
import com.mycompany.miniproject.service.ProductReviewService;

import lombok.extern.slf4j.Slf4j;
@Controller

@Slf4j
@RequestMapping("/mypage")
public class MypageController {	
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CenterService centerService;
	
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
	@Autowired
    private ProductReviewService productReviewService;
	@RequestMapping("/mypageReview")	
	public String getmypagereview(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String memberId = authentication.getName();
        if(memberId.equals("yooni01")) {
;        	List<ProductReviewDTO> reviews = productReviewService.getReviewsByMemberId(memberId);
			for(ProductReviewDTO dto : reviews) {
				List<String> imageName = centerService.getBoardImageNames("productReview", dto.getProductReviewId());
				dto.setImageOriginalName(imageName.get(0));
			}
        	model.addAttribute("reviews", reviews);
        }
        return "mypage/mypageReview";
    }
	
	@GetMapping("/memberDelete")
	public String OrderList(Model model) {
		log.info("실행");
		model.addAttribute("memberDelete", "memberDelete");
		
		return "mypage/mypageMain";
	}

	}
	

