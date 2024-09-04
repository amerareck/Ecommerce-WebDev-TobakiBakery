<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="total-orders p-2 mb-4" id="orderList">
	<div class="d-flex justify-content-between mb-2 align-items-center">
		<h3>주문 목록 리스트</h3>
		<%-- 주문 검색 start --%>
		<form class="form-inline my-2 my-lg-0" id="orderSearchForm">
			<div class="input-group">
				<select class="form-control mr-sm-1" id="searchOrderSelect">
					<option selected>검색조건</option>
					<option value="orderProd">주문상품</option>
					<option value="orderId">주문번호</option>
					<option value="orderStatus">배송상태</option>
				</select>
				<input class="form-control mr-sm-0" type="text" placeholder="Search" id="orderSearchKeyword">
				<div class="input-group-append">
					<button class="btn btn-secondary my-2 my-sm-0" style="height: 35px;" type="submit">검색</button>
				</div>
			</div>
		</form>
		<%-- 주문 검색 end --%>
	</div>

	<div class="table-wrapper">
		<table class="table table-hover table-striped">
			<thead>
				<tr class="table-secondary text-center">
					<th style="width: 30px;">NO.</th>
					<th>상태</th>
					<th>주문 상품</th>
					<th>주문 수량</th>
					<th>주문 금액</th>
					<th>주문 일자</th>
					<th>구매자</th>
					<th style="width: 50px">수정</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<!-- 주문 번호 -->
					<th scope="row" class="align-middle">#12341</th>
					<!-- 배송 상태 -->
					<td class="align-middle del-status">
						<div class="tm-status-circle moving ml-2"></div><span>배송중</span>
					</td>
					<!-- 주문 수량 -->
					<td class="align-middle">6개</td>
					<!-- 주문 명 -->
					<td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">까망쿠키 치즈 1호 케이크 외 2종</a></td>
					<!-- 주문 금액 -->
					<td class="align-middle">35,000원</td>
					<!-- 주문 일자 -->
					<td class="align-middle">2024-08-04 12:02:33</td>
					<!-- 구매자 -->
					<td class="align-middle">김*윤</td>
					<!-- 상품수정 -->
					<td class="align-middle">
						<a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
					</td>
				</tr>
			
				<tr class="text-center">
					<!-- 주문 번호 -->
					<th scope="row" class="align-middle">#12342</th>
					<!-- 배송 상태 -->
					<td class="align-middle del-status">
						<div class="tm-status-circle pending ml-2"></div><span>배송대기</span>
					</td>
					<!-- 주문 수량 -->
					<td class="align-middle">12개</td>
					<!-- 주문 명 -->
					<td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">까놀레</a></td>
					<!-- 주문 금액 -->
					<td class="align-middle">42,000원</td>
					<!-- 주문 일자 -->
					<td class="align-middle">2024-08-04 11:58:14</td>
					<!-- 구매자 -->
					<td class="align-middle">정*상</td>
					<!-- 수정 -->
					<td class="align-middle">
						<a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
					</td>
				</tr>
			
				<tr class="text-center">
					<!-- 주문 번호 -->
					<th scope="row" class="align-middle">#12343</th>
					<!-- 배송 상태 -->
					<td class="align-middle del-status">
						<div class="tm-status-circle cancelled ml-2"></div><span>주문취소</span>
					</td>
					<!-- 주문 수량 -->
					<td class="align-middle">1개</td>
					<!-- 주문 명 -->
					<td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">진한 가나슈 케이크</a></td>
					<!-- 주문 금액 -->
					<td class="align-middle">28,000원</td>
					<!-- 주문 일자 -->
					<td class="align-middle">2024-08-04 08:47:34</td>
					<!-- 구매자 -->
					<td class="align-middle">임*정</td>
					<!-- 수정 -->
					<td class="align-middle">
						<a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
					</td>
				</tr>
			
				<tr class="text-center">
					<!-- 주문 번호 -->
					<th scope="row" class="align-middle">#12344</th>
					<!-- 배송 상태 -->
					<td class="align-middle del-status">
						<div class="tm-status-circle deliver-clear ml-2"></div><span>배송완료</span>
					</td>
					<!-- 주문 수량 -->
					<td class="align-middle">11개</td>
					<!-- 주문 명 -->
					<td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">갈릭버터소금빵 외 3종</a></td>
					<!-- 주문 금액 -->
					<td class="align-middle">24,000원</td>
					<!-- 주문 일자 -->
					<td class="align-middle">2024-08-03 20:37:54</td>
					<!-- 구매자 -->
					<td class="align-middle">김*수</td>
					<!-- 수정 -->
					<td class="align-middle">
						<a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
    
	<div>
		<ul class="pagination justify-content-center mt-3 mb-2">
			<li class="page-item disabled">
				<a class="page-link" href="#">&laquo;</a>
			</li>
			<li class="page-item active">
				<a class="page-link" href="#">1</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">2</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">3</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">4</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">5</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">&raquo;</a>
			</li>
		</ul>
	</div>
</div>