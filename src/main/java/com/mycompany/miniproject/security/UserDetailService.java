package com.mycompany.miniproject.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.miniproject.dao.MemberDAO;
import com.mycompany.miniproject.dto.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserDetailService implements UserDetailsService{
	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
		
		MemberDTO member = memberDao.selectMemberForLogin(username);
		
		
		if(member == null) {
			throw new UsernameNotFoundException("Bad username.");
		}
		log.info("실행");
		List<GrantedAuthority> authorities = new ArrayList<>(); 
		log.info("제발"+member.getMemberRole());
		authorities.add(new SimpleGrantedAuthority(member.getMemberRole()));
		
		UserDetails userDetails = new MemberDetails(member, authorities);
		
		
		return userDetails;
	}
	
	
}
