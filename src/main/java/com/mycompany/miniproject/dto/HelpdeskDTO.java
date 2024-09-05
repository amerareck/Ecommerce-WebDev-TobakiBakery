package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class HelpdeskDTO {
	int helpdeskId;
	String helpdeskTitle;
	String helpdeskContent;
	Date helpdeskDatetime;
	int helpdeskViews;
	boolean lockState;
	String memberId;
	
	String imageOriginalName;
	String imageType;
	byte[] imageData;
	
}
