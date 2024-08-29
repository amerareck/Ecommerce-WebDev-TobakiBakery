package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class CommentDTO {
	int commentId;
	String commentContent;
	String commentDatetime;
	int noticeId; // 공지사항 id
	String memberId; // 작성자 id
	int productAskId; // 상품문의 id
	int etcAskId; // 기타문의 id
}
