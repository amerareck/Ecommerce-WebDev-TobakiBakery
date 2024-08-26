<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage-order.css">
    
	<!-- 메인 content 부분입니다. -->
	<hr>
	<div class="container">
	<nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../index.html"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="../mypage-order.html">주문서 작성</a></li>
                
            </ol>
        </nav>
        <div class="main-content">
         
         <h1>주문서 작성</h1>
         <br>

        <section class="order-products">
            <h2>주문상품</h2>
            <table>
                <thead>
                    <tr>
                        <th>제품</th>
                        <th>수량</th>
                        <th>가격</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <a href="../product/itemDetail-static.html"><img src="${pageContext.request.contextPath}/resources/image/bread/자연효모빵.jpg" alt="제품 이미지" width=100px; height=100px;></a>
                            <span>자연효모빵</span>
                        </td>
                        <td>2개</td>
                        <td>9,200원</td>
                    </tr>
                    
                    <tr>
                    <td>
                    <a href="../product/itemDetail-static.html"><img src="${pageContext.request.contextPath}/resources/image/bread/오렌지케익.jpg" alt="제품 이미지" width=100px; height=100px;></a>
                    <span>오렌지 케잌</span>
                    </td>
                    <td>1개</td>
                    <td>22,000원</td>
                    </tr>
                  
                </tbody>
            </table>
            <div class="order-summary">
                주문 금액 31,200원 + 배송비  0원 = 주문 금액 31,200원
            </div>
        </section>

        <section class="order-info">
            <h2>주문자 정보</h2>
            <div class="section" style=width:500px;margin-left:20px;>
                <label for="orderName" >* 주문자 이름</label>
                <input type="text" id="orderName" name="orderName" value="황망고">
            </div>
            <div class="section" style=width:500px;margin-left:20px;>
                <label for="orderPhone">* 연락처</label>
                <div class="phone-group">
                    <input type="text" id="phonePart1" value="010">_
                    <input type="text" id="phonePart2" value="7658">_
                    <input type="text" id="phonePart3" value="3716">
                </div>
            </div>
            <div class="section" style=width:500px;margin-left:20px;>
                <label for="orderEmail">* 이메일</label>
                <div class="email-group">
                    <input type="text" id="emailPart1" value="backyang2121">
                    <span>@</span>
                    <input type="text" id="emailPart2" value="naver.com">
                </div>
            </div>
        </section>

        <section class="delivery-info">
            <h2>배송지 정보</h2>
            <div class="section" style=margin-left:20px;>
                <label>* 배송지 </label>
                <input type="radio" id="defaultAddress" name="addressOption" checked>
                기본 배송지 &nbsp;&nbsp;
                <input type="radio" id="newAddress" name="addressOption">
                신규 배송지 &nbsp;&nbsp;
                <div class="input-group">
                                    <input type="text"  id="postcode" name="postcode" placeholder="우편번호" readonly required style="width: 300px;">
                                    <div class="input-group-append">
                                        <button class="btn btn-secondary" type="button" onclick="execDaumPostcode()">우편번호검색</button>
                                    </div>
                                </div>
                                <input type="text" id="address" name="address" placeholder="주소" style="width: 400px; margin-top:10px;" readonly>
                                <input type="text"  id="address_detail" name="address_detail" placeholder="상세주소" style="width: 400px; margin-top:10px;">
                
            </div>
            <div class="section" style=width:500px;margin-left:20px;>
                <label for="receiverName">* 받으시는 분</label>
                <input type="text" id="receiverName" value="황망고">
            </div>
            <div class="section" style=width:500px;margin-left:20px;>
                <label for="address">* 배송지 주소</label>
                <input type="text" id="address" value="(03077)서울 종로구 창경궁로 254, 402호">
            </div>
            <div class="section" style=width:500px;margin-left:20px;>
                <label for="phoneNumber">* 휴대폰</label>
                <div class="phone-group">
                    <input type="text" id="phonePart1" value="010">_
                    <input type="text" id="phonePart2" value="7658">_
                    <input type="text" id="phonePart3" value="3716">
                </div>
            </div>
            <div class="section" style=width:500px;margin-left:20px;>
                <label for="deliveryMessage">주문 메시지</label>
                <textarea id="deliveryMessage" placeholder="배송 메시지를 선택해주세요."></textarea>
            </div>
        </section>


        <section class="final-payment-info">
            <h2>최종결제정보</h2>
            <div class="summary" >
                <div >총 주문금액: 31,200원</div>
                <div>총 배송비: 0원</div>
                <div>최종금액: 31,200원</div>
            </div>
            <a href="${pageContext.request.contextPath}/views/order/orderPay"><button type="submit">결제하기</button></a>
        </section>

        <section class="order-notice">
            <h2>주문시 주의사항</h2>
            <table>
                <thead>
                    <tr>
                        <th>제공받는자</th>
                        <th>목적</th>
                        <th>항목</th>
                        <th>보유기간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>토박이베이커리</td>
                        <td>상품 배송 및 서비스 제공, 고객 상담</td>
                        <td>이름, 연락처, 주소</td>
                        <td>구매 서비스 종료 후 3개월까지</td>
                    </tr>
                </tbody>
            </table>
            <div class="agreement">
                <input type="radio" id="agree" name="agreement" checked>
                동의합니다. &nbsp;&nbsp;
                <input type="radio" id="disagree" name="agreement">
                동의하지 않습니다. 
            </div>
        </section>
    </div>

		
		

	</div>
        
        
	
	
	<!-- content 부분 끝입니다. -->
	
	<script>function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = '';
	            var extraAddr = '';

	            
	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else { 
	                addr = data.jibunAddress;
	            }
	            
	            
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById('address').value = addr;
	            document.getElementById('address_detail').focus();
	        }
	    }).open();
	}	</script>

<%@include file="/WEB-INF/views/common/footer.jsp" %>