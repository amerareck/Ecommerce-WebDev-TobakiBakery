package com.mycompany.miniproject.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.mycompany.miniproject.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccessHandler 
	 extends SavedRequestAwareAuthenticationSuccessHandler{
	@Autowired
	OrderService orderService;
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) 
					throws ServletException, IOException {
		log.info("로그인 성공!!!!!!!!!!!!!!!!!!!!!");
		HttpSession session = request.getSession();
		if(session.getAttribute("commonCartCount") != null) {
			super.onAuthenticationSuccess(request, response, authentication);
		}
		int cartCount = orderService.getCartItemCount(authentication.getName());
		session.setAttribute("commonCartCount", cartCount);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
