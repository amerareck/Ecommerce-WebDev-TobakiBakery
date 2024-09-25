package com.mycompany.miniproject.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.miniproject.dto.OrderForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class OrderValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return OrderForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		OrderForm form = (OrderForm) target;
		
		//우편번호
		int deliveryPostNum = form.getDeliveryPostNum();
		if (deliveryPostNum < 1) {
			log.info("오류 검출");
			errors.rejectValue("deliveryPostNum", "errors.deliveryPostNum.required", "우편번호는 생략할 수 없습니다.");
		}
		
		//주소
		String deliveryAddress = form.getDeliveryAddress();
		if (deliveryAddress == null || deliveryAddress.isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("deliveryAddress", "errors.deliveryAddress.required", "주소는 생략할 수 없습니다.");
		}
		
		//상세 주소
		String deliveryAddressDetail = form.getDeliveryAddress();
		if (deliveryAddressDetail == null || deliveryAddressDetail.isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("deliveryAddressDetail", "errors.deliveryAddressDetail.required", "상세 주소는 생략할 수 없습니다.");
		} else if(deliveryAddressDetail.length() < 4) {
			log.info("오류 검출");
			errors.rejectValue("deliveryAddressDetail", "errors.deliveryAddressDetail.length", "상세 주소는 4자 이상이어야 합니다.");
		}
		
	}
}
