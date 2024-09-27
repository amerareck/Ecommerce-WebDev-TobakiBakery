package com.mycompany.miniproject.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


import com.mycompany.miniproject.dto.ProductReviewForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ReviewValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return ProductReviewForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		ProductReviewForm productReviewForm = (ProductReviewForm) target;

		String reviewTitle = productReviewForm.getReviewTitle();
		if (reviewTitle == null || reviewTitle.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("reviewTitle", "errors.reviewTitle.required", "제목은 반드시 입력하셔야 합니다.");
		}
		
	}
}
