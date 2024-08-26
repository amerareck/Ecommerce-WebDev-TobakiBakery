<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>

<title>orderPay</title>
<style>
.section {
	margin-bottom: 20px;
	text-align: center;
}

.section h2 {
	border-bottom: 2px solid #ccc;
	padding-bottom: 10px;
	width: 100%;
	text-align: center;
}

.confirm-button {
	width: 100%;
	padding: 15px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	width: 40%;
	text-align: center;
	margin-left: 490px;
}

.confirm-button:hover {
	background-color: #ddd;
}

.print-button {
	width: 100%;
	padding: 15px;
	background-color: #6c757d;
	color: white;
	border: none;
	cursor: pointer;
	margin-top: 10px;
	width: 40%;
	text-align: center;
	margin-left: 490px;
}

.print-button:hover {
	background-color: #ddd;
}
</style>

	<!-- content 부분입니다. -->
	<hr>
	<br>
	<div class="section">
		<h2>주문 확인</h2>
		<p>
			주문이 완료되었습니다. <br> 귀하의 주문확인 번호는 <strong>20240813-0001</strong>
			입니다.
		</p>
		<p>빠른 시일 내에 상품을 준비하여 배송해드리겠습니다.</p>
	</div>

	<a href="../mypage/mypage-orderDetail.html"><button class="confirm-button">주문확인</button></a>
	<button class="print-button" onclick="window.print()">프린트하기</button>

	<br>

	<!-- content 부분 끝입니다.-->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>