package com.mycompany.miniproject.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.miniproject.dto.CommentDTO;
import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.HelpdeskForm;
import com.mycompany.miniproject.dto.NoticeDTO;
import com.mycompany.miniproject.dto.NoticeForm;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.service.CenterService;
import com.mycompany.miniproject.validator.HelpdeskBoardValidator;
import com.mycompany.miniproject.validator.NoticeBoardValidator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/center")
public class CenterController {
	@Autowired
	private CenterService centerService;
	
	@GetMapping("")
	public String handler() {
		log.info("실행");
		
		return "redirect:/center/list";
	}
	
	@GetMapping("/list") 
	public String getList(
			@RequestParam(value="type", defaultValue="notice") String type, 
			@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		log.info("실행");
		String[] elNames = {"active", "title", "breadcrumb", "boardType", "boardAllCount"};
		int boardAllCount = centerService.getBoardAllCount(type);
		Pager pager = new Pager(10, 5, boardAllCount, pageNo);
		model.addAttribute("pager", pager);
		
		if(type!=null && type.equals("helpdesk")) {
			String[] data = {"helpdesk", "문의사항", "문의사항", "helpdesk", Integer.toString(boardAllCount)};
			List<HelpdeskDTO> dto = centerService.getHelpdeskList(pager);
			model.addAttribute("boardList", dto);
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
		} else {
			String[] data = {"notice", "공지사항", "공지사항", "notice", Integer.toString(boardAllCount)};
			List<NoticeDTO> dto = centerService.getNoticeList(pager);
			model.addAttribute("boardList", dto);
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
		}
		return "center/boardList";
	}
	
	@GetMapping("/addBoard")
	public String addBoard(String type, Model model) {
		log.info("실행");
		String[] elNames = {
				"active", "title", "breadcrumb", "showCategory", "showReview",
				"boardType", "formAction",
				"author", "postTitle", "isSecret", "postContent", "postFile", "timestamp"
		};

		if(type!=null && type.equals("helpdesk")) {
			String[] data = {
					"helpdesk", "문의사항", "문의사항", "none", "none",
					"helpdesk", "submitHelpdesk",
					"memberId", "helpdeskTitle", "lockState", "helpdeskContent", "helpdeskAttach", "helpdeskDatetime"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
		} else {
			String[] data = {
					"notice", "공지사항", "공지사항", "none", "none",
					"notice", "submitNotice",
					"memberId", "noticeTitle", "lockState", "noticeContent", "noticeAttach", "noticeDatetime"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
		}
		
		return "center/boardInsert";
	}
	
	@GetMapping("/detail")
	public String getDetail(String type, String boardNum, Model model) {
		log.info("실행");
		if(boardNum == null) return "redirect:/center/list?type="+type;
		
		Map<String, Object> map = new HashMap<>();
		String[] elNames = {
			"notice", "title", "breadcrumb", "boardType"	
		};

		if(type!=null && type.equals("helpdesk")) {
			String[] data = {
					"helpdesk", "문의사항", "문의사항", "helpdesk"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
			
			boardNum = boardNum.replaceAll("[^0-9]", "");
			HelpdeskDTO dto = centerService.getHelpdeskPostByBoardNum(Integer.parseInt(boardNum));
			map.put("title", dto.getHelpdeskTitle());
			map.put("boardId", dto.getHelpdeskId());
			map.put("datetime", dto.getHelpdeskDatetime());
			map.put("memberId", dto.getMemberId());
			map.put("views", dto.getHelpdeskViews());
			map.put("content", dto.getHelpdeskContent());
			
			List<String> imageNames = centerService.getBoardImageNames("helpdesk", dto.getHelpdeskId());
			map.put("imageNames", imageNames);
			model.addAttribute("board", map);
			
		} else {
			String[] data = {
					"notice", "공지사항", "공지사항", "notice"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
			
			boardNum = boardNum.replaceAll("[^0-9]", "");
			NoticeDTO dto = centerService.getNoticePostByBoardNum(Integer.parseInt(boardNum));
			map.put("title", dto.getNoticeTitle());
			map.put("boardId", dto.getNoticeId());
			map.put("datetime", dto.getNoticeDatetime());
			map.put("memberId", dto.getMemberId());
			map.put("views", dto.getNoticeViews());
			map.put("content", dto.getNoticeContent());
			
			List<String> imageNames = centerService.getBoardImageNames("notice", dto.getNoticeId());
			map.put("imageNames", imageNames);
			model.addAttribute("board", map);
		}
		
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
	
	@InitBinder("noticeForm")
	public void noticeSubmitBinder(WebDataBinder binder) {
		log.info("InitBinder 실행");
		binder.setValidator(new NoticeBoardValidator());
	}
	
	@PostMapping("/submitNotice")
	public String submitNotice(@Valid NoticeForm notice, Errors error, RedirectAttributes redi) throws IOException {
		log.info("실행");
		log.info(notice.toString());
		
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			log.info(error.getFieldError("noticeTitle").getDefaultMessage());
			redi.addFlashAttribute("isAlert", true);
			redi.addFlashAttribute("alert", error.getFieldError("noticeTitle").getDefaultMessage());
			return "redirect:/center/addBoard?type=notice";
		}
		// 유효성 검사 통과
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setMemberId(notice.getMemberId());
		noticeDTO.setNoticeTitle(notice.getNoticeTitle());
		noticeDTO.setNoticeContent(notice.getNoticeContent());
		List<NoticeDTO> imageList = new ArrayList<>();
		for(MultipartFile mf : notice.getNoticeAttach()) {
			if(!mf.isEmpty()) {
				NoticeDTO image = new NoticeDTO();
				image.setImageOriginalName(mf.getOriginalFilename());
				image.setImageType(mf.getContentType());
				image.setImageData(mf.getBytes());
				image.setMemberId(noticeDTO.getMemberId());
				imageList.add(image);
			}
		}
		centerService.insertNoticePost(noticeDTO);
		if(!imageList.isEmpty()) {
			centerService.insertNoticeImages(imageList);
		}
		
		return "redirect:/center/detail?type=notice&boardNum="+noticeDTO.getNoticeId();
	}
	
	@InitBinder("helpdeskForm")
	public void helpdeskSubmitBinder(WebDataBinder binder) {
		log.info("InitBinder 실행");
		binder.setValidator(new HelpdeskBoardValidator());
	}
	
	@PostMapping("/submitHelpdesk")
	public String submitHelpdesk(@Valid HelpdeskForm form, Errors error, RedirectAttributes redi) throws IOException {
		log.info("실행");
		log.info(form.toString());
		
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			redi.addFlashAttribute("isAlert", true);
			redi.addFlashAttribute("alert", error.getFieldError("helpdeskTitle").getDefaultMessage());
			return "redirect:/center/addBoard?type=helpdesk";
		}
		// 유효성 검사 통과
		HelpdeskDTO dto = new HelpdeskDTO();
		dto.setMemberId(form.getMemberId());
		dto.setHelpdeskTitle(form.getHelpdeskTitle());
		dto.setLockState(form.isLockState());
		dto.setHelpdeskContent(form.getHelpdeskContent());
		List<HelpdeskDTO> imageList = new ArrayList<>();
		for(MultipartFile mf : form.getHelpdeskAttach()) {
			if(!mf.isEmpty()) {
				HelpdeskDTO image = new HelpdeskDTO();
				image.setImageOriginalName(mf.getOriginalFilename());
				image.setImageType(mf.getContentType());
				image.setImageData(mf.getBytes());
				image.setMemberId(dto.getMemberId());
				imageList.add(image);
			}
		}

		centerService.insertHelpdeskPost(dto);
		if(!imageList.isEmpty()) {
			centerService.insertHelpdeskImages(imageList);
		}
		
		return "redirect:/center/detail?type=helpdesk&boardNum="+dto.getHelpdeskId();
	}
	
	@GetMapping("/image")
	public void getImages(String type, String imageName, String boardId, HttpServletResponse res) throws IOException {
		log.info("실행");
		
		if(type.equals("helpdesk")) {
			HelpdeskDTO dto = new HelpdeskDTO();
			dto.setHelpdeskId(Integer.parseInt(boardId.replaceAll("[^0-9]", "")));
			dto.setImageOriginalName(imageName);
			
			dto = centerService.getImage(dto);
			
			String contentType = dto.getImageType();
			String fileName = dto.getImageOriginalName();
			String encodingFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			res.setContentType(contentType);
			res.setHeader("Content-Disposition", "attachment; filename=\""+encodingFileName+"\"");

			OutputStream out = res.getOutputStream();
			out.write(dto.getImageData());
			out.flush();
			out.close();
			
		} else {
			NoticeDTO dto = new NoticeDTO();
			dto.setNoticeId(Integer.parseInt(boardId.replaceAll("[^0-9]", "")));
			dto.setImageOriginalName(imageName);
			
			dto = centerService.getImage(dto);
			
			String contentType = dto.getImageType();
			String fileName = dto.getImageOriginalName();
			String encodingFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			res.setContentType(contentType);
			res.setHeader("Content-Disposition", "attachment; filename=\""+encodingFileName+"\"");

			OutputStream out = res.getOutputStream();
			out.write(dto.getImageData());
			out.flush();
			out.close();
		}
	}
}
