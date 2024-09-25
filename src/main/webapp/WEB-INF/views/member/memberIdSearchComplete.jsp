<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search-style.css">
  <!-- 아이디 찾기 폼 컨테이너 시작 -->
  <div class="form-container">
      <form>

      	<c:if test="${searchMemberId !='NO'}">
		    <!-- 안내 문구 시작 -->
		    <h2>입력하신 정보와 일치하는 아이디입니다.</h2>
		    <!-- 안내 문구 끝 -->
		</c:if>
		    <br><br>
		
		<c:if test="${searchMemberId == 'NO'}">
		    <!-- 아이디 공개 시작 -->
		    <div class="username">
		        	  <h2 class="text-danger" >입력하신 정보와 일치하는 아이디가 없습니다!</h2>
		    </div>
		    <!-- 아이디 공개 끝 -->
		</c:if>


		<c:if test="${searchMemberId != 'NO'}">
		    <!-- 아이디 공개 시작 -->
		    <div class="username">
		        <h1>${searchMemberId}</h1>
		    </div>
		    <!-- 아이디 공개 끝 -->
		</c:if>
          <br><br>

          <!-- 추가 안내 문구 시작 -->
          <p class="info">고객님의 소중한 개인정보 보호를 위해 아이디 일부는 숨김 처리되어 안내됩니다.</p>
          <!-- 추가 안내 문구 끝 -->

          <br>

          <!-- 확인 버튼 시작 -->
          <a class="btn btn-dark" href="${pageContext.request.contextPath}/member/loginForm">로그인</a>
          <a class="btn btn-secondary" href="${pageContext.request.contextPath}/member/memberSearchForm?type=pwSearch">비밀번호 찾기</a>
          <!-- 확인 버튼 끝 -->
          
          <br>
      </form>
  </div>