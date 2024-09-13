package com.mycompany.miniproject.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.miniproject.dto.BoardForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return BoardForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		BoardForm boardForm = (BoardForm) target;

		String title = boardForm.getTitle();
		if (title == null || title.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("title", "errors.title.required", "제목은 반드시 입력하셔야 합니다.");
		}
		
		String boardType = boardForm.getBoardType();
		if (boardType == null || boardType.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("boardType", "errors.type.empty", "게시판 설정에 문제가 발생했습니다.\n고객센터를 다시 접속해 주세요.");
		}
	}
}
