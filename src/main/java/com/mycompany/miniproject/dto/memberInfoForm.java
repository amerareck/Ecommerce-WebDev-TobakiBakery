package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class memberInfoForm {
	private String memberName;
	private String memberId;
	private String memberPassword;
	private String passwordConfirm;
	private String memberBirthYear;
	private String memberBirthMonth;
	private String memberBirthDay;
	private String postcode;
	private String address;
	private String addressDetail;
	private String phonePrefix;
	private String phoneMidNum;
	private String phoneLastNum;
	private String memberEmailLocal;
	private String memberEmailDomain;
	private String memberQuestion;
	private String memberAnswer;
	
}
