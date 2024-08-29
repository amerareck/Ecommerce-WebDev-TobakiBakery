package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class NoticeDTO {
	int noticeId;
	String noticeTitle;
	String noticeDatetime;
	String noticeContent;
	String noticeContentImg;
	int noticeViews;
	String memberId;
	boolean lockState;
}
