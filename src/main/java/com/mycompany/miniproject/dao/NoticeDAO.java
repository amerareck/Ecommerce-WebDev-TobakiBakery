package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.NoticeDTO;
import com.mycompany.miniproject.dto.Pager;

@Mapper
public interface NoticeDAO {
	public int insertNoticePost(NoticeDTO dto);

	public int selectNoticeSequence();

	public int getRecentNoticeId(String memberId);

	public NoticeDTO selectNoticeSingleRow(int boardNum);

	public int selectBoardAllCount();

	public List<NoticeDTO> selectNoticeList(Pager pager);

	public int updateNotice(NoticeDTO dto);

	public int deleteBoard(int boardIndex);
}
