<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이템 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/itemList.css">
</head>
<body>
<div id="wrap">
    <!-- 헤더 자리 -->
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
									<a class="nav-link" href="../">메인
										<span class="sr-only">(current)</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../member/login">로그인</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../member/member-info">회원가입</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../mypage/mypage-main">마이페이지</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="../center/center-board-list" role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="../center/center-board-list">공지사항</a>
										<a class="dropdown-item" href="../center/center-board-list">상품문의</a>
										<a class="dropdown-item" href="../center/center-board-list">상품후기</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="../admin/admin-main">관리자 사이트</a>
									</div>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
			<!--중앙 메인 로고 프레임-->
			<div class="main-logo">
				<a href="../"><img src="../resources/image/main-logo.png" width="150px"></a>
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
									<a class="dropdown-item py-2" href="../product/itemList-static"><i class="fa fa-bread-slice"></i> :: 빵</a>
									<a class="dropdown-item py-2" href="../product/itemList-static"><i class="fa fa-birthday-cake"></i> :: 케이크</a>
									<a class="dropdown-item py-2" href="../product/itemList-static"><i class="fa fa-cookie"></i> :: 디저트</a>
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
									<a class="nav-link" href="../product/itemList-best">베스트</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../product/itemList-best">신상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../product/itemList-best">추천상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../center/center-board-list">공지사항</a>
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
									<a href="../order/orderCart-static"><i class="fas fa-shopping-cart icon-size"></i></a>									
									<span class="cart-count">3</span>
								</div>
							</div>
						</form>
					</nav>
				</div>
			</div>
		</div>
	</header>
	
    <!-- content 부분입니다. -->
    <div id="contentWrapper">
			<nav class="breadcrumb-container">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="../index" style="color: black !important;"><i class="fas fa-home"></i></a></li>
	                <li class="breadcrumb-item"><a href="../order/orderCart-static" style="color: black !important;">빵</a></li>            
	            </ol>
        	</nav>      
        <!-- 상품 목록 내용 -->
        <div id="contentWrap">
            <div id="top_category">
                <ul>
                    <li id="bread"><a href="../prduct/itemList_bread">빵</a></li>
                    <li id="cake"><a href="../product/itemList_cake">케이크</a></li>
                    <li id="desert"><a href="../product/itemList_desert">디저트</a></li>
                </ul>
            </div>
            <div class="item_info">
                <div class="item_total">
                    총 <b>8</b> 개의 상품이 있습니다
                </div>
            </div>
            <div class="item_wrap">
				<!-- 1행 -->
                <dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/걀렛뜨 데로와 푀유떼.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='../order/orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">걀렛뜨 데로와 푀유떼</a></li>
                            <li class="prd_price">9,800원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>
                
				<dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/로데브.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='../order/orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">로데브</a></li>
                            <li class="prd_price">12,000원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>

				<dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/바따르.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">바따르</a></li>
                            <li class="prd_price">3,800원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>

				<dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/자연효모빵.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='../product/orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">자연효모빵</a></li>
                            <li class="prd_price">1,800원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>

				<!-- 2행 -->
                <dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/카스텔라.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">카스텔라</a></li>
                            <li class="prd_price">3,000원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>
                
				<dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/오렌지케익.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">오렌지케익</a></li>
                            <li class="prd_price">4,400원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>

				<dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/마블케익.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">마블케익</a></li>
                            <li class="prd_price">4,000원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>

				<dl class="item_elem">
                    <div class="badge">BEST</div>
                    <dt class="thumb">
                        <img class="prd_img" src="../resources/image/bread/뺑드미.jpg" onclick="location.href='../product/itemDetail-static'">
                        <div class="cart-overlay" onclick="location.href='../order/orderCart-static'">
                            <img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
                        </div>
                    </dt>
                    <dd>
                        <ul>
                            <li class="prd_title"><a href="../product/itemDetail-static">뺑드미</a></li>
                            <li class="prd_price">3,300원</li>
                            <li class="prd_review"><em>상품후기</em> (8)</li>
                        </ul>
                    </dd>
                </dl>
            </div>

			
        <!-- 페이지네이션 -->
        <div>
          <ul class="pagination">
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
          </ul>
        </div>
    </div>

    <!-- content 부분 끝입니다. -->
    
    <!-- footer 자리 -->
    <footer>
    	<br>
        <div class="footer-container d-flex justify-content-center align-items-center">
            <img src="https://i.ibb.co/PZPP7Br/logo.png" width="150px" style="margin-right:50px"; >
            <div>
                <p>(주)토박이</p>
                <p>호스팅제공자: KOSA | 이메일 <a href="tobaki@test.com" class="text-danger">tobaki@test.com</a></p>
                <p>조장 양정윤 | 사업자등록번호 xxx-xx-xxxxx[사업자정보확인] | 통신판매업신고번호 2024-서울종로-0402호</p>
                <p>주소: 서울시 종로구 창경궁로 254 동원빌딩</p>
                <p>토박이베이커리는 KOSA의 위탁으로 오티아이3기 4명의 학생들이 운영하는 쇼핑몰입니다.</p>
                <p>copyright (c) 2024 by TOBAKI. all rights reserved.</p>
            </div>
        </div>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
