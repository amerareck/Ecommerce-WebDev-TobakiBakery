package com.mycompany.miniproject.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.miniproject.dto.NoticeForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class NoticeBoardValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return NoticeForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		NoticeForm NoticeForm = (NoticeForm) target;

		String noticeTitle = NoticeForm.getNoticeTitle();
		if (noticeTitle == null || noticeTitle.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("noticeTitle", "errors.title.required", "제목은 반드시 입력하셔야 합니다.");
		}
	}
}
