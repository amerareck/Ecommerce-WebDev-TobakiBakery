<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>토박이 베이커리 - 비밀번호 찾기</title>
    <link rel="stylesheet" href="https://bootswatch.com/4/sandstone/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/search-style.css">
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

    <div class="container">
        <!-- 네비게이션 시작 -->
        <nav class="breadcrumb">
            <a class="breadcrumb-item" href="../" onclick="location.href='../member/member-search-id'"><i class="fas fa-home"></i></a>
            <a class="breadcrumb-item" href="../member/member-search-pw" onclick="location.href='../member/member-search-pw'">비밀번호 찾기</a>
        </nav>
        <!-- 네비게이션 끝 -->

		<br>

        <!-- 컨텐츠 래퍼 시작 -->
        <div class="content-wrapper">
            <h1><b>아이디 찾기 / 비밀번호 찾기</b></h1>
            <br>

            <!-- 탭 메뉴 시작 -->
            <div class="tabs">
                <button class="tab-button" onclick="location.href='../member/member-search-id'">아이디찾기</button>
                <button class="tab-button active" onclick="location.href='../member/member-search-pw'">비밀번호 찾기</button>
            </div>
            <!-- 탭 메뉴 끝 -->

            <br>

            <!-- 아이디 찾기 폼 컨테이너 시작 -->
            <div class="form-container">
                <form>
                    <!-- 안내 문구 시작 -->
                    <h2>입력하신 정보와 일치하는 비밀번호입니다.</h2>
                    <!-- 안내 문구 끝 -->

                    <br><br>

                    <!-- 아이디 공개 시작 -->
                    <div class="username">
                        <h1>Qwer****34!</h1>
                    </div>
                    <!-- 아이디 공개 끝 끝 -->

                    <br><br>

                    <!-- 추가 안내 문구 시작 -->
                    <p class="info">고객님의 소중한 개인정보 보호를 위해 비밀번호 일부는 숨김 처리되어 안내됩니다.</p>
                    <!-- 추가 안내 문구 끝 -->

                    <br>

                    <!-- 확인 버튼 시작 -->
                    <button type="check" class="btn btn-dark" onclick="location.href='../member/login'">로그인</button>
                    <!-- 확인 버튼 끝 -->
                    
                    <br>
                </form>
            </div>
            <!-- 아이디 찾기 폼 컨테이너 끝 -->
        </div>
        <!-- 컨텐츠 래퍼 끝 -->
    </div>

    <footer>
    	<br>
        <div class="footer-container d-flex justify-content-center align-items-center">
            <img src="https://i.ibb.co/PZPP7Br/logo.png" width="150px" style="margin-right:50px"; >
            <div>
                <p>(주)토박이</p>
                <p>호스팅제공자: KOSA | 이메일 <a href="tobaki@test.com" class="text-danger">tobaki@test.com</a></p>
                <p>조장 양정윤 | 사업자등록번호 xxx-xx-xxxxx[사업자정보확인] | 통신판매업신고번호 2024-서울종로-0402호</p>
                <p>주소: 서울시 종로구 창경궁로 254 동원빌딩</p>
                <p>토박이특산물은 KOSA의 위탁으로 오티아이3기 4명의 학생들이 운영하는 쇼핑몰입니다.</p>
                <p>copyright (c) 2024 by TOBAKI. all rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- 스크립트 파일 포함 시작 -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- jQuery 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> <!-- Popper.js 라이브러리 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- Bootstrap JavaScript -->
    <!-- 스크립트 파일 포함 끝 -->

</body>
</html>
