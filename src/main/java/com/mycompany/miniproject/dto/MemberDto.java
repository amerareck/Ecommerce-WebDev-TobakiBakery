package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class MemberDto {
	private String member_id;
	private String member_name;
	private String member_password;
	private String member_birthday;
	private int post_num;
	private String address;
	private String address_detail;
	private String phone_num;
	private String member_email;
	private String member_q;//일단 문자열로
	private String member_a;
	private int member_grade;
}
