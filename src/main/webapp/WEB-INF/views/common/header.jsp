<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		<%-- Tingle.js --%>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tingle/0.15.3/tingle.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tingle/0.15.3/tingle.min.js"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
	<meta charset="UTF-8"> 
<%--  	<meta name="_csrf" content="${_csrf.token}"/>   
	 <meta name="_csrf_header" content="${_csrf.headerName}"/> --%>
 	<title>header page</title>
</head>
<body>
	<header>
		<!-- 헤더의 상단 프레임 -->
		<div class="header-wrapper">
			<!--헤더 탑 영역-->
			<div class="header-top">
				<!--왼쪽 상단 프레임-->
				<div class="left-top"></div>
				<!--오른쪽 상단 nav-->
				<div class="right-top-nav">
					<nav class="navbar navbar-expand-lg navbar-light bg-light header-font">
						<!--
						<a class="navbar-brand" href="#">Navbar</a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						-->
						<div class="collapse navbar-collapse" id="navbarColor03">
						 <form method="post" action="${pageContext.request.contextPath}/logout" class="d-inline-block" id="logoutForm"> 
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<ul class="navbar-nav mr-auto">
								<li class="nav-item">
								<sec:authorize access="isAnonymous()">
									<a class="nav-link" href="${pageContext.request.contextPath}/member/loginForm" id="isNotLogin">로그인</a>
								</sec:authorize>
								</li>
								<sec:authorize access="isAuthenticated()">
								<li class="nav-item">								
									<span class="nav-link"><sec:authentication property="principal.member.memberName"/>&nbsp;님</span>
								</li>
								<li class="nav-item">								 
										<a href="#" class="nav-link d-inline-block" id="logout">로그아웃</a>
								</li>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
								<li class="nav-item">
									<a class="nav-link" href="${pageContext.request.contextPath}/member/memberInfo">회원가입</a>
								</li>
								</sec:authorize>
								<li class="nav-item">
									<a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/center/getBoardList" role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="${pageContext.request.contextPath}/center">공지사항</a>
										<a class="dropdown-item" href="${pageContext.request.contextPath}/center/list?type=helpdesk">문의사항</a>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/main">관리자 사이트</a>
										</sec:authorize>
									</div>
								</li>
							</ul>
					</form>		
						</div>
					</nav>
				</div>
			</div>
			<!--중앙 메인 로고 프레임-->
			<div class="main-logo">
				<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/image/main-logo.png" width="150px"></a>
			</div>

			<div class="d-flex" style="margin-left: 30px;">
				<!-- 헤더의 하단 프레임-->
				<div class="header-bottom container-fluid">
					<nav class="top-nav navbar navbar-expand-lg navbar-light bg-light header-font w-100 pl-0">
						<!--전체 카테고리 버튼-->
						<div class="top-ctg-list">
							<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
								<button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle header-font" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fa fa-bars"></i>&emsp;카테고리&emsp;
								</button>
								<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
									<a class="dropdown-item py-2" href="${pageContext.request.contextPath}/product/productListAll?categoryName=BREAD"><i class="fa fa-bread-slice"></i> :: 빵</a>
									<a class="dropdown-item py-2" href="${pageContext.request.contextPath}/product/productListAll?categoryName=CAKE"><i class="fa fa-birthday-cake"></i> :: 케이크</a>
									<a class="dropdown-item py-2" href="${pageContext.request.contextPath}/product/productListAll?categoryName=DESSERT"><i class="fa fa-cookie"></i> :: 디저트</a>
								</div>
							</div><!--
							<a href="#">"카테고리버튼"</a>
							<div class="top-ctg">
								<div class="left-category clear">
									ul 태그를 통한 하단 리스트들~
								</div>
								-->
						</div>
						<!--추가 상단 네비게이션 리스트-->
						<div class="top-menu collapse navbar-collapse" id="navbarColor03">
							<ul class="navbar-nav mr-auto header-font-size ">
								<li class="nav-item">
									<a class="nav-link" href="${pageContext.request.contextPath}/product/productListAll?listName=best">베스트</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="${pageContext.request.contextPath}/product/productListAll?listName=new">신상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="${pageContext.request.contextPath}/product/productListAll?listName=recom">추천상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="${pageContext.request.contextPath}/center/list?type=notice">공지사항</a>
								</li>
							</ul>
						</div>
						<!--상단네비 검색 및 장바구니-->
						<form  id="headerSearch" action="${pageContext.request.contextPath}/product/searchProduct" method="get" >
							<div class="top-menu-finder-cart align-self-end">
								<div class="top-finder">
									<div class="input-group">
										<input class="form-control headerSearchInput" type="text" placeholder="상품 검색" id="search" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-secondary" type="submit" ><i class="fa fa-search"></i></button>
										</div>
									</div>
								</div>
								<div class="top-cart">
									<a href="${pageContext.request.contextPath}/order/cart"><i class="fas fa-shopping-cart icon-size"></i></a>									
									<sec:authorize access="isAuthenticated()">
										<span class="cart-count">${commonCartCount}</span>
									</sec:authorize>
								</div>
							</div>
						</form>
					</nav>
					
				</div>
			</div>
		</div>
	</header>