package com.mycompany.miniproject.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.miniproject.dto.ProductForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ProductValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return ProductForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		ProductForm form = (ProductForm) target;
		
		//상품제목
		String prodName = form.getProductName();
		if (prodName == null || prodName.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("prodName", "errors.prodName.required", "상품 제목을 기입하십시오.");
		}
		
		//카테고리
		String category = form.getCategoryName();
		if (category == null || category.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("ProdCategory", "errors.category.empty", "카테고리를 선택하십시오.");
		}
		
		//상품가격
		int prodPrice = form.getProductPrice();
		if (prodPrice < 0) {
			log.info("오류 검출");
			errors.rejectValue("prodPrice", "errors.prodPrice.minus", "상품가격은 음수일 수 없습니다.");
		}
		
		//상품수량
		int prodAmount = form.getProductCount();
		if (prodAmount < 0) {
			log.info("오류 검출");
			errors.rejectValue("prodAmount", "errors.prodAmount.minus", "상품수량은 음수일 수 없습니다.");
		}
		
		//상품상태
		String prodState = form.getProductState();
		if (prodState == null || prodState.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("prodState", "errors.prodState.empty", "상품상태를 설정하십시오.");
		}
	}
}
