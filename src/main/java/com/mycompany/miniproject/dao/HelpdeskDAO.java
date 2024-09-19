package com.mycompany.miniproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.CommentDTO;
import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.Pager;

@Mapper
public interface HelpdeskDAO {

	public int insertHelpdeskPost(HelpdeskDTO dto);
	public int getRecentHelpdeskId(String memberId);
	public int selectBoardAllCount();
	public HelpdeskDTO selectHelpdeskSingleRow(int boardNum);
	public List<HelpdeskDTO> selectHelpdeskList(Pager pager);
	public int updateHelpdesk(HelpdeskDTO dto);
	public int deleteBoard(int boardIndex);
	public List<HelpdeskDTO> selectHelpdeskSubList(int helpdeskId);
	public int updateHelpdeskViews(int boardNum);
}
