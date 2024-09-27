<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/adminMain.jsp" %>
    
		<div class="total-orders p-2 mb-4" id="orderList">
			<div class="d-flex justify-content-between mb-2 align-items-center">
				<h3>주문 목록 리스트</h3>
				<%-- 주문 검색 start --%>
				<form class="form-inline my-2 my-lg-0" id="orderSearchForm" action="../admin/searchOrder">
					<div class="input-group">
						<select class="form-control mr-sm-1" id="searchOrderSelect">
							<option selected>검색조건</option>
							<option value="orderProd">주문상품</option>
							<option value="orderId">주문번호</option>
							<option value="orderStatus">배송상태</option>
						</select>
						<input class="form-control mr-sm-0" type="text" placeholder="Search" id="orderSearchKeyword" name="productName">
						<input type="hidden" name="type" value="productName" />
						<div class="input-group-append">
							<button class="btn btn-secondary my-2 my-sm-0" style="height: 35px;" type="submit">검색</button>
						</div>
					</div>
				</form>
				<%-- 주문 검색 end --%>
			</div>
		
			<div class="table-wrapper">
				<table class="table table-hover table-striped">
					<colgroup>
		                    <col width="5%"> <%-- 주문번호 --%>
		                    <col width="13%"> <%-- 주문상태 --%>
		                    <col width="7%"> <%-- 주문수량 --%>
		                    <col width="30%"> <%-- 주문상품 --%>
		                    <col width="13%"> <%-- 주문금액 --%>
		                    <col width="15%"> <%-- 주문일자 --%>
		                    <col width="10%"> <%-- 구매자 --%>
		                    <col width="7%"> <%-- 수정 --%>
		            </colgroup>
					<thead>
						<tr class="table-secondary text-center">
							<th>NO</th>
							<th>상태</th>
							<th>수량</th>
							<th>주문 상품</th>
							<th>주문 금액</th>
							<th>주문 일자</th>
							<th>구매자</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="order" >
							<tr class="text-center">
								<!-- 주문 번호 -->
								<th scope="row" class="align-middle">${order.orderNumber}</th>
								<!-- 배송 상태 -->
								<td class="align-middle del-status">
									<c:if test="${order.deliveryStatus == 'DELIVERY_STAY'}">
										<div class="tm-status-circle pending ml-2"></div><span>배송대기</span>
									</c:if>
									<c:if test="${order.deliveryStatus == 'DELIVERY_ING'}">
										<div class="tm-status-circle moving ml-2"></div><span>배송중</span>
									</c:if>
									<c:if test="${order.deliveryStatus == 'DELIVERY_COMPLETE'}">
										<div class="tm-status-circle deliver-clear ml-2"></div><span>배송완료</span>
									</c:if>
									<c:if test="${order.deliveryStatus == 'DELIVERY_CANCEL'}">
										<div class="tm-status-circle cancelled ml-2"></div><span>주문취소</span>
									</c:if>
								</td>
								<!-- 주문 수량 -->
								<td class="align-middle">${order.productListSize}종</td>
								<!-- 주문 명 -->
								<td class="align-middle">
									<c:if test="${order.productListSize == 1}">
										<a href="#" data-toggle="modal" data-target="#orderDetailsModal-${order.orderNumber}">${order.productName}</a>
									</c:if>
									<c:if test="${order.productListSize != 1}">
										<a href="#" data-toggle="modal" data-target="#orderDetailsModal-${order.orderNumber}">${order.productName} 외 ${order.productListSize-1}종</a>
									</c:if>
								</td>
								<!-- 주문 금액 -->
								<td class="align-middle">
									<fmt:formatNumber value="${order.orderTotalPrice}" pattern="#,##0" />원
								</td>
								<!-- 주문 일자 -->
								<td class="align-middle">
									<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd"/>
								</td>
								<!-- 구매자 -->
								<td class="align-middle">${order.memberId}</td>
								<!-- 상품수정 -->
								<td class="align-middle">
									<a href="#" data-toggle="modal" data-target="#orderUpdateModal-${order.orderNumber}"><i class="fas fa-pen"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		    
			<div>
                <ul class="pagination justify-content-center my-5">
                  		<c:if test="${!isSearchPage}">
						<c:if test="${pager.groupNo>1}" >
                    		<li class="page-item">
				            	<a class="page-link" href="${pageContext.request.contextPath}/admin/list?type=order&pageNo=${pager.startPageNo-1}" >&laquo;</a>
		                    </li>
	                    </c:if>
	                    <c:if test="${pager.groupNo<=1}" >
	                    	<li class="page-item disabled" >
		                        <a class="page-link" href="javascript:void(0);" >&laquo;</a>
		                    </li>
	                    </c:if>
                  		</c:if>
                    <c:if test="${isSearchPage}">
                    	<c:if test="${pager.groupNo>1}" >
	                    	<li class="page-item">
			                	<a class="page-link" href="${pageContext.request.contextPath}/admin/searchOrder?type=${pager.searchType}&keyword=${pager.keyword}&pageNo=${pager.startPageNo-1}" >&laquo;</a>
	                    	</li>
                    	</c:if>
                    	<c:if test="${pager.groupNo<=1}" >
	                    	<li class="page-item disabled" >
		                        <a class="page-link" href="javascript:void(0);" >&laquo;</a>
		                    </li>
	                    </c:if>
                   	</c:if>
                    
                    <c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" var="i">
                    	<c:if test="${!isSearchPage}" >
	                    	<c:if test="${pager.pageNo == i}" >
	                    		<li class="page-item active">
	                        		<a class="page-link" href="${pageContext.request.contextPath}/admin/list?type=order&pageNo=${i}">${i}</a>
	                    		</li>
	                    	</c:if>
	                    		
	                    	<c:if test="${pager.pageNo != i}" >
	                    		<li class="page-item">
			                        <a class="page-link" href="${pageContext.request.contextPath}/admin/list?type=order&pageNo=${i}">${i}</a>
			                    </li>
	                    	</c:if>
                    	</c:if>
                    	<c:if test="${isSearchPage}" >
	                    	<c:if test="${pager.pageNo == i}" >
	                    		<li class="page-item active">
	                        		<a class="page-link" href="${pageContext.request.contextPath}/admin/searchOrder?type=${pager.searchType}&keyword=${pager.keyword}&pageNo=${i}">${i}</a>
	                    		</li>
	                    	</c:if>
	                    		
	                    	<c:if test="${pager.pageNo != i}" >
	                    		<li class="page-item">
			                        <a class="page-link" href="${pageContext.request.contextPath}/admin/searchOrder?type=${pager.searchType}&keyword=${pager.keyword}&pageNo=${i}">${i}</a>
			                    </li>
	                    	</c:if>
                    	</c:if>
                    	
                    </c:forEach>
                    <c:if test="${!isSearchPage}" >
	                    <c:if test="${pager.groupNo<pager.totalGroupNo}" >
		                    <li class="page-item">
		                        <a class="page-link" href="${pageContext.request.contextPath}/admin/list?type=ordert&pageNo=${pager.endPageNo+1}">&raquo;</a>
		                    </li>
	                    </c:if>
                    	<c:if test="${pager.groupNo>=pager.totalGroupNo}" >
		                    <li class="page-item disabled">
		                        <a class="page-link" href="javascript:void(0)">&raquo;</a>
		                    </li>
                    	</c:if>
                    </c:if>
                    <c:if test="${isSearchPage}" >
	                    <c:if test="${pager.groupNo<pager.totalGroupNo}" >
		                    <li class="page-item">
		                        <a class="page-link" href="${pageContext.request.contextPath}/admin/searchOrder?type=${pager.searchType}&keyword=${pager.keyword}&pageNo=${pager.endPageNo+1}">&raquo;</a>
		                    </li>
	                    </c:if>
                    	<c:if test="${pager.groupNo>=pager.totalGroupNo}" >
		                    <li class="page-item disabled">
		                        <a class="page-link" href="javascript:void(0)">&raquo;</a>
		                    </li>
                    	</c:if>
                    </c:if>
					
                </ul>
			</div>
		</div>
		<hr class="hr my-5"/>
	</section>
           <!-- 메인 섹션 종료 -->
			<%-- 주문 상세보기 및 수정하기 모달 호출  --%>
	<%@include file="/WEB-INF/views/admin/adminOrderModal.jsp" %>
   	</div>
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>