<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<hr class="hr" />
	
	<div class="container">
        <div class="main-content">
			<%@include file="/WEB-INF/views/admin/adminSidebar.jsp" %>
            <!-- 메인 섹션 시작 -->
            <section class="content">
                <h2>관리 페이지</h2>
                <div class="d-flex profile-info mt-3">
                    <div>
                        <p>관리자님 환영합니다.</p>
                        <p>마지막 로그인: YYYY-MM-DD hh:mi:ss</p>
                    </div>
                    <c:if test="${isSearchPage}" >
                    	<div class="flex-fill text-center">
	                        <p>총 검색 갯수</p>
	                        <p><strong>${searchProductCount}</strong> 개</p>
                    	</div>
                    </c:if>
                    <c:if test="${!isSearchPage}">
                    	<div class="flex-fill text-center">
	                        <p>총 상품 갯수</p>
	                        <p><strong>${allCount}</strong> 개</p>
	                    </div>
                    </c:if>
                    <div class="flex-fill text-center">
                        <p>총 주문 갯수</p>
                        <p><strong>4</strong> 개</p>
                    </div>
                </div>
                <hr class="hr my-4"/>
					<%-- 상품목록 리스트 호출  --%>

					<%-- 주문목록 리스트 호출  --%>