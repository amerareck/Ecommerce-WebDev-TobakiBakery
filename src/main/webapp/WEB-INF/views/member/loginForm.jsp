<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-style.css">
  <div class="container">
      <!-- 네비게이션 시작 -->
      <nav class="breadcrumb">
          <a class="breadcrumb-item" href="../"><i class="fas fa-home"></i></a>
          <a class="breadcrumb-item" href="${pageContext.request.contextPath}/resources/member/login">로그인</a>
      </nav>
      <!-- 네비게이션 끝 -->

      <br>

      <!-- 로그인 섹션 시작 -->
      <div class="login-section text-center">
          <h1><b>로그인</b></h1>
          <br>
          <br>
          <h3><b>회원 로그인</b></h3>
          
          <!-- 로그인 폼 시작 -->
          <form method="post" class="mt-4" action="${pageContext.request.contextPath}/login">  
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 	           <div class="form-group"> 
                  <input type="text" class="form-control" name="memberId" placeholder=" 아이디" required>
                  <form:errors class="text-danger"  path="memberDTO.memberId"/>
              </div>
              <div class="form-group">
                  <input type="password" class="form-control" name="memberPassword" placeholder=" 비밀번호" required>
                  <form:errors class="text-danger" path="memberDTO.memberPassword"/>
              </div>
              <button class="btn btn-dark btn-block login-button" >로그인</button>
          </form>
          <!-- 로그인 폼 끝 -->

          <!-- 아이디/비밀번호 찾기 링크 시작 -->
          <div class="links mt-3">
              <a href="${pageContext.request.contextPath}/member/memberSearchForm?search=id" class="text-dark"><i class="fas fa-search"></i> 아이디 찾기</a> / 
              <a href="${pageContext.request.contextPath}/member/memberSearchForm?search=pw" class="text-dark">비밀번호 찾기</a>
          </div>
          <!-- 아이디/비밀번호 찾기 링크 끝 -->

      </div>
      <!-- 로그인 섹션 끝 -->

      <br>
      <br>

      <!-- 회원가입 섹션 시작 -->
      <div class="signup-section mt-4 p-5 border">
          <div class="signup-text">
              <h3><b>토박이 베이커리 회원가입</b></h3>
              <p>토박이 베이커리 회원이 되시면 맛있는 베이커리가 기다리고 있습니다.</p>
          </div>
          <div class="signup-button">
              <a class="btn btn btn-dark" href="../member/memberInfo">회원가입</a>
          </div>
      </div>
      <!-- 회원가입 섹션 끝 -->
  </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>