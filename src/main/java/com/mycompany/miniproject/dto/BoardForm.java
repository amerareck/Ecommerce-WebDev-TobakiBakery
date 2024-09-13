package com.mycompany.miniproject.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeForm {
	String noticeTitle;
	String noticeContent;
	String memberId;
	boolean lockState;
	
	MultipartFile[] noticeAttach;
}
