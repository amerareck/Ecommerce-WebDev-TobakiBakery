package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CenterImageDAO;
import com.mycompany.miniproject.dao.HelpdeskDAO;
import com.mycompany.miniproject.dao.NoticeDAO;
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
	
	public void insertNoticePost(NoticeDTO dto) {
		log.info("실행");
		noticeDAO.insertNoticePost(dto);
	}
	
	public void insertNoticeImages(List<NoticeDTO> imageList) {
		log.info("실행");
		for(NoticeDTO dto : imageList) {
			dto.setNoticeId(noticeDAO.getRecentNoticeId(dto.getMemberId()));
			imageDAO.insertNoticeImage(dto);
		}
	}
	
	public void insertHelpdeskPost(HelpdeskDTO dto) {
		log.info("실행");
		helpdeskDAO.insertHelpdeskPost(dto);
	}
	
	public void insertHelpdeskImages(List<HelpdeskDTO> imageList) {
		log.info("실행");
		for(HelpdeskDTO dto : imageList) {
			dto.setHelpdeskId(helpdeskDAO.getRecentHelpdeskId(dto.getMemberId()));
			imageDAO.insertHelpdeskImage(dto);
		}
	}

	public NoticeDTO getNoticePostByBoardNum(int boardNum) {
		return noticeDAO.selectNoticeSingleRow(boardNum);
	}
	
	public HelpdeskDTO getHelpdeskPostByBoardNum(int boardNum) {
		return helpdeskDAO.selectHelpdeskSingleRow(boardNum);
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
		return noticeDAO.selectNoticeList(pager);
	}
	
	public List<HelpdeskDTO> getHelpdeskList(Pager pager) {
		return helpdeskDAO.selectHelpdeskList(pager);
	}
	
}
