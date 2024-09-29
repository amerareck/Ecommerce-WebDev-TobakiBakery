package com.mycompany.miniproject.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.miniproject.dto.BoardForm;
import com.mycompany.miniproject.dto.CommentDTO;
import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;
import com.mycompany.miniproject.dto.Pager;
import com.mycompany.miniproject.service.CenterService;
import com.mycompany.miniproject.validator.BoardValidator;

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
			log.info(dto.toString());
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
	
	@Secured("ROLE_USER")
	@GetMapping("/addBoard")
	public String addBoard(String type, Model model, Authentication auth) {
		log.info("실행");
		if(type == null) return "redirect:/center/list?type=notice";
		
		boolean hasAdminRole = auth.getAuthorities().stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN"));
		if(type.equals("notice") && !hasAdminRole) return "redirect:/center/list?type=notice";
		
		String[] elNames = {
				"active", "title", "breadcrumb", "showCategory", "showReview",
				"boardType", "formAction",
				"author", "postTitle", "isSecret", "postContent", "postFile", "timestamp"
		};

		if(type.equals("helpdesk")) {
			String[] data = {
					"helpdesk", "문의사항", "문의사항", "none", "none",
					"helpdesk", "submitHelpdesk",
					"memberId", "title", "lockState", "content", "attach", "datetime"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
		} else {
			String[] data = {
					"notice", "공지사항", "공지사항", "none", "none",
					"notice", "submitNotice",
					"memberId", "title", "lockState", "content", "attach", "datetime"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
		}
		
		return "center/boardInsert";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/detail")
	public String getDetail(String type, String boardNum,
			@RequestParam(value="pageNo", defaultValue="1") int pageNo, 
			Model model, RedirectAttributes redi, Authentication auth) {
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
			if(dto != null) {
				String memberId = auth.getName();
				boolean admin = auth.getAuthorities().stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN"));
				log.info("admin: "+admin+" memberId: "+memberId+" lockState: "+dto.isLockState()+" master: "+dto.getMemberId());
				if(!admin && dto.isLockState() && !memberId.equals(dto.getMemberId())) {
					redi.addFlashAttribute("isAlert", true);
					redi.addFlashAttribute("alert", "본인이 아니면 읽을 수 없는 잠금된 게시글입니다.");
					return "redirect:/center/list?type=helpdesk&pageNo="+pageNo;
				}
				centerService.increaseBoardViews("helpdesk", dto.getHelpdeskId());
				dto.setCommentList(centerService.getCommentList(dto));
				map.put("title", dto.getHelpdeskTitle());
				map.put("boardId", dto.getHelpdeskId());
				map.put("datetime", dto.getHelpdeskDatetime());
				map.put("memberId", dto.getMemberId());
				map.put("views", dto.getHelpdeskViews()+1);
				map.put("content", dto.getHelpdeskContent());
				log.info(dto.getCommentList().toString());
				map.put("commentList", dto.getCommentList());
				
				List<String> imageNames = centerService.getBoardImageNames("helpdesk", dto.getHelpdeskId());
				map.put("imageNames", imageNames);
				model.addAttribute("board", map);
				
				List<HelpdeskDTO> subList = centerService.getHelpdeskSubList(dto.getHelpdeskId());
				List<Map<String, Object>> box = new ArrayList<>();
				for(HelpdeskDTO element : subList) {
					Map<String, Object> subListDto = new HashMap<>();
					subListDto.put("memberId", element.getMemberId());
					subListDto.put("title", element.getHelpdeskTitle());
					subListDto.put("boardId", element.getHelpdeskId());
					subListDto.put("datetime", element.getHelpdeskDatetime());
					subListDto.put("views", element.getHelpdeskViews());
					subListDto.put("lockState", element.isLockState());
					subListDto.put("commentCount", element.getCommentCount());
					subListDto.put("newBadge", element.isNewBadge());
					subListDto.put("adminReply", element.isAdminReply());
					box.add(subListDto);
				}
				
				model.addAttribute("subList", box);
			}
			
		} else {
			String[] data = {
					"notice", "공지사항", "공지사항", "notice"
			};
			
			for(int i=0; i<elNames.length; i++) {
				model.addAttribute(elNames[i], data[i]);
			}
			
			boardNum = boardNum.replaceAll("[^0-9]", "");
			NoticeDTO dto = centerService.getNoticePostByBoardNum(Integer.parseInt(boardNum));
			if(dto != null) {
				centerService.increaseBoardViews("notice", dto.getNoticeId());
				dto.setCommentList(centerService.getCommentList(dto));
				map.put("title", dto.getNoticeTitle());
				map.put("boardId", dto.getNoticeId());
				map.put("datetime", dto.getNoticeDatetime());
				map.put("memberId", dto.getMemberId());
				map.put("views", dto.getNoticeViews()+1);
				map.put("content", dto.getNoticeContent());
				map.put("commentList", dto.getCommentList());
				
				List<String> imageNames = centerService.getBoardImageNames("notice", dto.getNoticeId());
				map.put("imageNames", imageNames);
				model.addAttribute("board", map);
				
				List<NoticeDTO> subList = centerService.getNoticeSubList(dto.getNoticeId());
				List<Map<String, Object>> box = new ArrayList<>();
				for(NoticeDTO element : subList) {
					Map<String, Object> subListDto = new HashMap<>();
					subListDto.put("memberId", element.getMemberId());
					subListDto.put("title", element.getNoticeTitle());
					subListDto.put("boardId", element.getNoticeId());
					subListDto.put("datetime", element.getNoticeDatetime());
					subListDto.put("views", element.getNoticeViews());
					subListDto.put("commentCount", element.getCommentCount());
					subListDto.put("newBadge", element.isNewBadge());
					box.add(subListDto);
				}
				
				model.addAttribute("subList", box);
			}

		}
		
		return "center/boardDetail";
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/removeBoard")
	public void removeBoard(@RequestParam int boardIndex, String boardType, HttpServletResponse res) {
		log.info("실행");
		log.info("삭제할 게시판 인덱스: "+boardIndex);
		// 삭제로직 호출
		
		boolean result = centerService.removeBoard(boardType, boardIndex);
		
		// json 결과 리턴
		JSONObject json = new JSONObject();
		if(result) {
			json.put("status", "ok");
		} else {
			json.put("statis", "fail");
		}
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json; charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/addComment")
	public void addComment(CommentDTO comment, HttpServletResponse res) {
		log.info("실행");
		log.info(comment.toString());
		JSONObject json = new JSONObject();
		
		int commentId = centerService.addComment(comment);
		if(commentId != 0) {
			comment.setCommentId(commentId);
			CommentDTO result = centerService.getCommentSingleData(comment);
			JSONObject obj = new JSONObject();
			obj.put("commentId", result.getCommentId());
			obj.put("commentContent", result.getCommentContent());
			obj.put("commentDatetime", result.getCommentDatetime());
			obj.put("memberId", result.getMemberId());
			obj.put("boardId", result.getBoardId());
			
			json.put("status", "ok");
			json.put("commentData", obj);
		} else {
			json.put("status", "fail");
		}
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json, charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/deleteComment")
	public void deleteComment(CommentDTO comment, Authentication auth,HttpServletResponse res) {
		log.info("실행");
		log.info(comment.toString());
		JSONObject json = new JSONObject();
		
		boolean hasAdminRole = auth.getAuthorities().stream().anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_ADMIN"));
		if(centerService.checkAuthorOfComment(comment, auth.getName()) || hasAdminRole) {
			if(centerService.removeComment(comment)) {
				json.put("status", "ok");
			} else {
				json.put("statis", "fail");
			}
		} else {
			json.put("status", "no-master");
		}
		
		try(PrintWriter pw = res.getWriter()) {
			res.setContentType("application/json, charset=UTF-8");
			pw.println(json.toString());
			pw.flush();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	@InitBinder("boardForm")
	public void boardSubmitBinder(WebDataBinder binder) {
		log.info("InitBinder 실행");
		binder.setValidator(new BoardValidator());
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/submitNotice")
	public String submitNotice(@Valid BoardForm notice, Errors error, RedirectAttributes redi) throws IOException {
		log.info("실행");
		log.info(notice.toString());
		
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			FieldError fieldError = error.getFieldError("title");
			if(fieldError != null) {
				redi.addFlashAttribute("isAlert", true);
				redi.addFlashAttribute("alert", fieldError.getDefaultMessage());
			}
		}
		// 유효성 검사 통과
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setMemberId(notice.getMemberId());
		noticeDTO.setNoticeTitle(notice.getTitle());
		noticeDTO.setNoticeContent(notice.getContent());
		noticeDTO.setNoticeId(centerService.insertNoticePost(noticeDTO));

		List<NoticeDTO> imageList = new ArrayList<>();
		for(MultipartFile mf : notice.getAttach()) {
			if(!mf.isEmpty()) {
				NoticeDTO image = new NoticeDTO();
				image.setImageOriginalName(mf.getOriginalFilename());
				image.setImageType(mf.getContentType());
				image.setImageData(mf.getBytes());
				image.setNoticeId(noticeDTO.getNoticeId());
				image.setMemberId(noticeDTO.getMemberId());
				imageList.add(image);
			}
		}
		if(!imageList.isEmpty()) {
			centerService.insertNoticeImages(imageList);
		}
		
		return "redirect:/center/detail?type=notice&boardNum="+noticeDTO.getNoticeId();
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/submitHelpdesk")
	public String submitHelpdesk(@Valid BoardForm form, Errors error, RedirectAttributes redi) throws IOException {
		log.info("실행");
		log.info(form.toString());
		
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			FieldError fieldError = error.getFieldError("title");
			if(fieldError != null) {
				redi.addFlashAttribute("isAlert", true);
				redi.addFlashAttribute("alert", fieldError.getDefaultMessage());
			}
		}
		// 유효성 검사 통과
		HelpdeskDTO dto = new HelpdeskDTO();
		dto.setMemberId(form.getMemberId());
		dto.setHelpdeskTitle(form.getTitle());
		dto.setLockState(form.isLockState());
		dto.setHelpdeskContent(form.getContent());
		dto.setHelpdeskId(centerService.insertHelpdeskPost(dto));
		List<HelpdeskDTO> imageList = new ArrayList<>();
		for(MultipartFile mf : form.getAttach()) {
			if(!mf.isEmpty()) {
				HelpdeskDTO image = new HelpdeskDTO();
				image.setImageOriginalName(mf.getOriginalFilename());
				image.setImageType(mf.getContentType());
				image.setImageData(mf.getBytes());
				image.setHelpdeskId(dto.getHelpdeskId());
				image.setMemberId(dto.getMemberId());
				imageList.add(image);
			}
		}

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
	
	@Secured("ROLE_USER")
	@GetMapping("/update")
	public String updateBoard(String type, String boardNum, Model model, Authentication auth) {
		log.info("실행");
		if(type==null) return "redirect:/center/list?type=notice";
		
		String result = addBoard(type, model, auth);
		Map<String, Object> map = new HashMap<>();
		boardNum = boardNum.replaceAll("[^0-9]", "");
		
		if(type.equals("notice")) {
			NoticeDTO dto = new NoticeDTO();
			dto = centerService.getNoticePostByBoardNum(Integer.parseInt(boardNum));
			dto.setNoticeContent(dto.getNoticeContent().replaceAll("<br>", "\n"));
			
			map.put("author", dto.getMemberId());
			map.put("title", dto.getNoticeTitle());
			map.put("content", dto.getNoticeContent());
			map.put("boardId", dto.getNoticeId());
			map.put("savedFileNames", centerService.getBoardImageNames("notice", Integer.parseInt(boardNum)));
			
		} else if(type.equals("helpdesk")) {
			HelpdeskDTO dto = new HelpdeskDTO();
			dto = centerService.getHelpdeskPostByBoardNum(Integer.parseInt(boardNum));
			map.put("author", dto.getMemberId());
			map.put("title", dto.getHelpdeskTitle());
			map.put("content", dto.getHelpdeskContent());
			map.put("lockState", dto.isLockState());
			map.put("boardId", dto.getHelpdeskId());
			map.put("savedFileNames", centerService.getBoardImageNames("helpdesk", Integer.parseInt(boardNum)));
		}
		
		model.addAttribute("board", map);
		model.addAttribute("formAction", "updateSubmit");
		model.addAttribute("updateBoard", "show");
		
		return result;
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/updateSubmit")
	public String updateSubmit(@Valid BoardForm form, Errors error, RedirectAttributes redi) throws IOException {
		log.info("실행");
		log.info(form.toString());
		
		if(error.hasErrors()) {
			log.info("유효성 검사 실패");
			FieldError fieldError = error.getFieldError("title");
			if(fieldError != null) {
				redi.addFlashAttribute("isAlert", true);
				redi.addFlashAttribute("alert", fieldError.getDefaultMessage());
			}
			fieldError = error.getFieldError("boardType");
			if(fieldError != null) {
				redi.addFlashAttribute("isAlert", true);
				redi.addFlashAttribute("alert", fieldError.getDefaultMessage());
			}
			return "redirect:/center/addBoard?type="+form.getBoardType();
		}
		
		if(form.getBoardType().equals("notice")) {
			NoticeDTO dto = new NoticeDTO();
			dto.setMemberId(form.getMemberId());
			dto.setNoticeTitle(form.getTitle());
			dto.setNoticeContent(form.getContent());
			dto.setNoticeId(form.getBoardId());
			dto.setNoticeDatetime(form.getDatetime());
			centerService.updateNotice(dto);
			
			List<NoticeDTO> imageList = new ArrayList<>();
			for(MultipartFile mf : form.getAttach()) {
				if(!mf.isEmpty()) {
					NoticeDTO image = new NoticeDTO();
					image.setImageOriginalName(mf.getOriginalFilename());
					image.setImageType(mf.getContentType());
					image.setImageData(mf.getBytes());
					image.setNoticeId(dto.getNoticeId());
					image.setMemberId(dto.getMemberId());
					imageList.add(image);
				}
			}

			if(!imageList.isEmpty()) {
				centerService.insertNoticeImages(imageList);
			}
		} else if(form.getBoardType().equals("helpdesk")) {
			HelpdeskDTO dto = new HelpdeskDTO();
			dto.setMemberId(form.getMemberId());
			dto.setHelpdeskTitle(form.getTitle());
			dto.setLockState(form.isLockState());
			dto.setHelpdeskContent(form.getContent());
			dto.setHelpdeskId(form.getBoardId());
			dto.setHelpdeskDatetime(form.getDatetime());
			centerService.updateHelpdesk(dto);
			
			List<HelpdeskDTO> imageList = new ArrayList<>();
			for(MultipartFile mf : form.getAttach()) {
				if(!mf.isEmpty()) {
					HelpdeskDTO image = new HelpdeskDTO();
					image.setImageOriginalName(mf.getOriginalFilename());
					image.setImageType(mf.getContentType());
					image.setImageData(mf.getBytes());
					image.setHelpdeskId(dto.getHelpdeskId());
					image.setMemberId(dto.getMemberId());
					imageList.add(image);
				}
			}

			if(!imageList.isEmpty()) {
				centerService.insertHelpdeskImages(imageList);
			}
		}
		
		return "redirect:/center/detail?type="+form.getBoardType()+"&boardNum="+form.getBoardId();
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/removeImage")
	public void deleteImageForAjax(
			@RequestParam String imageName, 
			@RequestParam("boardId")int boardId, 
			@RequestParam String boardType,
			HttpServletResponse res) throws IOException {
		log.info("실행");
		log.info("삭제할 imageName: "+imageName);
		Map<String, Object> map = new HashMap<>();
		map.put("imageOriginalName", imageName);
		map.put("boardId", boardId);
		map.put("boardType", boardType);
		
		JSONObject json = new JSONObject();
		if(centerService.deleteImage(map)) {
			json.put("result", "ok");
		} else {
			json.put("result", "notFoundImage");
		}
		
		res.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();
	}
	 
	@GetMapping("/boardSearch")
	public String getBoardSearch(
			@RequestParam(value = "type", defaultValue = "notice")String type,
			@RequestParam(value = "searchType", defaultValue = "")String searchType,
			@RequestParam(value="boardKeyword", defaultValue="") String boardKeyword,
			Model model,
			@RequestParam(defaultValue="1") int pageNo
			) throws Exception{
		    
			Pager pager = new Pager(10, 5, 0, pageNo); 
		    pager.setSearchType(searchType);
		    pager.setBoardKeyword(boardKeyword);
		    int totalRows = centerService.getBoardSearchCount(type, pager);
	
		    
		    pager = new Pager(10, 5, totalRows, pageNo);
		    pager.setSearchType(searchType);
		    pager.setBoardKeyword(boardKeyword);
		    pager.setTotalRows(totalRows);



	    String[] elNames = {"active", "title", "breadcrumb", "boardType", "boardAllCount"};

	    if (type != null && type.equals("helpdesk")) {
	        String[] data = {"helpdesk", "문의사항", "문의사항", "helpdesk", Integer.toString(totalRows)};
	        List<HelpdeskDTO> dto = centerService.getHelpdeskSearch(pager);
	        model.addAttribute("boardList", dto);
	        for (int i = 0; i < elNames.length; i++) {
	            model.addAttribute(elNames[i], data[i]);
	        }
	    } else {
	        String[] data = {"notice", "공지사항", "공지사항", "notice", Integer.toString(totalRows)};
	        List<NoticeDTO> dto = centerService.getNoticeSearch(pager);
	        model.addAttribute("boardList", dto);
	        for (int i = 0; i < elNames.length; i++) {
	            model.addAttribute(elNames[i], data[i]);
	        }
	    }

	    model.addAttribute("boardType", type);
	    model.addAttribute("pager", pager);
	    model.addAttribute("boardAllCount", totalRows);

	    log.info("totalRows: " + totalRows);

	    return "center/boardList";
		
		

		}
	
	 
}
