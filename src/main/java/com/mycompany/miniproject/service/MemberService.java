package com.mycompany.miniproject.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		member.setMemberRole(MemberRole.USER.toString());
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
	
	public String getMemberIdSearch(MemberDTO member) {
		log.info("실행");
		String memberSearchId = memberDao.searchMemberId(member);
		
		return memberSearchId;
	}
	
	
	public String memberTokne() {
		log.info("실행");

		Random random = new Random();

		int randomNum = (int) (Math.random() * 1000000);		
		String pwTokenNum = Integer.toString(randomNum);
		
	    StringBuilder pwTokenStr = new StringBuilder();
	        for (int i = 0; i < 2; i++) {
	            int randomAlpha = random.nextInt(52); 
	            char pwAlaph;
	            if (randomAlpha < 26) {
	            	pwAlaph = (char) ('A' + randomAlpha); 
	            } else {
	            	pwAlaph = (char) ('a' + (randomAlpha - 26)); 
	            }
	            pwTokenStr.append(pwAlaph);
	        }
	    
	    String token = pwTokenNum + pwTokenStr;
	    
	    List<Character> tokenList = new ArrayList<>();
	    for (char c : token.toCharArray()) {
	    	tokenList.add(c);
	    }
	    
	    Collections.shuffle(tokenList);
	    
	    StringBuilder shuffleToken = new StringBuilder();
	    for (char c : tokenList) {
	    	shuffleToken.append(c);
	    }
	    
	    String pwToken = shuffleToken.toString();
		log.info(pwToken);

			
		return pwToken;
		
	}
	
	
	public int getMemberPwSearch(MemberDTO member, String memberPwToken) {
		log.info("실행");
	
		 log.info("임시 번호: " + memberPwToken);
		 PasswordEncoder passwordEncoder = 
					PasswordEncoderFactories.createDelegatingPasswordEncoder();
		 String encodedPassword = passwordEncoder.encode(memberPwToken);
		 member.setMemberPassword(encodedPassword);

	    
		int memberPw = memberDao.updateMemberPwToken(member);
		log.info("암호화 번호: "  + encodedPassword);	
		
		return memberPw;
	}
	
}
