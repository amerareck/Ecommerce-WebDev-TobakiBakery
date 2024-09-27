package com.mycompany.miniproject.controller;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@Autowired
	private JavaMailSender javaMailSender;
		
	
	@GetMapping("memberInfo")
	public String getMember() {
		log.info("실행");
		return "/member/memberInfo";
	}
	
	
	@InitBinder("loginForm")
	public void LoginFormValidator(WebDataBinder binder) {
		binder.setValidator(new LoginFormValidator());
	}
	
	/*@PostMapping("/login")
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
		
	}*/
	
	@GetMapping("/loginForm")
	public String login() {
		log.info("로그인폼 실행");
		return "/member/loginForm";
	}
	
	
	@GetMapping("/memberEdit")
	public String getMemberEdit(Model model) {
		log.info("실행");
		
		
		MemberDTO memberInfo = memberService.getMemberInfo();
		
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
		log.info(searchMemberId);
	    if(searchMemberId == null || searchMemberId.equals("")) {
	        model.addAttribute("searchMemberId", "NO");
	    } else {
	        model.addAttribute("searchMemberId", searchMemberId);
	    }
	    
	    return "/member/memberSearchForm";
	}
	
	@GetMapping("/memberPwSearchForm")
	public String getMemberPwSearch() {
		log.info("실행");

		
		return "/member/memberPwSearchForm";
	}

	@PostMapping("/memberPwSearch")
	public String memberPwSearch(MemberDTO member, Model model) throws Exception{
		log.info("실행");
		
		
		String[] elNames = {"active", "title", "breadcrumb", "searchType"};
		String[] data = {"pwSearchComplete", "비밀번호 찾기", "비밀번호 찾기", "pwSearchComplete"};
		for(int i=0; i<elNames.length; i++) {
			model.addAttribute(elNames[i], data[i]);
			
		}

		
		MemberDTO resultSearch = memberService.searchMemberForPwSearch(member);
		if(resultSearch == null || resultSearch.equals("")) {
	        model.addAttribute("resultSearch", "NO");
	    } else {
	    		
	    		MimeMessage msg = javaMailSender.createMimeMessage();
	    		MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
	    		
	    		msgHelper.setFrom("gunn0128@naver.com", "Tobaki 주인장 백");
	    		msgHelper.setSubject("[Tobaki] 임시 비밀번호를 발급해드렸습니다.");
	    		String memberEmail = memberService.searchMemberForPwSearch(member).getMemberEmail();
			log.info("memberEamil: " + memberEmail);
			String memberToken = memberService.memberTokne();
			String emailContent = "<p>안녕하세요,</p>"
                    + "<p>회원님의 임시 비밀번호는 다음과 같습니다:</p>"
                    + "<h3>" + memberToken + "</h3>"
                    + "<p>로그인 후 비밀번호를 변경해 주세요.</p>"
                    + "<p>감사합니다.</p>";
			
			
			memberService.getMemberPwSearch(member, memberToken);

			msgHelper.setText(emailContent, true);
			msgHelper.setTo(memberEmail);
			javaMailSender.send(msg);
	    		model.addAttribute("pwToken", "이메일로 발송되었습니다.");
	    }
		
		
		
		
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
	
	@PostMapping("/deleteMember")
	public void disableMember(
			MemberDTO member, 
			HttpSession session,
			HttpServletResponse response) throws Exception{
		log.info("실행");
		
		
		int deleteMember = memberService.disableMember(member);
		JSONObject jsonObject = new JSONObject();
		
		if(deleteMember > 0 ) {
			session.invalidate();
	        jsonObject.put("success", true);
	        jsonObject.put("message", "회원 탈퇴가 성공적으로 처리되었습니다.");
		}else {
	        jsonObject.put("success", false);
	        jsonObject.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		
		String json = jsonObject.toString();
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();

	}

}
