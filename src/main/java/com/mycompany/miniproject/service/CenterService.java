package com.mycompany.miniproject.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CenterImageDAO;
import com.mycompany.miniproject.dao.CommentDAO;
import com.mycompany.miniproject.dao.HelpdeskDAO;
import com.mycompany.miniproject.dao.NoticeDAO;
import com.mycompany.miniproject.dto.CommentDTO;
import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;
import com.mycompany.miniproject.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CenterService {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private HelpdeskDAO helpdeskDAO;
	@Autowired
	private CenterImageDAO imageDAO;
	@Autowired
	private CommentDAO commentDAO;
	
	public int insertNoticePost(NoticeDTO dto) {
		log.info("실행");
		noticeDAO.insertNoticePost(dto);
		return noticeDAO.getRecentNoticeId(dto.getMemberId());
	}
	
	public void insertNoticeImages(List<NoticeDTO> imageList) {
		log.info("실행");
		for(NoticeDTO dto : imageList) {
			imageDAO.insertNoticeImage(dto);
		}
	}
	
	public int insertHelpdeskPost(HelpdeskDTO dto) {
		log.info("실행");
		dto.setLockStateNum(dto.isLockState() ? 1 : 0);
		helpdeskDAO.insertHelpdeskPost(dto);
		return helpdeskDAO.getRecentHelpdeskId(dto.getMemberId());
	}
	
	public void insertHelpdeskImages(List<HelpdeskDTO> imageList) {
		log.info("실행");
		for(HelpdeskDTO dto : imageList) {
			imageDAO.insertHelpdeskImage(dto);
		}
	}

	public NoticeDTO getNoticePostByBoardNum(int boardNum) {
		return noticeDAO.selectNoticeSingleRow(boardNum);
	}
	
	public HelpdeskDTO getHelpdeskPostByBoardNum(int boardNum) {
		return helpdeskDAO.selectHelpdeskSingleRow(boardNum);
	}
	
	public void increaseBoardViews(String type, int boardNum) {
		log.info("실행");
		if (type.equals("notice")) {
			noticeDAO.updateNoticeViews(boardNum);
		} else if (type.equals("helpdesk")) {
			helpdeskDAO.updateHelpdeskViews(boardNum);
		} else {
			log.info("조회수 증가 안됨");
		}
	}

	public List<String> getBoardImageNames(String type, int condition) {
		if(type.equals("notice")) {
			return imageDAO.selectBoardImageNamesFromNotice(condition);
		} else {
			return imageDAO.selectBoardImageNamesFromHelpdesk(condition);
		}
	}

	public HelpdeskDTO getImage(HelpdeskDTO dto) {
		return imageDAO.selectBoardImageFromHelpdesk(dto);
	}
	
	public NoticeDTO getImage(NoticeDTO dto) {
		return imageDAO.selectBoardImageFromNotice(dto);
	}

	public int getBoardAllCount(String type) {
		if(type.equals("notice")) {
			return noticeDAO.selectBoardAllCount();
		} else if(type.equals("helpdesk")) {
			return helpdeskDAO.selectBoardAllCount();
		}
		return 0;
	}

	public List<NoticeDTO> getNoticeList(Pager pager) {
		List<NoticeDTO> result = noticeDAO.selectNoticeList(pager);
		long threeDaysInMillis = 3L * 24 * 60 * 60 * 1000;
		for(NoticeDTO ele : result) {
			ele.setCommentCount(commentDAO.getCommentCountByNotice(ele));
			long differenceInMillis = Math.abs(new Date().getTime() - ele.getNoticeDatetime().getTime());
			ele.setNewBadge(differenceInMillis < threeDaysInMillis);
		}
		return result;
	}
	
	public List<HelpdeskDTO> getHelpdeskList(Pager pager) {
		List<HelpdeskDTO> result = helpdeskDAO.selectHelpdeskList(pager);
		long threeDaysInMillis = 3L * 24 * 60 * 60 * 1000;
		for(HelpdeskDTO ele : result) {
			ele.setCommentCount(commentDAO.getCommentCountByHelpdesk(ele));
			long differenceInMillis = Math.abs(new Date().getTime() - ele.getHelpdeskDatetime().getTime());
			ele.setNewBadge(differenceInMillis < threeDaysInMillis);
			ele.setAdminReply(commentDAO.selectAdminCommentCountByHelpdesk(ele) > 0);
		}
		return result;
	}

	public boolean deleteImage(Map<String, Object> map) {
		String type = (String) map.get("boardType");
		if(type.equals("notice")) {
			int res = imageDAO.deleteImageFromNotice(map);
			log.info(""+res);
			return res == 1;
		} else if(type.equals("helpdesk")) {
			return imageDAO.deleteImageFromHelpdesk(map) == 1;
		}
		return false;
	}

	public void updateHelpdesk(HelpdeskDTO dto) {
		helpdeskDAO.updateHelpdesk(dto);
	}

	public void updateNotice(NoticeDTO dto) {
		noticeDAO.updateNotice(dto);
	}

	public boolean removeBoard(String boardType, int boardIndex) {
		List<String> names = getBoardImageNames(boardType, boardIndex);
		Map<String, Object> map = new HashMap<>();
		
		if(boardType.equals("notice")) {
			for(String name : names) {
				map.put("imageOriginalName", name);
				map.put("boardId", boardIndex);
				imageDAO.deleteImageFromNotice(map);
			}
			return noticeDAO.deleteBoard(boardIndex) == 1;
			
		} else if(boardType.equals("helpdesk")) {
			for(String name : names) {
				map.put("imageOriginalName", name);
				map.put("boardId", boardIndex);
				imageDAO.deleteImageFromHelpdesk(map);
			}
			return helpdeskDAO.deleteBoard(boardIndex) == 1;
			
		} else {
			log.info("타입이 없거나 옳지 않은 boardType");
			return false;
		}
	}

	public List<HelpdeskDTO> getHelpdeskSubList(int helpdeskId) {
		List<HelpdeskDTO> list = helpdeskDAO.selectHelpdeskSubList(helpdeskId);
		long threeDaysInMillis = 3L * 24 * 60 * 60 * 1000;
		for(HelpdeskDTO ele : list) {
			ele.setCommentCount(commentDAO.getCommentCountByHelpdesk(ele));
			long differenceInMillis = Math.abs(new Date().getTime() - ele.getHelpdeskDatetime().getTime());
			ele.setNewBadge(differenceInMillis < threeDaysInMillis);
			ele.setAdminReply(commentDAO.selectAdminCommentCountByHelpdesk(ele) > 0);
		}
		log.info(list.toString());
		return list;
	}
	
	public List<NoticeDTO> getNoticeSubList(int noticeId) {
		List<NoticeDTO> list = noticeDAO.selectNoticeSubList(noticeId);
		long threeDaysInMillis = 3L * 24 * 60 * 60 * 1000;
		for(NoticeDTO ele : list) {
			ele.setCommentCount(commentDAO.getCommentCountByNotice(ele));
			long differenceInMillis = Math.abs(new Date().getTime() - ele.getNoticeDatetime().getTime());
			ele.setNewBadge(differenceInMillis < threeDaysInMillis);
		}
		return list;
	}

	public List<CommentDTO> getCommentList(HelpdeskDTO dto) {
		return commentDAO.selectHelpdeskCommentList(dto);
	}
	
	public List<CommentDTO> getCommentList(NoticeDTO dto) {
		return commentDAO.selectNoticeCommentList(dto);
	}
	
	public List<HelpdeskDTO> getInquiriesByMemberId(String memberId) {
		 	log.info("이거 서비스인데 실행되나?");
	        return helpdeskDAO.selectInquiriesByMemberId(memberId);
	    }

	public int addComment(CommentDTO comment) {
		if(comment.getBoardType().equals("notice")) {
			if(commentDAO.insertNoticeComment(comment) == 1) {
				return commentDAO.selectRecentCommentId(comment);
			}
		} else if (comment.getBoardType().equals("helpdesk")) {
			if(commentDAO.insertHelpdeskComment(comment) == 1) {
				return commentDAO.selectRecentCommentId(comment);
			}
		}
		return 0;
	}

	public CommentDTO getCommentSingleData(CommentDTO comment) {
		if(comment.getBoardType().equals("notice")) {
			return commentDAO.selectNoticeCommentSingle(comment);
		} else if (comment.getBoardType().equals("helpdesk")) {
			return commentDAO.selectHelpdeskCommentSingle(comment);
		}
		return null;
	}

	public boolean removeComment(CommentDTO comment) {
		if(comment.getBoardType().equals("notice")) {
			return commentDAO.deleteCommentByNotice(comment) == 1;
		} else if(comment.getBoardType().equals("helpdesk")) {
			return commentDAO.deleteCommentByHelpdesk(comment) == 1;
		}
		return false;
	}

	public boolean checkAuthorOfComment(CommentDTO comment, String memberId) {
		CommentDTO comp = getCommentSingleData(comment);
		return comp.getMemberId().equals(memberId);
	}
	
}
