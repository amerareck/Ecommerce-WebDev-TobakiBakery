package com.mycompany.miniproject.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.miniproject.dto.MemberDTO;

public class MemberDetails extends User{
 
	private MemberDTO member;
	
	public MemberDetails(
			MemberDTO member,
			List<GrantedAuthority> authorities) {
		super(
				member.getMemberId(), 
				member.getMemberPassword(),
				member.isMemberEnable(),
				true, true, true,
				authorities
				);
		
		this.member = member;
		
	}

	public MemberDTO getMember() {
		return member;
	}
	
}
