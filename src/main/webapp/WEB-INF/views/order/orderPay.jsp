<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage-order.css">

<title>orderPay</title>


<!-- content 부분입니다. -->
<hr>
<br>
<div class="pay-section">
	<h2>주문 확인</h2>
	<p>
		주문이 완료되었습니다. <br> 귀하의 주문확인 번호는 <strong>${orderNumber}</strong>
		입니다.
	</p>
	<p>빠른 시일 내에 상품을 준비하여 배송해드리겠습니다.</p>
</div>

<a href="${pageContext.request.contextPath}/mypage/orderDetail">
	<button class="confirm-button">주문확인</button>
</a>
<button class="print-button" onclick="window.print()">프린트하기</button>

<br>

<!-- content 부분 끝입니다.-->
<%@include file="/WEB-INF/views/common/footer.jsp"%>