package com.mycompany.miniproject.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class HelpdeskForm {
	String helpdeskTitle;
	String helpdeskContent;
	boolean lockState;
	String memberId;
	
	MultipartFile[] helpdeskAttach;
}
