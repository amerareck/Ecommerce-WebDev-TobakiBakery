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
		String productName = form.getProductName();
		if (productName == null || productName.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("productName", "errors.productName.required", "상품 제목을 기입하십시오.");
		}
		
		//카테고리
		String categoryName = form.getCategoryName();
		if (categoryName == null || categoryName.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("categoryName", "errors.categoryName.empty", "카테고리를 선택하십시오.");
		}
		
		//상품가격
		int productPrice = form.getProductPrice();
		if (productPrice < 0) {
			log.info("오류 검출");
			errors.rejectValue("productPrice", "errors.productPrice.minus", "상품가격은 음수일 수 없습니다.");
		}
		
		//상품수량
		int productCount = form.getProductCount();
		if (productCount < 0) {
			log.info("오류 검출");
			errors.rejectValue("productCount", "errors.productCount.minus", "상품수량은 음수일 수 없습니다.");
		}
		
		//상품상태
		String productState = form.getProductState();
		if (productState == null || productState.trim().isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("productState", "errors.productState.empty", "상품상태를 설정하십시오.");
		}
	}
}
