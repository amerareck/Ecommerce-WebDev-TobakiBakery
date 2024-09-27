package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class CenterImageDTO {
	private String imageOriginalName;
	private String imageType;
	private byte[] imageData;
	private int helpdeskId;
	private int noticeId;
	private int productReviewId;
}
