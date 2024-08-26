<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../css/common.css">  
    <link rel="stylesheet" href="../css/mypage.css">
    
    
    
    <title>mypage_main</title>
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
	<!-- 사이드바 부분입니다. -->
	<hr>
	<div class="container">
	<nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../index.html"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="../mypage/mypage-main.html">마이페이지</a></li>
                
                
            </ol>
            
        </nav>
        <div class="main-content">
       
            <aside class="sidebar">
            
            
                <h3>쇼핑정보</h3>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item"><a class="nav-link" href="../mypage/mypage-order-delivery.html">주문배송현황</a></li>
                                 
                </ul>
                <hr class="hr"/>
                
                <h3>활동정보</h3>
                <ul class="nav nav-pills flex-column">
                    
                    <li class="nav-item"><a class="nav-link" href="../order/orderCart-static.html">장바구니</a></li>                 
                    <li class="nav-item"><a class="nav-link" href="../mypage/mypage-review.html">나의 상품 후기</a></li>
                </ul>
                <hr class="hr"/>
                <h3>개인정보</h3>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item"><a class="nav-link" href="../member/member-member-edit.html">회원정보수정</a></li>
                    <li class="nav-item"><a class="nav-link" href="#"> <button id="delete-account">회원탈퇴</button></a></li>
                </ul>
            </aside>
            <!-- content부분입니다. -->
            <section class="content">
            
            
                <h2>마이페이지</h2>
                <div class="profile-info">
                    <div>
                        <p>황망고님 환영합니다.</p>
                       
                    </div>
                    
                </div>
                <div class="recent-orders">
                    <h3>최근 주문 정보</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>상품명</th>
                                <th>결제금액</th>
                                <th>주문일자</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        <tr>
                                <td>4</td>
                                <td><a href="../mypage/mypage-orderDetails.html" style=color:black;>후르츠케잌 외 2종</a></td>
                                <td>48,900원</td>
                                <td>2024-08-16</td>
                            </tr>
                            
                            <tr>
                                <td>3</td>
                                <td><a href="../mypage/mypage-orderDetails.html" style=color:black;>자연효모빵 외 3종</a></td>
                                <td>45,400원</td>
                                <td>2024-08-13</td>
                            </tr>
                            
                            <tr>
                                <td>2</td>
                                <td><a href="../mypage/mypage-orderDetails.html" style=color:black;>유산균 발효 식빵 외 2종</a></td>
                                <td>28,800원</td>
                                <td>2024-08-04</td>
                            </tr>
                            
                            <tr>
                                <td>1</td>
                                <td><a href="../mypage/mypage-orderDetails.html" style=color:black;>오렌지케잌 외 3종</a></td>
                                <td>38,400원</td>
                                <td>2024-07-20</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="recent-inquiries">
                    <h3>최근 문의 내역</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>게시판</th>
                                <th>글제목</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                         <tr>
                                <td>기타문의</td>
                                <td><a href="../member/memer-center-board-details.html" style=color:black;>택배가 젖어서 왔어요.</a></td>
                                <td>2024-08-13</td>
                            </tr>
                            
                            <tr>
                                <td>상품문의</td>
                                <td><a href="../member/member-center-board-details.html" style=color:black;>빵 실온보관 문의드립니다.</a></td>
                                <td>2024-08-04</td>
                            </tr>
                            
                             <tr>
                                <td>상품문의</td>
                                <td><a href="../member/member-center-board-details.html" style=color:black;>취소문의요.</a></td>
                                <td>2024-08-02</td>
                            </tr>
                            
                        </tbody>
                    </table>
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
                <p>토박이베이커리는 KOSA의 위탁으로 오티아이3기 4명의 학생들이 운영하는 쇼핑몰입니다.</p>
                <p>copyright (c) 2024 by TOBAKI. all rights reserved.</p>
            </div>
        </div>
    </footer>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
       
        document.getElementById('delete-account').addEventListener('click', function() {
           
            const userConfirmed = confirm("정말 탈퇴하시겠습니까?");
            
            if (userConfirmed) {
               
                alert("탈퇴가 완료되었습니다.");
                
            } else {
                
            }
        });
    </script>
</body>
</html>
    