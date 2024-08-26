package com.mycompany.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {

	@RequestMapping("/member-info")
	public String addMember() {
		log.info("회원가입 실행");
		return "/member/member-info";
	}
	
	@RequestMapping("/login")
	public String login() {
		log.info("로그인 실행");
		return "/member/login";
	}
	
	@RequestMapping("/member-search-id")
	public String getMemberId() {
		log.info("아이디 찾기 실행");
		return "/member/member-search-id";
	}
	
	@RequestMapping("/member-search-pw")
	public String getMemberPassword() {
		log.info("회원가입 실행");
		return "/member/member-search-pw";
	}
	
}

