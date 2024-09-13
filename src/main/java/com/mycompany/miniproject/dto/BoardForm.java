package com.mycompany.miniproject.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardForm {
	private String title;
	private String content;
	private String memberId;
	private boolean lockState;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date datetime;
	
	private MultipartFile[] attach;
	
	private String boardType;
	private int boardId;
}
