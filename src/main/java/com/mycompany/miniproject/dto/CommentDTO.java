package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	private int commentId;
	private String commentContent;
	private Date commnetDatetime;
	private String memberId;
	private int noticeId;
	private int helpdeskId;
}
