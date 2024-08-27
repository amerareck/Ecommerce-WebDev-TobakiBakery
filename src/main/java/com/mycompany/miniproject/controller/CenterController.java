package com.mycompany.miniproject.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/center")
public class CenterController {
	@GetMapping("/getBoardList")
	public String getBoardList() {
		log.info("실행");
		return "center/center-board-list";
	}
	
	@GetMapping("/getBoardDetail")
	public String getBoardDetail() {
		log.info("실행");
		return "center/center-board-details";
	}
	
	@GetMapping("/addBoard")
	public String addBoard() {
		log.info("실행");
		return "center/center-board-add";
	}
	
	@PostMapping("/removeBoard")
	public void removeBoard(String boardIndex, HttpServletResponse res) {
		log.info("실행");
		log.info("삭제할 게시판 인덱스: "+boardIndex);
		// 삭제로직 호출
		// ...
		// json 결과 리턴
		JSONObject json = new JSONObject();
		json.put("status", "ok");
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json; charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
}
