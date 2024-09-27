<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage-order.css">

<title>orderPay</title>


<!-- content 부분입니다. -->
<hr style="margin-bottom: 7%;">
<br>
<div class="pay-section" style="max-width: 40%;margin: 0 auto;">
	<h2 style="margin-bottom: 6%;">주문 확인</h2>
	<p>
		주문이 완료되었습니다. <br> 귀하의 주문확인 번호는 <strong>${orderNumber}</strong>
		입니다.
	</p>
	<p>빠른 시일 내에 상품을 준비하여 배송해드리겠습니다.</p>
</div>

<a href="${pageContext.request.contextPath}/order/orderDetail?orderNumber=${orderNumber}">
	<button class="confirm-button" style="margin-left: 40%;width:20%;margin-right: 40%;margin-top: 3%;">주문확인</button>
</a>
<br>
<div class="pay-section" style="max-width: 40%;margin: 0 auto;">
<h2 style="margin-top: 6%;margin-bottom: 25%;"></h2>
</div>
<!-- content 부분 끝입니다.-->
<%@include file="/WEB-INF/views/common/footer.jsp"%>