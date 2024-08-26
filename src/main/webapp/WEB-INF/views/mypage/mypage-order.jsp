<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/mypage-order.css">
    
    <title>mypage-order</title>
    
    </head>
    <body>
	<header>
			<!-- 헤더의 상단 프레임 -->
            <div class="header-wrapper">
                <!--헤더 탑 영역-->
                <div class="header-top">
                    <!--왼쪽 상단 프레임-->
                    <div class="left-top"></div>
                    <!--오른쪽 상단 nav-->
                    <div class="right-top-nav">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light header-font">
                            <!--
                            <a class="navbar-brand" href="#">Navbar</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            -->
                            <div class="collapse navbar-collapse" id="navbarColor03">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="../index.html">메인
                                            <span class="sr-only">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../member/login.html">로그인</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../member/member-info.html">회원가입</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../mypage/mypage-main.html">마이페이지</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="../center/center-board-list.html" role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="../center/center-board-list.html">공지사항</a>
                                            <a class="dropdown-item" href="../center/center-board-list.html">상품문의</a>
                                            <a class="dropdown-item" href="../center/center-board-list.html">상품후기</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="../admin/admin-main.html">관리자 사이트</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <!--중앙 메인 로고 프레임-->
                <div class="main-logo">
                    <a href="../index.html"><img src="../img/main-logo.png" width="150px"></a>
                </div>
    
                <div class="d-flex" style="margin-left: 30px;">
                    <!-- 헤더의 하단 프레임-->
                    <div class="header-bottom container-fluid">
                        <nav class="top-nav navbar navbar-expand-lg navbar-light bg-light header-font w-100 pl-0">
                            <!--전체 카테고리 버튼-->
                            <div class="top-ctg-list">
                                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                    <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle header-font" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-bars"></i>&emsp;카테고리&emsp;
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                        <a class="dropdown-item py-2" href="../product/itemList-static.html"><i class="fa fa-bread-slice"></i> :: 빵</a>
                                        <a class="dropdown-item py-2" href="../product/itemList-static.html"><i class="fa fa-birthday-cake"></i> :: 케이크</a>
                                        <a class="dropdown-item py-2" href="../product/itemList-static.html"><i class="fa fa-cookie"></i> :: 디저트</a>
                                    </div>
                                </div><!--
                                <a href="#">"카테고리버튼"</a>
                                <div class="top-ctg">
                                    <div class="left-category clear">
                                        ul 태그를 통한 하단 리스트들~
                                    </div>
                                    -->
                            </div>
                            <!--추가 상단 네비게이션 리스트-->
                            <div class="top-menu collapse navbar-collapse" id="navbarColor03">
                                <ul class="navbar-nav mr-auto header-font-size ">
                                    <li class="nav-item">
                                        <a class="nav-link" href="../product/itemList-best.html">베스트</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../product/itemList-best.html">신상품</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../product/itemList-best.html">추천상품</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../center/center-board-list.html">공지사항</a>
                                    </li>
                                </ul>
                            </div>
                            <!--상단네비 검색 및 장바구니-->
                            <form action="#" id="headerSearch">
                                <div class="top-menu-finder-cart align-self-end">
                                    <div class="top-finder">
                                        <div class="input-group">
                                            <input class="form-control headerSearchInput" type="text" placeholder="상품 검색">
                                            <div class="input-group-append">
                                                <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="top-cart">
                                        <a href="../order/orderCart-static.html"><i class="fas fa-shopping-cart icon-size"></i></a>									
                                        <span class="cart-count">3</span>
                                    </div>
                                </div>
                            </form>
                        </nav>
                    </div>
                </div>
            </div>
	</header>
	
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
                            <a href="../product/itemDetail-static.html"><img src="../img/bread/자연효모빵.jpg" alt="제품 이미지" width=100px; height=100px;></a>
                            <span>자연효모빵</span>
                        </td>
                        <td>2개</td>
                        <td>9,200원</td>
                    </tr>
                    
                    <tr>
                    <td>
                    <a href="../product/itemDetail-static.html"><img src="../img/bread/오렌지케익.jpg" alt="제품 이미지" width=100px; height=100px;></a>
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
            <a href="../order/orderPay.html"><button type="submit">결제하기</button></a>
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
	<footer>
    	<br>
        <div class="footer-container d-flex justify-content-center align-items-center">
            <img src="https://i.ibb.co/PZPP7Br/logo.png" width="150px">
            <div>
                <p>(주)토박이</p>
                <p>호스팅제공자: KOSA | 이메일 <a href="mailto:tobaki@test.com">tobaki@test.com</a></p>
                <p>조장 양정윤 | 사업자등록번호 xxx-xx-xxxxx[사업자정보확인] | 통신판매업신고번호 2024-서울종로-0402호</p>
                <p>주소: 서울시 종로구 창경궁로 254 동원빌딩</p>
                <p>토박이특산물은 KOSA의 위탁으로 오티아이3기 4명의 학생들이 운영하는 쇼핑몰입니다.</p>
                <p>copyright (c) 2024 by TOBAKI. all rights reserved.</p>
            </div>
        </div>
    </footer>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
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

</body>
</html>


    