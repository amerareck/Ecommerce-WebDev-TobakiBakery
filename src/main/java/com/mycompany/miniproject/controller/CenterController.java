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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.miniproject.dto.CommentDTO;
import com.mycompany.miniproject.dto.EtcAskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;
import com.mycompany.miniproject.dto.ProductAskDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/center")
public class CenterController {
	@GetMapping("/getBoardList")
	public String getBoardList(String type, RedirectAttributes redi) {
		log.info("실행");
		String path = "";
		if(type.equals("notice")) {
			redi.addFlashAttribute("notice", "active");
			redi.addFlashAttribute("title","공지사항");
			redi.addFlashAttribute("breadcrumb", "공지사항");
			redi.addFlashAttribute("boardType", "notice");
			
			path = "redirect:/center/noticeList";
			
		} else if(type.equals("product")) {
			redi.addFlashAttribute("product", "active");
			redi.addFlashAttribute("title", "상품문의");
			redi.addFlashAttribute("breadcrumb", "상품문의");
			redi.addFlashAttribute("boardType", "product");
			
			path = "redirect:/center/productList";
			
		} else if(type.equals("other")) {
			redi.addFlashAttribute("other", "active");
			redi.addFlashAttribute("title", "기타문의");
			redi.addFlashAttribute("breadcrumb", "기타문의");
			redi.addFlashAttribute("boardType", "other");
			
			path = "redirect:/center/otherList";
			
		}
		return path;
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		log.info("실행");
		
		return "center/center-board-list";
	}
	
	@GetMapping("/productList")
	public String productList(Model model) {
		log.info("실행");
		
		return "center/center-board-list";
	}
	
	@GetMapping("/otherList")
	public String otherList(Model model) {
		log.info("실행");
		
		return "center/center-board-list";
	}
	
	@GetMapping("/addBoard")
	public String addBoard(String type, RedirectAttributes redi) {
		log.info("실행");
		String path = "";
		if(type.equals("notice")) {
			redi.addFlashAttribute("notice", "active");
			redi.addFlashAttribute("title","공지사항");
			redi.addFlashAttribute("breadcrumb", "공지사항");
			redi.addFlashAttribute("showCategory", false);
			redi.addFlashAttribute("showReview", false);
			redi.addFlashAttribute("showFile", true);
			redi.addFlashAttribute("boardType", "notice");
			redi.addFlashAttribute("formAction", "submitNotice");
			
			//폼 data
			redi.addFlashAttribute("author", "memberId");
			redi.addFlashAttribute("postTitle", "noticeTitle");
			redi.addFlashAttribute("isSecret", "lockState");
			redi.addFlashAttribute("postContent", "noticeContent");
			redi.addFlashAttribute("postFile", "noticeContentImg");
			redi.addFlashAttribute("timestamp", "noticeDatetime");
			
			path = "redirect:/center/addNoticeBoard";
			
		} else if(type.equals("product")) {
			redi.addFlashAttribute("product", "active");
			redi.addFlashAttribute("title", "상품문의");
			redi.addFlashAttribute("breadcrumb", "상품문의");
			redi.addFlashAttribute("showCategory", true);
			redi.addFlashAttribute("showReview", false);
			redi.addFlashAttribute("showFile", false);
			redi.addFlashAttribute("boardType", "product");
			redi.addFlashAttribute("formAction", "submitProductAsk");
			
			//폼 data
			redi.addFlashAttribute("author", "memberId");
			redi.addFlashAttribute("postTitle", "productAskTitle");
			redi.addFlashAttribute("isSecret", "lockState");
			redi.addFlashAttribute("postContent", "productAskContent");
			redi.addFlashAttribute("timestamp", "productAskDatetime");
			
			path = "redirect:/center/addProductBoard";
			
		} else if(type.equals("other")) {
			redi.addFlashAttribute("other", "active");
			redi.addFlashAttribute("title", "기타문의");
			redi.addFlashAttribute("breadcrumb", "기타문의");
			redi.addFlashAttribute("showCategory", false);
			redi.addFlashAttribute("showReview", false);
			redi.addFlashAttribute("showFile", true);
			redi.addFlashAttribute("boardType", "other");
			redi.addFlashAttribute("formAction", "submitEtcAsk");
			
			//폼 data
			redi.addFlashAttribute("author", "memberId");
			redi.addFlashAttribute("postTitle", "etcAskTitle");
			redi.addFlashAttribute("isSecret", "lockState");
			redi.addFlashAttribute("postContent", "etcAskContent");
			redi.addFlashAttribute("timestamp", "etcAskDatetime");
			
			path = "redirect:/center/addOtherBoard";
		}
		return path;
	}
	
	@GetMapping("/addNoticeBoard")
	public String addNoticeBoard(Model model) {
		log.info("실행");

		return "center/center-board-add";
	}
	
	@GetMapping("/addProductBoard")
	public String addProductBoard(Model model) {
		log.info("실행");
		
		return "center/center-board-add";
	}
	
	@GetMapping("/addOtherBoard")
	public String addOtherBoard(Model model) {
		log.info("실행");
		
		return "center/center-board-add";
	}
	
	@GetMapping("/getBoardDetail")
	public String getBoardDetail(String type, RedirectAttributes redi) {
		log.info("실행");
		String path = "";
		if(type.equals("notice")) {
			redi.addFlashAttribute("notice", "active");
			redi.addFlashAttribute("title","공지사항");
			redi.addFlashAttribute("breadcrumb", "공지사항");
			redi.addFlashAttribute("boardType", "notice");
			
			path = "redirect:/center/noticeDetail";
			
		} else if(type.equals("product")) {
			redi.addFlashAttribute("product", "active");
			redi.addFlashAttribute("title","상품문의");
			redi.addFlashAttribute("breadcrumb", "상품문의");
			redi.addFlashAttribute("boardType", "product");
			
			path = "redirect:/center/productDetail";
			
		} else if(type.equals("other")) {
			redi.addFlashAttribute("other", "active");
			redi.addFlashAttribute("title","기타문의");
			redi.addFlashAttribute("breadcrumb", "기타문의");
			redi.addFlashAttribute("boardType", "other");
			
			path = "redirect:/center/otherDetail";
		}
		
		return path;
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(Model model) {
		log.info("실행");
		
		return "center/center-board-details";
	}
	
	@GetMapping("/productDetail")
	public String productDetail(Model model) {
		log.info("실행");
				
		return "center/center-board-details";
	}
	
	@GetMapping("/otherDetail")
	public String otherDetail(Model model) {
		log.info("실행");
				
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
		
		return "redirect:/center/getBoardDetail?type=notice";
	}
	
	@PostMapping("/submitProductAsk")
	public String submitProductAsk(ProductAskDTO productAsk) {
		log.info("실행");
		log.info(productAsk.toString());
		
		return "redirect:/center/getBoardDetail?type=product";
	}
	
	@PostMapping("/submitEtcAsk")
	public String submitEtcAsk(EtcAskDTO etcAsk) {
		log.info("실행");
		log.info(etcAsk.toString());
		
		return "redirect:/center/getBoardDetail?type=other";
	}
}
