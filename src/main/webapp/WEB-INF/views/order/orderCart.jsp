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
		<c:choose>
			<c:when test="${map.count == 0}">
			 장바구니가 비어있습니다.
			 </c:when>
		 <c:otherwise>
		 				<!-- 장바구니 카트 -->
			<div id="cartWrap">
				<!-- 장바구니 테이블 -->
				<div id="cartTable">
					<table>
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="20%">
                    <col width="15%">
                    <col width="15%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr class="table-warning">
                        <th>선택</th>
                        <th>사진</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>결제예정가</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cartItemList}" var="cartItem">
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/product/productDetail?productId=${cartItem.productId}">
                                    <img src="${pageContext.request.contextPath}/productImage?productId=${cartItem.productId}&productUsecase=THUMBNAIL" width="100px" />
                                </a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/product/productDetail?productId=${cartItem.productId}" style="color: black !important;">
                                    ${cartItem.productName}
                                </a>
                            </td>
                            <td>
                                <div class="quantity-control">
                                    <button>-</button>
                                    <input type="text" value="${cartItem.quantity}" min="1" max="10" />
                                    <button>+</button>
                                </div>
                            </td>
                            <td class="currentPrice" data-unit-price="${cartItem.productPrice}">
                                <fmt:formatNumber value="${cartItem.productPrice * cartItem.cartCount}" pattern="#,##0" />원
                            </td>
                            <td><button class="btn btn-danger btn-sm">삭제</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6">
                            <div class="basket_totalprice">
                                	총 구매 금액: <strong>
                                    <fmt:formatNumber value="${totalPrice}" pattern="#,##0" />원
                                </strong>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
				</div>
				<!-- 공지사항 -->
				<div class="cartNotice">
					<div class="flt">
						<ul class="dot_list">
							<li>장바구니의 상품별 할인가는 "미리 계산된 가격" 입니다</li>
							<li>주문서의 쿠폰변경시 실제 가격은 달라질 수 있습니다</li>
							<li>상품 한개당 최대 구매가능 개수는 10개입니다</li>
						</ul>
					</div>
				</div>
				<!-- 주문 버튼 -->
				<div class="btns_order">
					<button type="button" class="btn btn-outline-secondary">선택삭제</button>
					<button type="button" class="btn btn-outline-secondary">계속 쇼핑하기</button>
					<button type="button" class="btn btn-outline-secondary">장바구니 비우기</button>
					<button type="button" class="btn btn-outline-danger">선택상품 주문하기</button>
				</div>
			</div>
			 </c:otherwise>
			 </c:choose>
		</section>
		 
		 		

	</div>
</div>

<!-- 푸터자리 -->
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
