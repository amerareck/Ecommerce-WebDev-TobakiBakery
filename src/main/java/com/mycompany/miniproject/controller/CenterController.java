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
import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;
import com.mycompany.miniproject.dto.ProductAskDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/center")
public class CenterController {
	
	@GetMapping("")
	public String home() {
		log.info("실행");
		
		return "redirect:/center/notice";
	}
	
	@GetMapping("/notice")
	public String noticeList(Model model) {
		log.info("실행");
		model.addAttribute("notice", "active");
		model.addAttribute("title","공지사항");
		model.addAttribute("breadcrumb", "공지사항");
		model.addAttribute("boardType", "notice");
		
		return "center/boardList";
	}
	
	@GetMapping("/product")
	public String productList(Model model) {
		log.info("실행");
		model.addAttribute("product", "active");
		model.addAttribute("title", "상품문의");
		model.addAttribute("breadcrumb", "상품문의");
		model.addAttribute("boardType", "product");
		
		return "center/boardList";
	}
	
	@GetMapping("/other")
	public String otherList(Model model) {
		log.info("실행");
		model.addAttribute("other", "active");
		model.addAttribute("title", "기타문의");
		model.addAttribute("breadcrumb", "기타문의");
		model.addAttribute("boardType", "other");
		
		return "center/boardList";
	}
	
	@GetMapping("/notice/addBoard")
	public String addNoticeBoard(Model model) {
		log.info("실행");
		model.addAttribute("notice", "active");
		model.addAttribute("title","공지사항");
		model.addAttribute("breadcrumb", "공지사항");
		model.addAttribute("showCategory", false);
		model.addAttribute("showReview", false);
		model.addAttribute("showFile", true);
		model.addAttribute("boardType", "notice");
		model.addAttribute("formAction", "submitBoard");
		
		//폼 data
		model.addAttribute("author", "memberId");
		model.addAttribute("postTitle", "noticeTitle");
		model.addAttribute("isSecret", "lockState");
		model.addAttribute("postContent", "noticeContent");
		model.addAttribute("postFile", "noticeContentImg");
		model.addAttribute("timestamp", "noticeDatetime");
		
		return "center/boardInsert";
	}
	
	@GetMapping("/product/addBoard")
	public String addProductBoard(Model model) {
		log.info("실행");
		model.addAttribute("product", "active");
		model.addAttribute("title", "상품문의");
		model.addAttribute("breadcrumb", "상품문의");
		model.addAttribute("showCategory", true);
		model.addAttribute("showReview", false);
		model.addAttribute("showFile", false);
		model.addAttribute("boardType", "product");
		model.addAttribute("formAction", "submitBoard");
		
		//폼 data
		model.addAttribute("author", "memberId");
		model.addAttribute("postTitle", "productAskTitle");
		model.addAttribute("isSecret", "lockState");
		model.addAttribute("postContent", "productAskContent");
		model.addAttribute("timestamp", "productAskDatetime");
		return "center/boardInsert";
	}
	
	@GetMapping("/other/addBoard")
	public String addOtherBoard(Model model) {
		log.info("실행");
		model.addAttribute("other", "active");
		model.addAttribute("title", "기타문의");
		model.addAttribute("breadcrumb", "기타문의");
		model.addAttribute("showCategory", false);
		model.addAttribute("showReview", false);
		model.addAttribute("showFile", true);
		model.addAttribute("boardType", "other");
		model.addAttribute("formAction", "submitBoard");
		
		//폼 data
		model.addAttribute("author", "memberId");
		model.addAttribute("postTitle", "etcAskTitle");
		model.addAttribute("isSecret", "lockState");
		model.addAttribute("postContent", "etcAskContent");
		model.addAttribute("timestamp", "etcAskDatetime");
		
		return "center/boardInsert";
	}
	
	@GetMapping("/notice/detail")
	public String noticeDetail(Model model) {
		log.info("실행");
		model.addAttribute("notice", "active");
		model.addAttribute("title","공지사항");
		model.addAttribute("breadcrumb", "공지사항");
		model.addAttribute("boardType", "notice");
		
		return "center/boardDetail";
	}
	
	@GetMapping("/product/detail")
	public String productDetail(Model model) {
		log.info("실행");
		model.addAttribute("product", "active");
		model.addAttribute("title","상품문의");
		model.addAttribute("breadcrumb", "상품문의");
		model.addAttribute("boardType", "product");
				
		return "center/boardDetail";
	}
	
	@GetMapping("/other/detail")
	public String otherDetail(Model model) {
		log.info("실행");
		model.addAttribute("other", "active");
		model.addAttribute("title","기타문의");
		model.addAttribute("breadcrumb", "기타문의");
		model.addAttribute("boardType", "other");
				
		return "center/boardDetail";
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
	
	@PostMapping("notice/submitBoard")
	public String submitNotice(NoticeDTO notice) {
		log.info("실행");
		log.info(notice.toString());
		
		return "redirect:/center/notice/detail";
	}
	
	@PostMapping("product/submitBoard")
	public String submitProductAsk(ProductAskDTO productAsk) {
		log.info("실행");
		log.info(productAsk.toString());
		
		return "redirect:/center/product/detail";
	}
	
	@PostMapping("other/submitBoard")
	public String submitEtcAsk(HelpdeskDTO etcAsk) {
		log.info("실행");
		log.info(etcAsk.toString());
		
		return "redirect:/center/other/detail";
	}
}
