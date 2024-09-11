<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage-orderDetail.css">



<hr>
<!-- 메인 content 부분입니다. -->
<div class="container">
	<nav class="breadcrumb-container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/mypage/mypageMain">주문내역</a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/order/orderDetail">주문상세내역</a></li>

		</ol>
	</nav>
	<div class="main-content">

		<h1>주문상세내역</h1>
		<div>
			<br>
			<h2>주문자정보</h2>
			<table class=detail-table>

				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>

				<tbody>
					<tr>
						<th scope="row">
							<div class="tb-left">주문번호</div>
						</th>
						<td>
							<div class="tb-left">20240813-0001</div>
						</td>

						<th scope="row">
							<div class="tb-left">주문일자</div>
						</th>
						<td>
							<div class="tb-left">2024.08.13</div>
						</td>

					</tr>

					<tr>
						<th scope="row">
							<div class="tb-left">주문자</div>
						</th>
						<td>
							<div class="tb-left">황망고</div>
						</td>

						<th scope="row">
							<div class="tb-left">주문서 입금현황</div>
						</th>
						<td>
							<div class="tb-left">입금완료</div>
						</td>

					</tr>

					<tr>
						<th scope="row">
							<div class="tb-left">주문 메모</div>
						</th>
						<td colspan="3">
							<div class="tb-left"></div>
						</td>

					</tr>
				</tbody>
			</table>

		</div>

		<div>
			<br>
			<h2>배송지 정보</h2>

			<table class="detail-table">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><div class="tb-left">송장번호</div></th>
						<td colspan="3"><div class="tb-left">CJ대한통운 12345678910</div></td>
					</tr>
					<tr>
						<th scope="row"><div class="tb-left">수취인</div></th>
						<td><div class="tb-left">황망고</div></td>
						<th scope="row"><div class="tb-left">연락처</div></th>
						<td><div class="tb-left">010-7658-3716</div></td>
					</tr>
					<tr>
						<th scope="row"><div class="tb-left">주소</div></th>
						<td colspan="3"><div class="tb-left">(03077)서울 종로구 창경궁로
								254, 402호</div></td>
					</tr>
					<tr>
						<th scope="row"><div class="tb-left">배송메세지</div></th>
						<td colspan="3"><div class="tb-left">문 앞에 놔주세요.</div></td>
					</tr>
				</tbody>
			</table>

		</div>


		<div>
			<br>
			<h2>주문상품정보</h2>
			<table class=detail-table>

				<colgroup>
					<col width="130">
					<col width="*">
					<col width="150">
					<col width="80">
					<col width="80">


				</colgroup>
				<thead>
					<tr>
						<th scope="row" colspan="2">
							<div class="tb-center">주문상품정보</div>
						</th>

						<th scope="row">
							<div class="tb-center">수량</div>
						</th>

						<th scope="row">
							<div class="tb-center">가격</div>
						</th>

						<th scope="row">
							<div class="tb-center">처리상태</div>
						</th>

					</tr>

				</thead>

				<tbody>
					<tr>
						<td>
							<div class="tb-center">
								<img src="../resources/image/bread/자연효모빵.jpg"
									style="width: 100px; height: 100px">
							</div>
						</td>

						<td>
							<div class="tb-left">자연효모빵</div>
						</td>

						<td>
							<div class="tb-center">2</div>
						</td>

						<td>
							<div class="tb-center">
								<strong><font color="#FF5D00">9,200원</font></strong>
							</div>
						</td>

						<td>
							<div class="tb-center">
								<strong><font color="blue">배송중</font></strong>
							</div>
						</td>
					</tr>




					<tr>
						<td>
							<div class="tb-center">
								<img src="../resources/image/bread/오렌지케익.jpg"
									style="width: 100px; height: 100px">
							</div>
						</td>

						<td>
							<div class="tb-left">오렌지케잌</div>
						</td>

						<td>
							<div class="tb-center">1</div>
						</td>

						<td>
							<div class="tb-center">
								<strong><font color="#FF5D00">22,000원</font></strong>
							</div>
						</td>

						<td>
							<div class="tb-center">
								<strong><font color="blue">배송중</font></strong>
							</div>
						</td>


					</tr>



				</tbody>
				<tfoot>
					<tr>
						<td colspan="6" style="text-align: right;">31,200원(상품구매금액) +
							0원(배송료)= 31,200원</td>
					</tr>
				</tfoot>


			</table>


		</div>

	</div>
</div>

<!-- content 부분 끝입니다. -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>