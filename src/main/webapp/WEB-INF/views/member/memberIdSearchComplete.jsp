<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search-style.css">
  <!-- 아이디 찾기 폼 컨테이너 시작 -->
  <div class="form-container">
      <form>
          <!-- 안내 문구 시작 -->
          <h2>입력하신 정보와 일치하는 아이디입니다.</h2>
          <!-- 안내 문구 끝 -->

          <br><br>

          <!-- 아이디 공개 시작 -->
          <div class="username">
              <h1>hgd1***</h1>
          </div>
          <!-- 아이디 공개 끝 끝 -->

          <br><br>

          <!-- 추가 안내 문구 시작 -->
          <p class="info">고객님의 소중한 개인정보 보호를 위해 아이디 일부는 숨김 처리되어 안내됩니다.</p>
          <!-- 추가 안내 문구 끝 -->

          <br>

          <!-- 확인 버튼 시작 -->
          <a class="btn btn-dark" href="${pageContext.request.contextPath}/member/login">로그인</a>
          <a class="btn btn-secondary" href="${pageContext.request.contextPath}/member/memberSearch?search=pw">비밀번호 찾기</a>
          <!-- 확인 버튼 끝 -->
          
          <br>
      </form>
  </div>