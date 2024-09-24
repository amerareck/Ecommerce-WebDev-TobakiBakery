<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/orderCart.css">


<hr>
<div class="container">
	<nav class="breadcrumb-container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/order/orderCart">장바구니</a></li>
		</ol>
	</nav>

	<!-- 사이드바 포함 -->
	<div class="main-content">
		<%@include file="/WEB-INF/views/mypage/sidebar.jsp"%>
		
		<!-- 장바구니 부분 -->
		<section class="content">
			<h2>장바구니</h2>
		<img src="${pageContext.request.contextPath}/resources/image/cartIcon.png">
		<h2>장바구니가 비어있어요.</h2>
		<h3>장바구니를 새로운 상품으로 채워보세요.</h3>
		<button type="button" class="btn btn-primary btn-lg">Large button</button>
		
		</section>
		 
		 		

	</div>
</div>

<!-- 푸터자리 -->
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<%@include file="/WEB-INF/views/common/footer.jsp"%>