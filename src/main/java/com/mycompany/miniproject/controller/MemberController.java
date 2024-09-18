package com.mycompany.miniproject.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.miniproject.dto.MemberDTO;
import com.mycompany.miniproject.service.MemberService;
import com.mycompany.miniproject.type.JoinResult;
import com.mycompany.miniproject.type.LoginResult;
import com.mycompany.miniproject.validator.LoginFormValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
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
	public String login(@Valid MemberDTO member, Errors errors, HttpSession session) {
		
		if(errors.hasErrors()) {
			log.info("유효성 검사 실패");
			return "/member/loginForm";
		}
		log.info("유효성 검사 성공");
		
		LoginResult loginResult = memberService.login(member);
		if(loginResult == LoginResult.FAIL_MEMBERID) {
			return "member/loginForm";
		}else if(loginResult == LoginResult.FAIL_MEMBERPASSWORD) {
			return "member/loginForm";
		}else if(loginResult == LoginResult.FAIL_ENABLED) {
			log.info("비활계정");
			return "redirect:/";
		}else {
			log.info("상태:  " + memberService.login(member));
			log.info("로그인 성공");
			session.setAttribute("login", member );
			log.info("세션 : "+ session.getAttribute("login").toString());			
			

			return "redirect:/";
		}
		
	}
	
	@GetMapping("/loginForm")
	public String login() {
		log.info("로그인폼 실행");
		return "/member/loginForm";
	}
	
	
	@GetMapping("/memberEdit")
	public String getMemberEdit(MemberDTO member, Model model) {
		log.info("실행");
		
		
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
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("실행");
		session.removeAttribute("login");
		return "redirect:/member/loginForm";		
	}
	
	@GetMapping("/memberSearchForm")
	public String getMemberSearch(@RequestParam(value="type", defaultValue="idSearch") String type, 
			Model model) {
		log.info("실행");
		String[] elNames = {"active", "title", "breadcrumb", "searchType"};

		   if(type!=null && type.equals("idSearch")) {
				String[] data = {"idSearch", "아이디 찾기", "아이디 찾기", "idSearch"};
				for(int i=0; i<elNames.length; i++) {
					model.addAttribute(elNames[i], data[i]);
				}
			
		    } else if(type!=null && type.equals("pwSearch")) {
				String[] data = {"pwSearch", "비밀번호 찾기", "비밀번호 찾기", "pwSearch"};
				for(int i=0; i<elNames.length; i++) {
					model.addAttribute(elNames[i], data[i]);
				}
		    }
		   return "/member/memberSearchForm";
		    
	}
	
	
	@GetMapping("/memberIdSearchForm")
	public String getMemberIdSearch() {
		log.info("실행");
		
		return "/member/memberIdSearchForm";
	}
	
	@PostMapping("/memberIdSearch")
	public String memberIdSearch(MemberDTO member, Model model) {
		log.info("실행");
		
		String searchMemberId = memberService.getMemberIdSearch(member);
		String[] elNames = {"active", "title", "breadcrumb", "searchType"};
		String[] data = {"idSearchComplete", "아이디 찾기", "아이디 찾기", "idSearchComplete"};
		for(int i=0; i<elNames.length; i++) {
			model.addAttribute(elNames[i], data[i]);
			
		}
	    model.addAttribute("searchMemberId", searchMemberId);
	    
	    return "/member/memberSearchForm";
	}
	
	@GetMapping("/memberPwSearchForm")
	public String getMemberPwSearch() {
		log.info("실행");

		
		return "/member/memberPwSearchForm";
	}

	@PostMapping("/memberPwSearch")
	public String memberPwSearch(MemberDTO member, Model model) {
		log.info("실행");
		
		
		String[] elNames = {"active", "title", "breadcrumb", "searchType"};
		String[] data = {"pwSearchComplete", "비밀번호 찾기", "비밀번호 찾기", "pwSearchComplete"};
		for(int i=0; i<elNames.length; i++) {
			model.addAttribute(elNames[i], data[i]);
			
		}
		String memberToken = memberService.memberTokne();
		memberService.getMemberPwSearch(member, memberToken);
		
		model.addAttribute("pwToken", memberToken);
		
		
		return "/member/memberSearchForm";
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
		
		PasswordEncoder passwordEncoder = 
				PasswordEncoderFactories.createDelegatingPasswordEncoder();
		member.setMemberPassword(passwordEncoder.encode(member.getMemberPassword()));
		
		JoinResult joinResult = memberService.join(member);
		if(joinResult == JoinResult.FAIL_DUPLICATED_MEMBERID) {
			log.info("회원가입 실패");
			String errorMsg = "존재하는 아이디 입니다.";
			model.addAttribute("errorMsg", errorMsg);
			return "/member/memberInfo";
		}else {
		log.info("회원가입 실행");
		
		return "redirect:/member/loginForm";
		}
			
	}
	


}
