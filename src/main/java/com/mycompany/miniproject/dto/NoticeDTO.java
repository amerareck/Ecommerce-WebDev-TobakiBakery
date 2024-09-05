package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	int noticeId;
	String noticeTitle;
	Date noticeDatetime;
	String noticeContent;
	int noticeViews;
	String memberId;
	
	String imageOriginalName;
	String imageType;
	byte[] imageData;
}
