package com.mycompany.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.CenterImageDAO;
import com.mycompany.miniproject.dao.HelpdeskDAO;
import com.mycompany.miniproject.dao.NoticeDAO;
import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;

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
		dto.setNoticeId(noticeDAO.getRecentNoticeId(dto.getMemberId()));
		if (dto.getImageOriginalName() != null) {
			imageDAO.insertNoticeImage(dto);
		}
	}
	
	public void insertHelpdeskPost(HelpdeskDTO dto) {
		log.info("실행");
		helpdeskDAO.insertHelpdeskPost(dto);
		dto.setHelpdeskId(helpdeskDAO.getRecentHelpdeskId(dto.getMemberId()));
		if (dto.getImageOriginalName() != null) {
			imageDAO.insertHelpdeskImage(dto);
		}
	}

	public NoticeDTO getBoardByBoardNum(int boardNum) {
		return noticeDAO.selectNoticeSingleRow(boardNum);
	}

	public List<String> getBoardImageNames(int noticeId) {
		return imageDAO.selectBoardImageNames(noticeId);
	}

	public HelpdeskDTO getImage(HelpdeskDTO dto) {
		return imageDAO.selectBoardImage(dto);
	}
	
	public NoticeDTO getImage(NoticeDTO dto) {
		return imageDAO.selectBoardImage(dto);
	}
	
}
