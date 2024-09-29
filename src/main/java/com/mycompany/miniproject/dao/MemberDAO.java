package com.mycompany.miniproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.miniproject.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	public  int insertMember(MemberDTO member);

	public MemberDTO selectMemberId(String mid);

	public MemberDTO selectMemberEmail(String memberEmail);

	public MemberDTO selectMemberInfo(String memberId);

	public int updateMember(MemberDTO member);

	public MemberDTO selectMemberForLogin(String memberId);

	public String searchMemberId(MemberDTO member);

	public int updateMemberPwToken(MemberDTO member);

	public int disableMember(MemberDTO member);

	public MemberDTO selectMemberForDeleteMember(String memberId);

	public MemberDTO searchMemberForPw(MemberDTO member);

	/*public boolean hasPurchasedProduct(String memberId, int productId) {
	    
	    return sqlSession.selectOne("myPage.hasPurchasedProduct", Map.of("memberId", memberId, "productId", productId));
	}

	public void insertReview(ProductReviewDTO reviewDTO) {
	    sqlSession.insert("myPage.insertReview", reviewDTO);
	}*/

}
