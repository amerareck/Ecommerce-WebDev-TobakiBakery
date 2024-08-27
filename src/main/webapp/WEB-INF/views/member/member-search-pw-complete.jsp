<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search-style.css">
    <div class="container">
        <!-- 네비게이션 시작 -->
        <nav class="breadcrumb">
            <a class="breadcrumb-item" href="../'"><i class="fas fa-home"></i></a>
            <a class="breadcrumb-item" href="/member-search-pw">비밀번호 찾기</a>
        </nav>
        <!-- 네비게이션 끝 -->

		<br>

        <!-- 컨텐츠 래퍼 시작 -->
        <div class="content-wrapper">
            <h1><b>아이디 찾기 / 비밀번호 찾기</b></h1>
            <br>

            <!-- 탭 메뉴 시작 -->
            <div class="tabs">
                <button class="tab-button" onclick="location.href='../member/member-search-id'">아이디찾기</button>
                <button class="tab-button active" onclick="location.href='../member/member-search-pw'">비밀번호 찾기</button>
            </div>
            <!-- 탭 메뉴 끝 -->

            <br>

            <!-- 아이디 찾기 폼 컨테이너 시작 -->
            <div class="form-container">
                <form>
                    <!-- 안내 문구 시작 -->
                    <h2>입력하신 정보와 일치하는 비밀번호입니다.</h2>
                    <!-- 안내 문구 끝 -->

                    <br><br>

                    <!-- 아이디 공개 시작 -->
                    <div class="username">
                        <h1>Qwer****34!</h1>
                    </div>
                    <!-- 아이디 공개 끝 끝 -->

                    <br><br>

                    <!-- 추가 안내 문구 시작 -->
                    <p class="info">고객님의 소중한 개인정보 보호를 위해 비밀번호 일부는 숨김 처리되어 안내됩니다.</p>
                    <!-- 추가 안내 문구 끝 -->

                    <br>

                    <!-- 확인 버튼 시작 -->
                    <button type="check" class="btn btn-dark" onclick="location.href='../member/login'">로그인</button>
                    <!-- 확인 버튼 끝 -->
                    
                    <br>
                </form>
            </div>
            <!-- 아이디 찾기 폼 컨테이너 끝 -->
        </div>
        <!-- 컨텐츠 래퍼 끝 -->
    </div>
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>