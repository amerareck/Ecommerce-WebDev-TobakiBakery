package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.CommentDTO;
import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;

@Mapper
public interface CommentDAO {

	public List<CommentDTO> selectNoticeCommentList(NoticeDTO dto);

	public List<CommentDTO> selectHelpdeskCommentList(HelpdeskDTO dto);

	public int insertNoticeComment(CommentDTO comment);
	public int insertHelpdeskComment(CommentDTO comment);

	public CommentDTO selectNoticeCommentSingle(CommentDTO comment);
	public CommentDTO selectHelpdeskCommentSingle(CommentDTO comment);

	public int selectRecentCommentId(CommentDTO comment);

	public int getCommentCountByNotice(NoticeDTO ele);
	public int getCommentCountByHelpdesk(HelpdeskDTO ele);

	public int deleteCommentByNotice(CommentDTO comment);
	public int deleteCommentByHelpdesk(CommentDTO comment);

	public int selectAdminCommentCountByHelpdesk(HelpdeskDTO ele);
	
}
