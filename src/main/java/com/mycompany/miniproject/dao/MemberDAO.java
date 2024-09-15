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
	
	
}
