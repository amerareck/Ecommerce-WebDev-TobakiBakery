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
		log.info(form.toString());
		
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
		
		//인수자 명
		String receiverName = form.getReceiverName();
		if(receiverName == null || receiverName.isEmpty()) {
			log.info("오류 검출");
			errors.rejectValue("receiverName", "errors.receiverName.empty", "받는 사람의 이름을 작성해주세요.");
		} else if(!receiverName.matches("[가-힣\\s]+")) {
			log.info("오류 검출");
			errors.rejectValue("receiverName", "errors.receiverName.unsuitable", "적합하지 않은 이름입니다. 오직 한글만 적어주세요.");
		} else if(receiverName.length() < 2 || receiverName.length() > 8) {
			log.info("오류 검출");
			errors.rejectValue("receiverName", "errors.receiverName.longName", "이름은 2자 이상, 8자 이하로 적어주세요.");
		}
		
		//주문 메모
		String orderMemo = form.getOrderMemo();
		if(orderMemo.length() > 30) {
			log.info("오류 검출");
			errors.rejectValue("orderMemo", "errors.orderMemo.longMemo", "주문 메시지는 30자를 초과할 수 없습니다.");
		}
		
		//휴대폰 번호
		String receiverPhoneNum = form.getReceiverPhoneNum().replaceAll("[^0-9]", "");
		String firstNum = null;
		String secondNum = null;
		String thirdNum = null;
		
		if(receiverPhoneNum.length() > 9) {
			firstNum = receiverPhoneNum.substring(0, 3);
			secondNum = receiverPhoneNum.length() == 10 ? receiverPhoneNum.substring(3, 6) : receiverPhoneNum.substring(3, 7);
			thirdNum = receiverPhoneNum.length() == 10 ? receiverPhoneNum.substring(6, receiverPhoneNum.length()) : receiverPhoneNum.substring(7, receiverPhoneNum.length());
		}
		
		if(form.getReceiverPhoneNum().length() < 10 || form.getReceiverPhoneNum().length() > 11) {
			log.info("오류 검출");
			errors.rejectValue("receiverPhoneNum", "errors.receiverPhoneNum.longPhoneNumber", 
					"휴대 번호의 길이는 10자 혹은 11자만 입력 가능합니다.");
		} else if(form.getReceiverPhoneNum().replaceAll("[0-9]", "").length() != 0) {
			log.info("오류 검출");
			errors.rejectValue("receiverPhoneNum", "errors.receiverPhoneNum.NaN", 
					"휴대 번호는 숫자만 입력이 가능합니다.");
		} else if(!firstNum.startsWith("01")) {
			log.info("오류 검출");
			errors.rejectValue("receiverPhoneNum", "errors.receiverPhoneNum.firstError",
					"휴대번호는 '01X'으로 시작되어야만 합니다.");
		} else if(firstNum.length() != 3) {
			log.info("오류 검출");
			errors.rejectValue("receiverPhoneNum", "errors.receiverPhoneNum.firstLengthError",
					"휴대번호 앞 3자리를 정확히 입력해주십시오.");
		} else if(secondNum.length() < 3 || secondNum.length() > 4) {
			log.info("오류 검출");
			errors.rejectValue("receiverPhoneNum", "errors.receiverPhoneNum.secondLengthError",
					"휴대번호 중간 자리는 3자 이상, 4자 이하여야만 합니다.");
		} else if(thirdNum.length() != 4) {
			log.info("오류 검출");
			errors.rejectValue("receiverPhoneNum", "errors.receiverPhoneNum.thirdLengthError",
					"휴대번호 마지막 자리는 4자 이어야만 합니다.");
		}
	}
}
