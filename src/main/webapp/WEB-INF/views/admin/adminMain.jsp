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
                    <div class="flex-fill text-center">
                        <p>총 상품 갯수</p>
                        <p><strong>10</strong> 개</p>
                    </div>
                    <div class="flex-fill text-center">
                        <p>총 주문 갯수</p>
                        <p><strong>4</strong> 개</p>
                    </div>
                </div>
                <hr class="hr my-4"/>
                
				<c:if test="${listType == 'product'}" >
					<%-- 상품목록 리스트 호출  --%>
					<%@include file="/WEB-INF/views/admin/adminProductList.jsp" %>
				</c:if>
				<c:if test="${listType == 'order'}" >
					<%-- 주문목록 리스트 호출  --%>
					<%@include file="/WEB-INF/views/admin/adminOrderList.jsp" %>
				</c:if>

                <hr class="hr my-5"/>

            </section>
            <!-- 메인 섹션 종료 -->
			<c:if test="${listType == 'product'}" >
				<%-- 상품 상세보기 및 수정하기 모달 호출  --%>
				<%@include file="/WEB-INF/views/admin/adminProductModal.jsp" %>
			</c:if>
			<c:if test="${listType == 'order'}" >
				<%-- 주문 상세보기 및 수정하기 모달 호출  --%>
				<%@include file="/WEB-INF/views/admin/adminOrderModal.jsp" %>
			</c:if>

    	</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>