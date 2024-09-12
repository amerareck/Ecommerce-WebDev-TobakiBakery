package com.mycompany.miniproject.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.miniproject.dto.MemberDTO;
import com.mycompany.miniproject.service.MemberService;
import com.mycompany.miniproject.type.JoinResult;
import com.mycompany.miniproject.validator.LoginFormValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	private final Random random = new Random();
	
	@GetMapping("memberInfo")
	public String getMember() {
		log.info("실행");
		return "/member/memberInfo";
	}
	
	
	@InitBinder("loginForm")
	public void LoginFormValidator(WebDataBinder binder) {
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
	@GetMapping("/memberEdit")
	public String getMemberEdit(MemberDTO member, Model model) {
		log.info("실행");
		member.setMemberId("aaaaaa");
		MemberDTO memberInfo = memberService.getMemberInfo(member);
		
		model.addAttribute("memberInfo", memberInfo);
		
		return "/member/memberEdit";
	}
	
	@PostMapping("/edit")
	public String editMemberInfo(MemberDTO member) {
		log.info("실행");
		memberService.updateMember(member);
		
		return "redirect:/member/memberEdit";
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


    @PostMapping("/checkId")
    public void checkMemberId(@RequestParam("memberId") String memberId, 
    		HttpServletResponse response) 
    throws Exception{
    		log.info("실행");
        boolean checkId = memberService.isMemberId(memberId);
		JSONObject jsonObject = new JSONObject();
		if(!checkId) {
			jsonObject.put("resultId", "idCheckOK");
		}else {
			jsonObject.put("resultId", "false");
		}

		String json = jsonObject.toString();
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();
    }
	
	
    @PostMapping("/checkEmail")
    public void checkMemberEmail( 
    		@RequestParam("memberEmail") String memberEmail
    		, HttpServletResponse response) 
    throws Exception{
    		log.info("실행");
    		log.info("memberEmail: " + memberEmail );
        boolean checkEmail = memberService.isMemberEmail(memberEmail);
		JSONObject jsonObject = new JSONObject();
		if(!checkEmail) {
			jsonObject.put("resultEmail", "emailCheckOK");
		}else {
			jsonObject.put("resultEmail", "false");
		}
	
		String json = jsonObject.toString();
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();
    }
    
	
	@PostMapping("/join")
	public String addMember(MemberDTO member,  Model model) {
		log.info("실행");
		log.info(member.toString());
		
		JoinResult joinResult = memberService.join(member);
		if(joinResult == JoinResult.FAIL_DUPLICATED_MEMBERID) {
			log.info("회원가입 실패");
			String errorMsg = "존재하는 아이디 입니다.";
			model.addAttribute("errorMsg", errorMsg);
			return "/member/memberInfo";
		}else {
		log.info("회원가입 실행");
		
		return "redirect:/member/login";
		}
			
	}


}
