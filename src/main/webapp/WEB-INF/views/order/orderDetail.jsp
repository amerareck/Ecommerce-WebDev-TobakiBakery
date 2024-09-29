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
							<div class="tb-left">${deliInfo.orderNumber}</div>
							
						</td>

						<th scope="row">
							<div class="tb-left">주문일자</div>
						</th>
						<td>
							<div class="tb-left"><fmt:formatDate value="${deliInfo.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						</td>

					</tr>

					<tr>
						<th scope="row">
							<div class="tb-left">주문자</div>
						</th>
						<td>
							<div class="tb-left">${deliInfo.memberName}</div>
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
							<div class="tb-left">${deliInfo.orderMemo}</div>
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
						<td colspan="3"><div class="tb-left">${deliInfo.deliveryNum}</div></td>
					</tr>
					<tr>
						<th scope="row"><div class="tb-left">수취인</div></th>
						<td><div class="tb-left">${deliInfo.receiverName}</div></td>
						<th scope="row"><div class="tb-left">연락처</div></th>
						<td><div class="tb-left">${deliInfo.receiverPhoneNum}</div></td>
					</tr>
					<tr>
						<th scope="row"><div class="tb-left">주소</div></th>
						<td colspan="3"><div class="tb-left">(${deliInfo.deliveryPostNum})${deliInfo.deliveryAddress} <c:if test="${deliInfo.deliveryAddressDetail !=null}">,${deliInfo.deliveryAddressDetail}</c:if></div></td>
					</tr>
					<tr>
						<th scope="row"><div class="tb-left">배송메세지</div></th>
						<td colspan="3"><div class="tb-left">${deliInfo.deliveryMemo }</div></td>
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
					<col width="84">


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
				<c:forEach items="${orderProduct }" var="prod">
				<tbody>
					<tr>
						<td>
							<div class="tb-center">
								<img src="../product/productImage?productId=${prod.productId}&productUsecase=THUMBNAIL" style="width: 100px; height: 100px">
							</div>
						</td>

						<td>
							<div class="tb-left">${prod.productName}</div>
						</td>

						<td>
							<div class="tb-center">${prod.orderProductCount }</div>
						</td>

						<td>
							<div class="tb-center">
								<strong><font color="#FF5D00"><fmt:formatNumber value="${prod.orderProductPrice}" pattern="#,##0" />원</font></strong>
							</div>
						</td>

						<td>
							<div class="tb-center">
								<strong><font color="blue">
									<c:if test="${deliInfo.deliveryStatus =='DELIVERY_ING'}">배송중</c:if>
									<c:if test="${deliInfo.deliveryStatus =='DELIVERY_STAY'}">배송 대기</c:if>
									<c:if test="${deliInfo.deliveryStatus =='DELIVERY_CANCEL'}">배송 취소</c:if>
									<c:if test="${deliInfo.deliveryStatus =='DELIVERY_COMPLETE'}">배송 완료</c:if>
							</font></strong>
							</div>
						</td>
					</tr>
				</tbody>
				</c:forEach>
				<tfoot>
					<tr>
						<td colspan="6" style="text-align: right;"><fmt:formatNumber value="${deliInfo.orderTotalPrice}" pattern="#,##0" />원 +
							0원(배송료)= 
						<fmt:formatNumber value="${deliInfo.orderTotalPrice}" pattern="#,##0" />원</td>

					</tr>
				</tfoot>


			</table>

		
		</div>

	</div>
</div>

<!-- content 부분 끝입니다. -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>