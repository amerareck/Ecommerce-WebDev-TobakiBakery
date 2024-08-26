<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="resources/css/common.css">
	<link rel="stylesheet" href="resources/css/itemList.css">
	<link rel="stylesheet" href="resources/css/index.css">
    <title>메인 페이지</title>
    <style>
    .display_best {
    	display: flex;
 	 	justify-content: center;
    }
    
    .display_new {
    	display: flex;
 	 	justify-content: center;
 	 }
    
    </style>
    </head>
    <body>
    
    <div id="wrap">
    <!-- header 자리 -->
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
									<a class="nav-link" href="./">메인
										<span class="sr-only">(current)</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="./member/login">로그인</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="./member/member-info">회원가입</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="./mypage/mypage-main">마이페이지</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="./center/center-board-list" role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="./center/center-board-list">공지사항</a>
										<a class="dropdown-item" href="./center/center-board-list">상품문의</a>
										<a class="dropdown-item" href="./center/center-board-list">상품후기</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="./admin/admin-main">관리자 사이트</a>
									</div>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
			<!--중앙 메인 로고 프레임-->
			<div class="main-logo">
				<a href="./"><img src="resources/image/main-logo.png" width="150px"></a>
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
									<a class="dropdown-item py-2" href="./product/itemList-static"><i class="fa fa-bread-slice"></i> :: 빵</a>
									<a class="dropdown-item py-2" href="./product/itemList-static"><i class="fa fa-birthday-cake"></i> :: 케이크</a>
									<a class="dropdown-item py-2" href="./product/itemList-static"><i class="fa fa-cookie"></i> :: 디저트</a>
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
									<a class="nav-link" href="./product/itemList-best">베스트</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="./product/itemList-best">신상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="./product/itemList-best">추천상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="./center/center-board-list">공지사항</a>
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
									<a href="./order/orderCart-static"><i class="fas fa-shopping-cart icon-size"></i></a>									
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
		
			<!-- 슬라이더 -->
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="resources/image/banner-img1.jpg" class="d-block w-100" onclick="location.href='./product/itemList-best'">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/image/banner-img2.jpg" class="d-block w-100" onclick="location.href='./product/itemList-best'">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/image/banner-img3.jpg" class="d-block w-100" onclick="location.href='./product/itemList-best'">
			    </div>
			  </div>
			 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev" style="border:hidden; background-color: transparent;">
			    <span class="carousel-control-prev-icon" aria-hidden="true" > </span>
			    <span class="sr-only">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next" style="border:hidden; background-color: transparent;">
			    <span class="carousel-control-next-icon" aria-hidden="true" >; </span>
			    <span class="sr-only">Next</span>
			  </button>
			</div>

			
			<div class="gap"></div>
			

			<div class="intro">
				<h3>꾸준히 사랑받는 <strong>베스트</strong></h3>
				<h5>자주 구매하는 빵, 식기전에 구매하세요~</h5>
			</div>

			
			<!-- 베스트 -->
			<div class="item_wrap" id="best">
				<!-- 1행 -->
				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/걀렛뜨 데로와 푀유떼.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">걀렛뜨 데로와 푀유떼</a></li>
							<li class="prd_price">9,800원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
				
				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/로데브.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./product/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">로데브</a></li>
							<li class="prd_price">12,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/바따르.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">바따르</a></li>
							<li class="prd_price">3,800원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/자연효모빵.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">자연효모빵</a></li>
							<li class="prd_price">1,800원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<!-- 2행 -->
				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/카스텔라.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">카스텔라</a></li>
							<li class="prd_price">3,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
				
				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/오렌지케익.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">오렌지케익</a></li>
							<li class="prd_price">4,400원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/마블케익.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">마블케익</a></li>
							<li class="prd_price">4,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">BEST</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/bread/뺑드미.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">뺑드미</a></li>
							<li class="prd_price">3,300원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
			</div>
			
			<div class="gap"></div>
			
			<div class="intro">
				<h3>새롭게 나온 <strong>신상품!</strong></h3>
				<h5>맛있는 신메뉴!</h5>
			</div>
			
			<!-- 신제품 -->
			<div class="item_wrap" id="new">
				<!-- 1행 -->
				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/cake/갸또 쇼꼴라.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">갸또 쇼콜라</a></li>
							<li class="prd_price">39,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
				
				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/cake/고구마 생크림 케익.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">고구마 생크림 케이크</a></li>
							<li class="prd_price">32,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/cake/샤를로뜨.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">샤를로뜨</a></li>
							<li class="prd_price">23,800원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/desert/라피누.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">라피누</a></li>
							<li class="prd_price">18,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<!-- 2행 -->
				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/cake/프레지에.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">프레지에</a></li>
							<li class="prd_price">43,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
				
				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/cake/티라미수.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">티라미수</a></li>
							<li class="prd_price">34,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/cake/쉭쎄.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">쉭쎄</a></li>
							<li class="prd_price">41,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>

				<dl class="item_elem">
					<div class="badge">NEW</div>
					<dt class="thumb">
						<img class="prd_img" src="resources/image/cake/까망베르 치즈케익.jpg" onclick="location.href='./product/itemDetail-static'">
						<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
							<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니로 이동">
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title"><a href="./product/itemDetail-static">까망베르 치즈케익</a></li>
							<li class="prd_price">30,000원</li>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
			</div>	
				
			<div class="gap"></div>
			
		</div>
	

	
	
		<!-- content 부분 끝입니다.-->
	    	
	    
    
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
	<script>
		$(document).ready(function () {
    $("footer").load("../common/Footer");
    $("header").load("../common/Header"); 
		});
</script>
</body>
</html>