package com.mycompany.miniproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.NoticeDTO;

@Mapper
public interface NoticeDAO {
	public int insertNoticePost(NoticeDTO dto);

	public int selectNoticeSequence();

	public int getRecentNoticeId(String memberId);

	public NoticeDTO selectNoticeSingleRow(int boardNum);
}
