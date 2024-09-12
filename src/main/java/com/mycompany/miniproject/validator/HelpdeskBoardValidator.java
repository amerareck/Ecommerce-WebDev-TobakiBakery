package com.mycompany.miniproject.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.miniproject.dto.HelpdeskForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class HelpdeskBoardValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return HelpdeskForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		HelpdeskForm form = (HelpdeskForm) target;

		String title = form.getHelpdeskTitle();
		if (title == null || title.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("helpdeskTitle", "errors.title.required", "제목은 반드시 입력하셔야 합니다.");
		}
	}
}
