package com.mycompany.miniproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.NoticeDTO;

@Mapper
public interface NoticeDAO {
	public int insertNotice(NoticeDTO dto);
}
