package com.mycompany.miniproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.MemberDAO;
import com.mycompany.miniproject.dto.MemberDTO;
import com.mycompany.miniproject.type.JoinResult;
import com.mycompany.miniproject.type.LoginResult;
import com.mycompany.miniproject.type.MemberRole;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	
	@Autowired
	private MemberDAO memberDao;
	
	public JoinResult join(MemberDTO member) {
		log.info("실행");
		boolean exist = isMemberId(member.getMemberId());
		if(exist) {
			return JoinResult.FAIL_DUPLICATED_MEMBERID;
		}
		member.setMemberRole(MemberRole.ROLE_USER.toString());
		memberDao.insertMember(member);
		return JoinResult.SUCCESS;
	}
	
	public boolean isMemberId(String memberId) {
		log.info("실행");
		MemberDTO member = memberDao.selectMemberId(memberId);
		if(member==null) {
			return false;
		}else {
			return true;
		}
		
	}
	
	public boolean isMemberEmail(String memberEmail) {
		log.info("실행");
		MemberDTO member = memberDao.selectMemberEmail(memberEmail);
		if(member==null) {
			return false;
		}else {
			return true;
		}
		
	}
	
	public MemberDTO getMemberInfo(MemberDTO member) {
		MemberDTO memberInfo = memberDao.selectMemberInfo(member.getMemberId());
		return memberInfo;
	}

	public int updateMember(MemberDTO member) {
		int memberEdit = memberDao.updateMember(member);
		return memberEdit;
	}
	
	public LoginResult login(MemberDTO member) {
		log.info("실행");
		MemberDTO memberLogin = memberDao.selectMemberForLogin(member.getMemberId());
		log.info("멤버 갖고와봐 : " + memberLogin.toString());
		
		if(memberLogin == null) {
			return LoginResult.FAIL_MEMBERID;
		}
		if(!memberLogin.isMemberEnable()) {
			return LoginResult.FAIL_ENABLED;
		}
		if(!memberLogin.getMemberPassword().equals(member.getMemberPassword())) {
			return LoginResult.FAIL_MEMBERPASSWORD;
		}
		return LoginResult.SUCCESS;
	}
	
}
