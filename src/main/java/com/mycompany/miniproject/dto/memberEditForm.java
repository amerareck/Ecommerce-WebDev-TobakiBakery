package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class memberEditForm {
	private String name;
	private String username;
	private String password;
	private String passwordConfirm;
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	private String postcode;
	private String address;
	private String addressDetail;
	private String phonePrefix;
	private String phoneMidNum;
	private String phoneLastNum;
	private String emailLocal;
	private String emailDomain;
	private String question;
	private String answer;
	
}
