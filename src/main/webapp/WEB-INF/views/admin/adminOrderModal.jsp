<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 주문 상세 호출 모달 시작 --%>

<c:forEach items="${orderList}" var="order" >
	<div class="modal fade" id="orderDetailsModal-${order.orderNumber}">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
	            <!-- Modal Header -->
				<div class="modal-header">
				    <h3 class="modal-title">주문상세내역</h3>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	                
	            <!-- Modal body -->
	            <div class="modal-body">
					<div class="modal-content-1">
						<h5 class="h5"><strong>주문자정보</strong></h5>
	                    <table class="table table-sm table-bordered">
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
							</colgroup>
	                          
							<tbody>
								<tr>
									<th scope="row">
										<div class="tb-left">주문번호</div>
									</th>
									<td>
										<div class="tb-left">${order.orderNumber}</div>
									</td>			
									<th scope="row">
										<div class="tb-left">주문일자</div>
									</th>
									<td>
										<div class="tb-left"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
									</td>				
								</tr>
							                                        
								<tr>
									<th scope="row">
										<div class="tb-left">주문자</div>
									</th>
									<td>
										<div class="tb-left">${order.memberName}</div>
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
										<div class="tb-left">${order.orderMemo}</div>
									</td>								
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-content-2">
						<h5 class="h5"><strong>배송지 정보</strong></h5>
						
						<table class="table table-sm table-bordered">
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
							</colgroup>
						
							<tbody>
								<tr>
									<th scope="row">
										<div class="tb-left">송장번호</div>
									</th>
									<td colspan="3">
										<div class="tb-left">${order.deliveryNum}</div>
									</td>
								</tr>
							
								<tr class="">
									<th scope="row" style="width:15%">
										<div class="tb-left">수취인</div>
									</th>
									<td style="width:40%">
										<div class="tb-left">${order.receiverName}</div>
									</td>
									<th style="width:15%">
										<div class="tb-right">연락처</div>
									</th>
									<td style="width:30%">
										<div class="tb-right">
											<c:if test="${fn:length(order.receiverPhoneNum) == 11}">
												${fn:substring(order.receiverPhoneNum, 0, 3)}-${fn:substring(order.receiverPhoneNum, 3, 7)}-${fn:substring(order.receiverPhoneNum, 7, 11)}
											</c:if>
											<c:if test="${fn:length(order.receiverPhoneNum) == 10}">
												${fn:substring(order.receiverPhoneNum, 0, 3)}-${fn:substring(order.receiverPhoneNum, 3, 6)}-${fn:substring(order.receiverPhoneNum, 6, 10)}
											</c:if>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row">
										<div class="tb-left">주소</div>
									</th>
									<td colspan="3">
										<div class="tb-left"><span>(${order.deliveryPostNum})</span><span>${order.deliveryAddress}</span>,&nbsp;<span>${order.deliveryAddressDetail}</span></div>
									</td>
								</tr>
							
								<tr>
									<th scope="row">
										<div class="tb-left">배송메세지</div>
									</th>
									<td colspan="3">
										<div class="tb-left">${order.deliveryMemo}</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
	
					<div class="modal-content-3">
						<h5 class="h5"><strong>주문상품정보</strong></h5>
					
						<table class="table order-list-table">
							<thead>
								<tr class="text-center">
									<th scope="row">이미지</th>
									<th scope="row">주문상품</th>
									<th scope="row">수량</th>
									<th scope="row">가격</th>		
									<th scope="row">처리상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${order.productList}" var="product" >
								<tr class="text-center">
									<td>
										<div class="tb-center"><img src="../product/productImage?productId=${product.productId}&productUsecase=THUMBNAIL" style="width: 100px; height: 100px"></div>
									</td>
									<td>
										<div class="tb-left">${product.productName}</div>
									</td>					
									<td>
										<div class="tb-center">${product.cartCount}</div>
									</td>
									<td>
										<div class="tb-center"><strong><font color="#FF5D00"><fmt:formatNumber value="${product.productPrice}" pattern="#,##0" />원</font></strong></div>
									</td>
									<td>
										<div class="tb-center">
											<c:if test="${order.deliveryStatus == 'DELIVERY_STAY'}">
												<div class="tm-status-circle pending ml-2"></div><strong><font color="gold">배송대기</font></strong>
											</c:if>
											<c:if test="${order.deliveryStatus == 'DELIVERY_ING'}">
												<div class="tm-status-circle moving ml-2"></div><strong><font color="limegreen">배송중</font></strong>
											</c:if>
											<c:if test="${order.deliveryStatus == 'DELIVERY_COMPLETE'}">
												<div class="tm-status-circle deliver-clear ml-2"></div><strong><font color="black">배송완료</font></strong>
											</c:if>
											<c:if test="${order.deliveryStatus == 'DELIVERY_CANCEL'}">
												<div class="tm-status-circle cancelled ml-2"></div><strong><font color="crimson">주문취소</font></strong>
											</c:if>
											
										</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="6" style=text-align:right;>
										<fmt:formatNumber value="${order.orderTotalPrice}" pattern="#,##0" />원(상품구매금액) + 0원(배송료) = <b><fmt:formatNumber value="${order.orderTotalPrice}" pattern="#,##0" /></b>원
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
	<!-- 모달컨텐츠영역 end-->
	            </div>
	        </div>
	    </div>
	<!-- 모달 끝 -->
	</div>
</c:forEach>
<%-- 주문 상세보기 모달 끝 --%>
<%-- 주문 수정 모달 시작 --%>
<c:forEach items="${orderList}" var="order" >
	<div class="modal fade" id="orderUpdateModal-${order.orderNumber}">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">주문상세내역</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
					<!-- Modal body -->
				<div class="modal-body">
					<form action="#" id="orderUpdateSubmit-${order.orderNumber}" class="orderUpdateSubmit" >
						<div class="modal-content-1">
							<h5 class="h5"><strong>주문자정보</strong></h5>
							
							<table class="table table-sm table-bordered">
								<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
								</colgroup>
							    
								<tbody>
									<tr>
										<th scope="row">
											<div class="tb-left">주문번호</div>
										</th>
										<td>
										<div class="tb-left">${order.orderNumber}</div>
										</td>			
										<th scope="row">
											<div class="tb-left">주문일자</div>
										</th>
										<td>
											<div class="tb-left"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
										</td>				
									</tr>
								                    
									<tr>
										<th scope="row">
											<div class="tb-left">주문자</div>
										</th>
										<td>
											<div class="tb-left">${order.memberName}</div>
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
											<div class="d-flex align-items-center">
												<textarea id="orderMemo-${order.orderNumber}" rows="1" style="resize: none; width:95%;">${order.orderMemo}</textarea>
											</div>
											<div id="orderMemo-error-message-${order.orderNumber}" class="text-danger" style="font-size: 0.7rem"></div>
										</td>								
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-content-2">
							<h5 class="h5"><strong>배송지 정보</strong></h5>
							
							<table class="table table-sm table-bordered">
								<colgroup>
									<col width="120">
									<col width="*">
									<col width="120">
									<col width="*">
								</colgroup>
							
								<tbody>
									<tr>
										<th scope="row">
											<div class="tb-left">송장번호</div>
										</th>
										<td colspan="3">
											<div class="tb-left">${order.deliveryNum}</div>
										</td>
									</tr>
								
									<tr>
										<th scope="row" style="width:10%">
											<div class="tb-left">수취인</div>
										</th>
										<td style="width:40%">
											<div class="tb-left d-flex align-items-center">
												<input id="receiverName-${order.orderNumber}" value="${order.receiverName}" style="width: 60%;" required />
											</div>
											<div id="receiverName-error-message-${order.orderNumber}" class="text-danger" style="font-size: 0.7rem"></div>
										</td>
										<th style="width:10%">
											<div class="tb-right">연락처</div>
										</th>
										<td style="width:40%">
											<div class="tb-right">
												<input id="receiverPhoneNum-${order.orderNumber}" value="${order.receiverPhoneNum}" style="width: 80%;" required />
											</div>
											<div id="receiverPhoneNum-error-message-${order.orderNumber}" class="text-danger" style="font-size: 0.7rem"></div>
										</td>
									</tr>
								
									<tr>
										<th scope="row">
										<div class="tb-left">주소</div>
										</th>
										<td colspan="3">
											<div class="input-group d-flex justify-content-start w-100">
												<input id="deliveryPostNum-${order.orderNumber}" class="form-control" value="${order.deliveryPostNum}" style="width: 10%;" disabled/>
												<input id="deliveryAddress-${order.orderNumber}" class="form-control input-group-append" value="${order.deliveryAddress}" style="width: 50%;" disabled/>
												<input id="deliveryAddressDetail-${order.orderNumber}" class="form-control input-group-append" value="${order.deliveryAddressDetail}" style="width: 20%;" />
												<div class="input-group-append">
													<button class="btn btn-secondary callPostcodeAPI" type="button" id="postcodeButton-${order.orderNumber}" >주소검색</button>
												</div>
											</div>
											<div id="error-message-${order.orderNumber}" class="text-danger" style="font-size: 0.7rem"></div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="tb-left">배송메세지</div>
										</th>
										<td colspan="3">
											<div class="tb-left">${order.deliveryMemo}</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
		                    
						<div class="modal-content-3">
							<h5 class="h5"><strong>주문상품정보</strong></h5>
						
							<table class="table order-list-table">
								<thead>
									<tr class="text-center">
										<th scope="row">이미지</th>
										<th scope="row">주문상품</th>
										<th scope="row">수량</th>
										<th scope="row">가격</th>		
										<th scope="row">처리상태</th>
									</tr>
								</thead>
								<tbody id="orderProductData">
									<c:forEach items="${order.productList}" var="product" >
										<tr class="text-center productList" data-product-id="${order.orderNumber}-${product.productId}" >
											<td>
												<div class="tb-center"><img src="../product/productImage?productId=${product.productId}&productUsecase=THUMBNAIL" style="width: 100px; height: 100px"></div>
											</td>
											<td>
												<div class="product-name">${product.productName}</div>
											</td>					
											<td>
												<div class="tb-center">${product.cartCount}</div>
											</td>
											<td>
												<div class="tb-center"><strong><fmt:formatNumber value="${product.productPrice}" pattern="#,##0" />원</strong></div>
											</td>
											<td>
												<div class="d-flex justify-content-center">
													<select class="form-control deliveryStatus" id="deliveryStatus-${order.orderNumber}-${product.productId}" style="width:60%;">
														<option value="DELIVERY_STAY" <c:if test="${order.deliveryStatus == 'DELIVERY_STAY'}">selected</c:if> >배송대기</option>
														<option value="DELIVERY_ING" <c:if test="${order.deliveryStatus == 'DELIVERY_ING'}">selected</c:if> >배송중</option>
														<option value="DELIVERY_COMPLETE" <c:if test="${order.deliveryStatus == 'DELIVERY_COMPLETE'}">selected</c:if> >배송완료</option>
														<option value="DELIVERY_CANCEL" <c:if test="${order.deliveryStatus == 'DELIVERY_CANCEL'}">selected</c:if> >주문취소</option>
													</select>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4" style=text-align:right;>
											<div class="d-flex justify-content-end align-items-center mt-1">
												<fmt:formatNumber value="${order.orderTotalPrice}" pattern="#,##0" />원(상품구매금액) + 0원(배송료) = <b><fmt:formatNumber value="${order.orderTotalPrice}" pattern="#,##0" /></b>원
											</div>
										</td>
										<td colspan="2" class="pr-0">
											<div class="d-flex justify-content-end align-items-center">
												<button type="submit" class="btn btn-secondary btn-sm">수정</button>
											</div>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</form>
						<!-- 모달컨텐츠영역 end-->
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<%-- 주문 수정 호출 모달 끝 --%>