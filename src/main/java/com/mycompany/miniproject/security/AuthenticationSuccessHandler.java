package com.mycompany.miniproject.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccessHandler 
	// 로그인 성공시 사용자가 요청한 페이지로 이동
	 extends SavedRequestAwareAuthenticationSuccessHandler{
	// 로그인 성공시 지정한 페이지로 이동
	//extends SimpleUrlAuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) 
					throws ServletException, IOException {
		log.info("성공!!!!!!!!!!!!!!!!!!!!!");
		//extends SimpleUrlAuthenticationSuccessHandler를 사용할 경우
		//setDefaultTargetUrl("/"); 기본 url : 성공시 이동 경로
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
