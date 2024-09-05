package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	int commentId;
	String commentContent;
	Date commnetDatetime;
	String memberId;
	int noticeId;
	int helpdeskId;
}
