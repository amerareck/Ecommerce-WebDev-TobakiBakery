package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private String memberId;
	private String memberName;
	private String memberPassword;
	private String memberBirthday;
	private int postNum;
	private String address;
	private String addressDetail;
	private String phoneNum;
	private String memberEmail;
	private int memberQuestion;
	private String memberAnswer;
	private String memberRole;
	private boolean memberEnable;
}
