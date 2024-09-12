package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;

@Mapper
public interface CenterImageDAO {
	public int insertNoticeImage(NoticeDTO dto);
	public int insertHelpdeskImage(HelpdeskDTO dto);
	public NoticeDTO selectBoardImageFromNotice(NoticeDTO dto);
	public HelpdeskDTO selectBoardImageFromHelpdesk(HelpdeskDTO dto);

	public List<String> selectBoardImageNamesFromNotice(int condition);
	public List<String> selectBoardImageNamesFromHelpdesk(int condition);
}
