package com.mycompany.miniproject.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.miniproject.dto.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		MemberDTO loginForm = (MemberDTO) target;

		String memberId = loginForm.getMemberId();
		if(memberId == null || memberId.equals("")) {
			errors.rejectValue("member_id", "errors.mid.required");
		}else if(memberId.length() < 5){
			errors.rejectValue("member_id", "errors.mid.length", new Object[] {"5"}, null);
		}
		
		String memberPw = loginForm.getMemberPassword();
		String pattern = "(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}";
		if(memberPw==null || memberPw.equals("")) {
			errors.rejectValue("member_password", "errors.mpassword.required");
		}else if(memberPw.length() < 8 || memberPw.length() > 16){
			errors.rejectValue("member_password", "errors.mpassword.length", new Object[] {8, 16}, null);			
		}else if(!Pattern.matches(pattern, memberPw)) {
			errors.rejectValue("member_password", "errors.mpassword.wrongchar");			
		}
		
	}

}
