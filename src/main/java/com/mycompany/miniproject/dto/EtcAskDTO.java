package com.mycompany.miniproject.dto;

import lombok.Data;

@Data
public class EtcAskDTO {
	int etcAskID;
	String etcAskTitle;
	String etcAskContent;
	String etcAskImg;
	String etcAskDatetime;
	int etcAskViews;
	boolean lockState;
	String memberId;
}
