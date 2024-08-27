package com.mycompany.miniproject.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.miniproject.dto.MemberDto;

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
	@RequestMapping("/member-edit")
	public String memberEdit() {
		log.info("회원수정 실행");
		return "/member/member-edit";
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
	
	@PostMapping("/member-info")
	public void requestAjax(MemberDto memDto, HttpServletResponse response) 
		throws Exception {
		log.info(memDto.toString());
		
		
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "ok");
		String json = jsonObject.toString();
		 
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(json);
		pw.flush(); 
		pw.close();
		
	}

}
