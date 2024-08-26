package com.mycompany.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/center")
public class CenterController {
	@RequestMapping("/getBoardList")
	public String getBoardList() {
		log.info("실행");
		return "center/center-board-list";
	}
	
	@RequestMapping("/getBoardDetail")
	public String getBoardDetail() {
		log.info("실행");
		return "center/center-board-details";
	}
	
	@RequestMapping("/addBoard")
	public String addBoard() {
		log.info("실행");
		return "center/center-board-add";
	}
	
}
