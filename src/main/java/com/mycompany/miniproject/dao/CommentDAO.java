package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.CommentDTO;

@Mapper
public interface CommentDAO {

	public List<CommentDTO> selectNoticeCommentList(int boardId);

	public List<CommentDTO> selectHelpdeskCommentList(int boardId);
	
}
