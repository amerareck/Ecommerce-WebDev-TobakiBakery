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
		log.info("비밀번호 찾기");
		return "/member/member-search-pw";
	}
	
	@RequestMapping("/member-search-id-complete")
	public String getMemberIdComplete() {
		log.info("아이디 찾기 완료");
		return "/member/member-search-id-complete";
	}
	
	@RequestMapping("/member-search-pw-complete")
	public String getMemberPasswordComplete() {
		log.info("비밀번호 찾기 완료");
		return "/member/member-search-pw-complete";
	}
}

