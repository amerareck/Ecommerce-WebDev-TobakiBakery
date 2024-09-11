package com.mycompany.miniproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.HelpdeskDTO;

@Mapper
public interface HelpdeskDAO {

	public int insertHelpdeskPost(HelpdeskDTO dto);
	public int getRecentHelpdeskId(String memberId);
}
