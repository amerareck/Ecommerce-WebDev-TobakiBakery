package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;

@Mapper
public interface CenterImageDAO {
	public int insertNoticeImage(NoticeDTO dto);

	public int insertHelpdeskImage(HelpdeskDTO dto);

	public List<String> selectBoardImageNames(int noticeId);

	public NoticeDTO selectBoardImage(NoticeDTO dto);

	public HelpdeskDTO selectBoardImage(HelpdeskDTO dto);
}
