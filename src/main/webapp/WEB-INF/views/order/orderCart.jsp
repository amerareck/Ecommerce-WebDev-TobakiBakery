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
		
			<!-- 장바구니 카트 -->
			<div id="cartWrap">
				<!-- 장바구니 테이블 -->
				<table class="table">
		                <colgroup>
		                    <col width="5%">
		                    <col width="15%">
		                    <col width="20%">
		                    <col width="15%">
		                    <col width="15%">
		                    <col width="10%">
		                </colgroup>
		                <thead>
		                    <tr class="table-warning text-center">
		                        <th>
		                        	<div class="custom-control custom-checkbox">
		                                <input type="checkbox" class="custom-control-input" id="selectAll">
		                                <label class="custom-control-label" for="selectAll"></label>
		                            </div>
		                        </th>
		                        <th>사진</th>
		                        <th>상품명</th>
		                        <th>수량</th>
		                        <th>결제예정가</th>
		                        <th>삭제</th>
		                    </tr>
		                </thead>
		                <tbody>
							<c:forEach items="${cartItemList}" var="cartItem" >
								<tr class="text-center" id="cartRow-${cartItem.productId}">
									<td class="align-middle">
										<div class="custom-control custom-checkbox">
			                                <input type="checkbox" class="custom-control-input item-select" id="select-box-${cartItem.productId}">
			                                <label class="custom-control-label" for="select-box-${cartItem.productId}"></label>
		                            	</div>
									</td>
									<td class="align-middle">
										<a href="${pageContext.request.contextPath}/product/productDetail?productId=${cartItem.productId}">
											<img src="${pageContext.request.contextPath}/product/productImage?productId=${cartItem.productId}&productUsecase=THUMBNAIL" width="100px" height="100px" />
										</a>
									</td>
									<td class="align-middle">
										<a href="${pageContext.request.contextPath}/product/productDetail?productId=${cartItem.productId}" 
											style="color: black !important;">${cartItem.productName}</a>
									</td>
									<td class="align-middle">
										<div class="quantity-control">
											<button class="quantity-minus" id="quantityMinusButton-${cartItem.productId}" >-</button>
											<input type="text" id="productQuantity-${cartItem.productId}" value="${cartItem.cartCount}" min="1" max="10" />
											<button class="quantity-plus" id="quantityPlusButton-${cartItem.productId}" >+</button>
										</div>
									</td>
									<td class="align-middle">
										<span class="currentPrice" id="productPriceNumber-${cartItem.productId}" data-product-price="${cartItem.productPrice}" ><fmt:formatNumber value="${cartItem.productPrice}" pattern="#,##0" />원</span>
									</td>
									<td class="align-middle">
										<form action="${pageContext.request.contextPath}/order/deleteCartItem" method="post">
											<input type="hidden" name="productId" value="${cartItem.productId}">
											<button type="submit" class="btn btn-secondary btn-sm">삭제</button>
										</form>
									</td>
								</tr>
							</c:forEach>
		                </tbody>
		                <tfoot>
							<tr>
								<td colspan="6">
									<div class="basket_totalprice">
										<span>총 구매 금액: &nbsp;</span>
										<strong id="orderTotalPrice" data-total-price="${totalPrice}" }><fmt:formatNumber value="${totalPrice}" pattern="#,##0" />원</strong>
									</div>
								</td>
							</tr>
		                </tfoot>
	           		</table>
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
					<button type="button" class="btn btn-outline-secondary" id="selectRemover" >선택삭제</button>
					<button type="button" class="btn btn-outline-secondary" id="continueShoping">계속 쇼핑하기</button>
					<button type="button" class="btn btn-outline-secondary" id="emptyCart">장바구니 비우기</button>
					<button type="button" class="btn btn-outline-danger" id="orderProcess">선택상품 주문하기</button>
				</div>
			</div>		
		</section>
	</div>
</div>

<!-- 푸터자리 -->
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<%@include file="/WEB-INF/views/common/footer.jsp"%>