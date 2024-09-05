package com.mycompany.miniproject.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.miniproject.dto.MemberDTO;
import com.mycompany.miniproject.validator.LoginFormValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	private final Random random = new Random();
	
	@RequestMapping("/memberInfo")
	public String addMember() {
		log.info("회원가입 실행");
		return "/member/memberInfo";
	}
	
	@InitBinder("memberDTO")
	public void ch04LoginFormValidator(WebDataBinder binder) {
		binder.setValidator(new LoginFormValidator());
	}
	
	@PostMapping("/login")
	public String login(@Valid MemberDTO loginForm, Errors errors) {
		if(errors.hasErrors()) {
			log.info("유효성 검사 실패");
			return "/member/login";
		}
		log.info("유효성 검사 성공");
		
		log.info("memberId: "+ loginForm.getMemberId());
		log.info("memberPW: " + loginForm.getMemberPassword());
		return "redirect:/";
	}
	
	@RequestMapping("/login")
	public String login() {
		log.info("로그인 실행");
		return "/member/login";
	}
	@RequestMapping("/memberEdit")
	public String memberEdit() {
		log.info("회원수정 실행");
		return "/member/memberEdit";
	}
	
	@RequestMapping("/memberSearch")
	public String getMemberSearch(String search, Model model) {
		log.info("실행");
		   if("id".equals(search)) {
		        model.addAttribute("search", "id");
		    } else if("pw".equals(search)) {
		        model.addAttribute("search", "pw");
		    }
		   return "/member/memberSearchForm";
		    
	}
	
	@GetMapping("/memberIdSearch")
	public String getMemberIdSearch() {
		log.info("실행");
		return "/member/memberIdSearch";
	}
	@GetMapping("/memberPwSearch")
	public String getMemberPwSearch() {
		log.info("실행");
		return "/member/memberPwSearch";
	}
	@GetMapping("/memberIdSearchComplete")
	public String getMemberSearchIdComplete() {
		log.info("실행");
		return "/member/memberIdSearchComplete";
	}
	@GetMapping("/memberPwSearchComplete")
	public String getMemberSearchPwComplete(Model model) {
		log.info("실행");
		int randomNum = random.nextInt(100000);
		
		String pwTokenNum = Integer.toString(randomNum);
		
	    StringBuilder pwTokenStr = new StringBuilder();
	        for (int i = 0; i < 2; i++) {
	            int randomAlpha = random.nextInt(52); 
	            char pwAlaph;
	            if (randomAlpha < 26) {
	            	pwAlaph = (char) ('A' + randomAlpha); 
	            } else {
	            	pwAlaph = (char) ('a' + (randomAlpha - 26)); 
	            }
	            pwTokenStr.append(pwAlaph);
	        }
	    
	    String token = pwTokenNum + pwTokenStr;
	    
	    List<Character> TokenList = new ArrayList<>();
	    for (char c : token.toCharArray()) {
	    	TokenList.add(c);
	    }
	    
	    Collections.shuffle(TokenList);
	    
	    StringBuilder shuffleToken = new StringBuilder();
	    for (char c : TokenList) {
	    	shuffleToken.append(c);
	    }
	    
	    String pwToken = shuffleToken.toString();
	    
		model.addAttribute("pwToken", pwToken);
		log.info("pwToken: " + pwToken);
		return "/member/memberPwSearchComplete";
	}

	@PostMapping("/member-info")
	public void requestAjax(MemberDTO memDto, HttpServletResponse response) 
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
