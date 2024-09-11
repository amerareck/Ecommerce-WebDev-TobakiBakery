<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">


	<!-- 사이드바 부분입니다. -->
	<hr>
	<div class="container">
		<nav class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.html"><i
						class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a></li>
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/mypage/mypageOrderDelivery">주문내역</a></li>

			</ol>
		</nav>
		<div class="main-content">
			<%@include file="/WEB-INF/views/mypage/sidebar.jsp" %>
			<!-- content부분입니다. -->
			<section class="content">
				<h2>주문내역</h2>
				<div class="orderdelivery-summary">
					<p>
						<span>황망고</span>님이 쇼핑몰에서 주문한 내역입니다.
					</p>
				</div>
				<div class="orderdelivery-filter">
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('today')">오늘</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('yesterday')">어제</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('week')">일주일</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('month')">1개월</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('three-months')">3개월</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('year')">1년</button>
				</div>
				<div class="orderdelivery-search">
					<input type="date" id="start-date" value=""> ~ <input
						type="date" id="end-date" value="">
					<button type="button" class="btn btn-secondary">조회</button>
				</div>
				<table class="orderdelivery-table">
					<thead>
						<tr>
							<th style="text-align: center;">주문일자</th>
							<th style="text-align: center;">상품명</th>
							<th style="text-align: center;">결제금액</th>
							<th style="text-align: center;">상태</th>
							<th style="text-align: center;">주문상세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align: center;">2024-08-16</td>
							<td style="text-align: center;">자연효모빵 외 1종</td>
							<td style="text-align: center;">31,200원</td>
							<td style="text-align: center;">배송중</td>
							<td style="text-align: center;">
								<a href="${pageContext.request.contextPath}/order/orderDetail">
								<button type="button" class="btn btn-secondary">조회</button>
								</a>
							</td>
						</tr>

						<tr>
							<td style="text-align: center;">2024-08-04</td>
							<td style="text-align: center;">팡도르 외 3종</td>
							<td style="text-align: center;">28,400원</td>
							<td style="text-align: center;">배송완료</td>
							<td style="text-align: center;">
								<a href="${pageContext.request.contextPath}/order/orderDetail">
								<button type="button" class="btn btn-secondary">조회</button>
								</a>
							</td>
						</tr>

						<tr>
							<td style="text-align: center;">2024-07-23</td>
							<td style="text-align: center;">걀렛뜨 데로와 푀유떼 외 4종</td>
							<td style="text-align: center;">78,900원</td>
							<td style="text-align: center;">배송완료</td>
							<td style="text-align: center;">
								<a href="${pageContext.request.contextPath}/order/orderDetail">
								<button type="button" class="btn btn-secondary">조회</button>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<br> <br> <br>
				<div class="orderdelivery-notice">
					<p>주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</p>

				</div>
			</section>
		</div>
	</div>

	<!-- content 부분 끝입니다. -->
	
<%@include file="/WEB-INF/views/common/footer.jsp" %>
