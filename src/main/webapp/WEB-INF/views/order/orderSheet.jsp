<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage-order.css">

<!-- 메인 content 부분입니다. -->
<hr>
<div class="container">
	<nav class="breadcrumb-container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/order/cart">주문서 작성</a>
			</li>
		</ol>
	</nav>
	
	<div class="main-content">
		<h1>주문서 작성</h1>
		<br>
		<section class="order-products">
			<h2>주문상품</h2>
			<table>
				<thead>
					<tr>
						<th>제품</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${orderData.productList}">
						<tr class="product-set" data-productId="${product.productId}" >
							<td id="productName-${product.productId}" data-productName="${product.productName}" >
								<a href="${pageContext.request.contextPath}/product/productDetail?productId=${product.productId}">
									<img src="${pageContext.request.contextPath}/product/productImage?productId=${product.productId}&productUsecase=THUMBNAIL" width="100px" height="100px" />
								</a>
								<span class="ml-4">${product.productName}</span>
							</td>
							<td id="cartCount-${product.productId}" data-cartCount="${product.cartCount}">
								<span>${product.cartCount}개</span>
							</td>
							<td id="productPrice-${product.productId}" data-productPrice="${product.productPrice}" >
								<fmt:formatNumber value="${product.productPrice}" pattern="#,##0" />원
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="order-summary">
				<span>총 금액:&nbsp;<fmt:formatNumber value="${orderData.orderTotalPrice}" pattern="#,##0"/>원</span>
			</div>
		</section>
		
		<section class="order-info">
			<h2>주문자 정보</h2>
			<div class="section align-middle" style="width: 500px; margin-left: 20px;">
				<label for="orderName">* 주문자 이름</label>
				<input type="text" id="orderName" value="${orderData.receiverName}" disabled="disabled" />
			</div>
			
			<div class="section align-middle" style="width: 500px; margin-left: 20px;">
				<label for="orderPhone">* 연락처</label>
				<div class="phone-group" >
					<input type="text" id="phonePart1" value="${fn:substring(orderData.receiverPhoneNum, 0, 3)}" disabled="disabled" /><span>_&nbsp;</span>
					<input type="text" id="phonePart2" value="${fn:substring(orderData.receiverPhoneNum, 3, 7)}" disabled="disabled" /><span>_&nbsp;</span>
					<input type="text" id="phonePart3" value="${fn:substring(orderData.receiverPhoneNum, 7, 11)}" disabled="disabled" />
				</div>
			</div>
			
			<div class="section align-middle" style="width: 500px; margin-left: 20px;">
				<label for="orderEmail">* 이메일</label>
				<div class="email-group">
					<c:forEach var="email" items="${fn:split(orderData.receiverEmail, '@')}" varStatus="status" >
						<c:if test="${status.index != 1}">
							<input type="text" id="email-${status.index}" value="${email}" disabled="disabled" />
						</c:if>
						<c:if test="${status.index == 1}">
							<span>@</span>
							<input type="text" id="email-${status.index}" value="${email}" disabled="disabled" />
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
		
		<section class="delivery-info">
			<h2>배송지 정보</h2>
			<div class="section" style="margin-left: 20px;">
				<label>* 배송지 </label>
				<input type="radio" id="defaultAddress" name="addressOption" checked />&nbsp;기본 배송지&nbsp;&nbsp;
				<input type="radio" id="newAddress" name="addressOption" />&nbsp;신규 배송지&nbsp;&nbsp;
				
				<div class="input-group">
					<input type="text" id="deliveryPostNum" name="deliveryPostNum" placeholder="우편번호" value="${orderData.deliveryPostNum}" readonly required style="width: 300px;" />
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button" onclick="execDaumPostcode()">우편번호검색</button>
					</div>
				</div>
				<input type="text" id="deliveryAddress" name="deliveryAddress" placeholder="주소" value="${orderData.deliveryAddress}" style="width: 400px; margin-top: 10px;" readonly />
				<input type="text" id="deliveryAddressDetail" name="deliveryAddressDetail" placeholder="상세주소" value="${orderData.deliveryAddressDetail}" style="width: 400px; margin-top: 10px;" />
				<div id="error-message" class="text-danger" style="font-size: 0.7rem"></div>
			</div>
			
			<div class="section" style="width: 500px; margin-left: 20px;">
				<label for="receiverName">* 받으시는 분</label>
				<input type="text" id="receiverName" name="receiverName" value="${orderData.receiverName}">
				<div id="receiverName-error-message" class="text-danger" style="font-size: 0.7rem"></div>
			</div>
			
			<div class="section" style="width: 500px; margin-left: 20px;">
				<label for="phoneNumber">* 휴대폰</label>
				<div class="phone-group" id="receiverPhoneNumber">
					<input type="text" id="phonePart1" value="${fn:substring(orderData.receiverPhoneNum, 0, 3)}">_&nbsp;
					<input type="text" id="phonePart2" value="${fn:substring(orderData.receiverPhoneNum, 3, 7)}">_&nbsp;
					<input type="text" id="phonePart3" value="${fn:substring(orderData.receiverPhoneNum, 7, 11)}">
				</div>
				<div id="receiverPhoneNum-error-message" class="text-danger" style="font-size: 0.7rem"></div>
			</div>
			
			<div class="section" style="width: 500px; margin-left: 20px;">
				<label for="orderMemo">주문 메시지</label>
				<textarea id="orderMemo" name="orderMemo" placeholder="배송 메시지를 작성해 주세요."></textarea>
				<div id="orderMemo-error-message" class="text-danger" style="font-size: 0.7rem"></div>
			</div>
		</section>
		
		<section class="delivery-info mb-5">
			<h2></h2>
		</section>
		
		<section class="final-payment-info my-5">
			<h2>최종결제정보</h2>
			<div class="summary">
				<div>
					<span>총 주문금액:&nbsp;</span>
					<fmt:formatNumber value="${orderData.orderTotalPrice}" pattern="#,##0" />원
					<input type="hidden" id="orderTotalPrice" name="orderTotalPrice" value="${orderData.orderTotalPrice}" />
				</div>
				<div>
					<span>총 배송비:&nbsp;</span>
					<fmt:formatNumber value="${orderData.deliveryPrice}" pattern="#,##0" />원
				</div>
				<div>
					<span>최종금액:&nbsp;</span>
					<fmt:formatNumber value="${orderData.orderTotalPrice + orderData.deliveryPrice}" pattern="#,##0" />원
				</div>
			</div>
			<button type="button" id="orderSubmitButton">결제하기</button>
		</section>
		
		<section class="order-notice">
			<h2>주문시 주의사항</h2>
			<table>
				<thead>
					<tr>
						<th>제공받는자</th>
						<th>목적</th>
						<th>항목</th>
						<th>보유기간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>토박이베이커리</td>
						<td>상품 배송 및 서비스 제공, 고객 상담</td>
						<td>이름, 연락처, 주소</td>
						<td>구매 서비스 종료 후 3개월까지</td>
					</tr>
				</tbody>
			</table>
			<div class="agreement">
				<input type="radio" id="agree" name="agreement" checked>
				동의합니다.&nbsp;&nbsp;&nbsp;
				<input type="radio" id="disagree" name="agreement">
				동의하지 않습니다.
			</div>
		</section>
	</div>
</div>

<!-- content 부분 끝입니다. -->

<%@include file="/WEB-INF/views/common/footer.jsp"%>