package com.mycompany.miniproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.NoticeDTO;

@Mapper
public interface CenterImageDAO {
	public int insertNoticeImage(NoticeDTO dto);
}
