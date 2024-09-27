package com.mycompany.miniproject.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.mycompany.miniproject.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccessHandler 
	 extends SavedRequestAwareAuthenticationSuccessHandler{
	@Autowired OrderService orderService;
	@Autowired RequestCache requestCache;
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) 
					throws ServletException, IOException {
		
		log.info("로그인 성공!!!!!!!!!!!!!!!!!!!!!");
		HttpSession session = request.getSession();
		int cartCount = orderService.getCartItemCount(authentication.getName());
		session.setAttribute("commonCartCount", cartCount);
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);

	    if (savedRequest == null || "POST".equals(savedRequest.getMethod())) {
	    	response.sendRedirect(request.getContextPath());
	        return;
	    } else {
	        super.onAuthenticationSuccess(request, response, authentication);
	    }
	}

}
