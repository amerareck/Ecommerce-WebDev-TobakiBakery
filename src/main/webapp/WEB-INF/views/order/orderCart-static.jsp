<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderCart.css">
    

    <!-- 콘텐츠 시작 -->
        <div id="contentWrap" style="border-top: 1px solid #e7e8e9 !important;">
			<nav class="breadcrumb-container">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="../index.html" style="color: black !important;"><i class="fas fa-home"></i></a></li>
	                <li class="breadcrumb-item"><a href="../order/orderCart-static.html" style="color: black !important;">장바구니</a></li>            
	            </ol>
        	</nav>  
            <div id="content">
                <!-- 장바구니 타이틀 -->
                <h1 id="page_top">장바구니</h1>
                
                <!-- 장바구니 카드 -->
                <div id="cartWrap">
                    <!-- 장바구니 테이블 -->
                    <div id="cartTable">
                        <table>
                            <colgroup>
                                <col width="5%">
                                <col width="25%">
                                <col width="30%">
                                <col width="15%">
                                <col width="15%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                                <tr class="table-warning">
                                    <th scope="row"><div class="tb_check">선택</div></th>
                                    <th scope="row"><div class="tb_img">사진</div></th>
                                    <th scope="row"><div class="tb_title">상품명</div></th>
                                    <th scope="row"><div class="tb_quantity">수량</div></th>
                                    <th scope="row"><div class="tb_price">결제예정가</div></th>
                                    <th scope="row"><div class="tb_delete">선택</div></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 테이블 정적 내용물 -->
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td><a href="../product/itemDetail-static.html"><img src="${pageContext.request.contextPath}/resources/image/bread/자연효모빵.jpg" width="100px"></a></td>
                                    <td><a href="../product/itemDetail-static.html" style="color: black !important;">자연효모빵</a></td>
                                    <td>
	                                    <div class="quantity-control">
					                        <button>-</button>
					                        <input type="text" value="2" min="1" max="10">
					                        <button>+</button>
				   						</div>
                                    </td>                                    
                                    <td class="currentPrice" data-unit-price="4600">9,200원</td>
                                    <td><button class="btn btn-danger btn-sm">삭제</button></td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td><a href="../product/itemDetail-static.html"><img src="${pageContext.request.contextPath}/resources/image/bread/오렌지케익.jpg" width="100px"></a></td>
                                    <td><a href="../product/itemDetail-static.html" style="color: black !important;">오렌지케익</a></td>
                                    <td>
	                                    <div class="quantity-control">
					                        <button onclick="minus();">-</button>
					                        <input type="text" value="1" min="1" max="10">
					                        <button onclick="plus();">+</button>
				   						</div>
                                    </td>
                                    <td class="currentPrice" data-unit-price="22000">22,000원</td>
                                    <td><button class="btn btn-danger btn-sm">삭제</button></td>
                                </tr>

                                <!-- 총 금액 -->
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="basket_totalprice">
                                            총 구매 금액: <strong>85,800원</strong>
                                        </div>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="cartNotice">
                        <div class="flt">
                            <ul class="dot_list">
                                <li>장바구니의 상품별 할인가는 "미리 계산된 가격" 입니다</li>
                                <li>주문서의 쿠폰변경시 실제 가격은 달라질 수 있습니다</li>
                                <li>상품 한개당 최대 구매가능 개수는 10개입니다</li>
                            </ul>
                        </div>
                    </div>
                    <!-- 주문버튼 -->
                    <div class="btns_order">
                        <button type="button" class="btn btn-outline-secondary">선택삭제</button>
                        <button type="button" class="btn btn-outline-secondary">계속 쇼핑하기</button>
                        <button type="button" class="btn btn-outline-secondary">장바구니 비우기</button>
                        <button type="button" class="btn btn-outline-danger">선택상품 주문하기</button>
                    </div>                        
                </div>
                <!-- cartWrap -->
            </div>
            <!-- page_body -->
        </div>
        <!-- contentWrap -->
    </div>
    <!-- 콘텐츠 끝 -->
    
    <!-- 푸터자리 -->
     
    <script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>

