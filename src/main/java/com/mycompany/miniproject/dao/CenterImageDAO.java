package com.mycompany.miniproject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.HelpdeskDTO;
import com.mycompany.miniproject.dto.NoticeDTO;
import com.mycompany.miniproject.dto.ProductReviewDTO;

@Mapper
public interface CenterImageDAO {
	public int insertNoticeImage(NoticeDTO dto);
	public int insertHelpdeskImage(HelpdeskDTO dto);
	public NoticeDTO selectBoardImageFromNotice(NoticeDTO dto);
	public HelpdeskDTO selectBoardImageFromHelpdesk(HelpdeskDTO dto);
	public ProductReviewDTO selectBoardImageFromProductReview(ProductReviewDTO dto);

	public List<String> selectBoardImageNamesFromNotice(int condition);
	public List<String> selectBoardImageNamesFromHelpdesk(int condition);
	public int deleteImageFromNotice(Map<String, Object> map);
	public int deleteImageFromHelpdesk(Map<String, Object> map);
	public List<String> selectBoardImageNamesFromProductReview(int condition);
}
