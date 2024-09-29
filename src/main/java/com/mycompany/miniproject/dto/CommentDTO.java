package com.mycompany.miniproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	private int commentId;
	private String commentContent;
	private Date commentDatetime;
	private String memberId;
	private String boardType;
	private int boardId;
}
