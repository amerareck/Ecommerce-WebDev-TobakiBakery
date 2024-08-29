package com.mycompany.miniproject.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.miniproject.dto.CommentDTO;
import com.mycompany.miniproject.dto.NoticeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/center")
public class CenterController {
	@GetMapping("/getBoardList")
	public String getBoardList(String type) {
		log.info("실행");
		String path = "";
		if(type.equals("notice")) {
			path = "redirect:/center/noticeList";
		} else if(type.equals("product")) {
			path = "redirect:/center/productList";
		} else if(type.equals("other")) {
			path = "redirect:/center/otherList";
		}
		return path;
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		log.info("실행");
		
		model.addAttribute("notice", "active");
		model.addAttribute("title","공지사항");
		model.addAttribute("breadcrumb", "공지사항");
		model.addAttribute("boardType", "notice");
		return "center/center-board-list";
	}
	
	@GetMapping("/productList")
	public String productList(Model model) {
		log.info("실행");
		
		model.addAttribute("product", "active");
		model.addAttribute("title", "상품문의");
		model.addAttribute("breadcrumb", "상품문의");
		model.addAttribute("boardType", "product");
		return "center/center-board-list";
	}
	
	@GetMapping("/otherList")
	public String otherList(Model model) {
		log.info("실행");
		
		model.addAttribute("other", "active");
		model.addAttribute("title", "기타문의");
		model.addAttribute("breadcrumb", "기타문의");
		model.addAttribute("boardType", "other");
		return "center/center-board-list";
	}
	
	@GetMapping("/addBoard")
	public String addBoard(String type) {
		log.info("실행");
		String path = "";
		if(type.equals("notice")) {
			path = "redirect:/center/addNoticeBoard";
		} else if(type.equals("product")) {
			path = "redirect:/center/addProductBoard";
		} else if(type.equals("other")) {
			path = "redirect:/center/addOtherBoard";
		}
		return path;
	}
	
	@GetMapping("/addNoticeBoard")
	public String addNoticeBoard(Model model) {
		log.info("실행");
		
		model.addAttribute("notice", "active");
		model.addAttribute("title","공지사항");
		model.addAttribute("breadcrumb", "공지사항");
		model.addAttribute("hideCategory","style='display: none !important;'");
		model.addAttribute("hideReview","style='display: none !important;'");
		model.addAttribute("boardType", "notice");
		
		//폼 name
		model.addAttribute("author", "memberId");
		model.addAttribute("postTitle", "noticeTitle");
		model.addAttribute("isSecret", "lockState");
		model.addAttribute("postContent", "memberId");
		model.addAttribute("postFile", "noticeContentImg");
		
		return "center/center-board-add";
	}
	
	@GetMapping("/addProductBoard")
	public String addProductBoard(Model model) {
		log.info("실행");
		
		model.addAttribute("product", "active");
		model.addAttribute("title", "상품문의");
		model.addAttribute("breadcrumb", "상품문의");
		model.addAttribute("hideReview","style='display: none !important;'");
		model.addAttribute("boardType", "product");
		
		return "center/center-board-add";
	}
	
	@GetMapping("/addOtherBoard")
	public String addOtherBoard(Model model) {
		log.info("실행");
		
		model.addAttribute("other", "active");
		model.addAttribute("title", "기타문의");
		model.addAttribute("breadcrumb", "기타문의");
		model.addAttribute("hideCategory","style='display: none !important;'");
		model.addAttribute("hideReview","style='display: none !important;'");
		model.addAttribute("boardType", "other");
		
		return "center/center-board-add";
	}
	
	@GetMapping("/getBoardDetail")
	public String getBoardDetail(String type) {
		log.info("실행");
		String path = "";
		if(type.equals("notice")) {
			path = "redirect:/center/noticeDetail";
		} else if(type.equals("product")) {
			path = "redirect:/center/productDetail";
		} else if(type.equals("other")) {
			path = "redirect:/center/otherDetail";
		}
		
		return path;
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(Model model) {
		log.info("실행");
		
		model.addAttribute("notice", "active");
		model.addAttribute("title","공지사항");
		model.addAttribute("breadcrumb", "공지사항");
		model.addAttribute("boardType", "notice");
		
		return "center/center-board-details";
	}
	
	@GetMapping("/productDetail")
	public String productDetail(Model model) {
		log.info("실행");
		
		model.addAttribute("product", "active");
		model.addAttribute("title","상품문의");
		model.addAttribute("breadcrumb", "상품문의");
		model.addAttribute("boardType", "product");
		
		return "center/center-board-details";
	}
	
	@GetMapping("/otherDetail")
	public String otherDetail(Model model) {
		log.info("실행");
		
		model.addAttribute("other", "active");
		model.addAttribute("title","기타문의");
		model.addAttribute("breadcrumb", "기타문의");
		model.addAttribute("boardType", "other");
		
		return "center/center-board-details";
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
	
	@PostMapping("/addComment")
	public void addComment(CommentDTO comment, HttpServletResponse res) {
		log.info("실행");
		log.info(comment.toString());
		
		JSONObject json = new JSONObject();
		json.put("status", "ok");
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json, charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	@PostMapping("/submitNotice")
	public String submitNotice(NoticeDTO notice) {
		log.info("실행");
		log.info(notice.toString());
		
		return "redirect:/center/noticeDetail";
	}
}
