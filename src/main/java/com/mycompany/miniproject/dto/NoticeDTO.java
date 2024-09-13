package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	private int noticeId;
	private String noticeTitle;
	private Date noticeDatetime;
	private String noticeContent;
	private int noticeViews;
	private String memberId;
	
	private String imageOriginalName;
	private String imageType;
	private byte[] imageData;
}
