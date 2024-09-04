<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 주문 상세 호출 모달 시작 --%>
<div class="modal fade" id="orderDetailsModal">
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
									<div class="tb-left">CJ대한통운 - 12345678910</div>
								</td>
							</tr>
						
							<tr class="">
								<th scope="row" style="width:15%">
									<div class="tb-left">수취인</div>
								</th>
								<td style="width:40%">
									<div class="tb-left">황망고</div>
								</td>
								<th style="width:15%">
									<div class="tb-right">연락처</div>
								</th>
								<td style="width:30%">
									<div class="tb-right">010-7658-3716</div>
								</td>
							</tr>
							
							<tr>
								<th scope="row">
									<div class="tb-left">주소</div>
								</th>
								<td colspan="3">
									<div class="tb-left">(03077)서울 종로구 창경궁로 254, 402호</div>
								</td>
							</tr>
						
							<tr>
								<th scope="row">
									<div class="tb-left">배송메세지</div>
								</th>
								<td colspan="3">
									<div class="tb-left">문 앞에 놔주세요.</div>
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
							<tr class="text-center">
								<td>
									<div class="tb-center"><img src="../resources/image/bread/자연효모빵.jpg" style="width: 100px; height: 100px"></div>
								</td>
								<td>
									<div class="tb-left">자연효모빵</div>
								</td>					
								<td>
									<div class="tb-center">2</div>
								</td>
								<td>
									<div class="tb-center"><strong><font color="#FF5D00">9,200원</font></strong></div>
								</td>
								<td>
									<div class="tb-center"><strong><font color="blue">배송중</font></strong></div>
								</td>
							</tr>
							
							<tr class="text-center">
								<td>
									<div class="tb-center"><img src="../resources/image/bread/오렌지케익.jpg" style="width: 100px; height: 100px"></div>
								</td>
								<td>
									<div class="tb-left">오렌지케잌</div>
								</td>
								<td>
									<div class="tb-center">1</div>
								</td>
								<td>
									<div class="tb-center"><strong><font color="#FF5D00">22,000원</font></strong></div>
								</td>
								<td>
									<div class="tb-center"><strong><font color="blue">배송중</font></strong></div>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" style=text-align:right;>31,200원(상품구매금액) + 0원(배송료) = <b>31,200</b>원</td>
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
<%-- 주문 상세보기 모달 끝 --%>
<%-- 주문 수정 모달 시작 --%>
<div class="modal fade" id="orderUpdateModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
		<div class="modal-header">
			<h3 class="modal-title">주문상세내역</h3>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>

			<!-- Modal body -->
		<div class="modal-body">
			<form action="#" id="orderUpdateSubmit">
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
									<div class="d-flex align-items-center">
									<textarea id="memo" rows="1" style="resize: none; width:95%;"></textarea>
									</div>
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
									<div class="tb-left">CJ대한통운 - 12345678910</div>
								</td>
							</tr>
						
							<tr>
								<th scope="row" style="width:15%">
									<div class="tb-left">수취인</div>
								</th>
								<td style="width:40%">
									<div class="tb-left d-flex align-items-center">
										<input id="receiver" value="황망고" style="width: 60%;" required />
									</div>
								</td>
								<th style="width:15%">
									<div class="tb-right">연락처</div>
								</th>
								<td style="width:30%">
									<div class="tb-right">
										<input id="receiverPhone" value="010-7658-3716" style="width: 80%;" required />
									</div>
								</td>
							</tr>
						
							<tr>
								<th scope="row">
								<div class="tb-left">주소</div>
								</th>
								<td colspan="3">
									<div class="input-group d-flex justify-content-start w-100">
										<input id="recevierPostNo" class="form-control" value="03077" style="width: 10%;" disabled/>
										<input id="recevierAddr" class="form-control input-group-append" value="서울 종로구 창경궁로 254" style="width: 50%;" disabled/>
										<input id="recevierDetailsAddr" class="form-control input-group-append" value="402호" style="width: 20%;" required />
										<div class="input-group-append">
											<button class="btn btn-secondary " type="button" onclick="getPostcodeAndAddress()">주소검색</button>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<div class="tb-left">배송메세지</div>
								</th>
								<td colspan="3">
									<div class="tb-left">문 앞에 놔주세요.</div>
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
							<tr class="text-center">
								<td>
									<div class="tb-center"><img src="../resources/image/bread/자연효모빵.jpg" style="width: 100px; height: 100px"></div>
								</td>
								<td>
									<div class="product-name">자연효모빵</div>
								</td>					
								<td>
									<div class="tb-center">2</div>
								</td>
								<td>
									<div class="tb-center"><strong>9,200원</strong></div>
								</td>
								<td>
									<div class="d-flex justify-content-center">
										<select class="form-control" id="orderState1" style="width:50%;">
											<option value="1">배송대기</option>
											<option value="2" selected>배송중</option>
											<option value="3">배송완료</option>
											<option value="4">주문취소</option>
										</select>
									</div>
								</td>
							</tr>
							<tr class="text-center">
								<td>
									<div class="tb-center"><img src="../resources/image/bread/오렌지케익.jpg" style="width: 100px; height: 100px"></div>
								</td>
								<td>
									<div class="product-name">오렌지케잌</div>
								</td>
								<td>
									<div class="tb-center">1</div>
								</td>
								<td>
									<div class="tb-center"><strong>22,000원</strong></div>
								</td>
								<td>
									<div class="d-flex justify-content-center">
										<select class="form-control" id="orderState2" style="width:50%;">
											<option value="1">배송대기</option>
											<option value="2" selected>배송중</option>
											<option value="3">배송완료</option>
											<option value="4">주문취소</option>
										</select>
									</div>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4" style=text-align:right;>
									<div class="d-flex justify-content-end align-items-center mt-1">
										31,200원(상품구매금액) + 0원(배송료) = <b>31,200</b>원
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
<%-- 주문 수정 호출 모달 끝 --%>