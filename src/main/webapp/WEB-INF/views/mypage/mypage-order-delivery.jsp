<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/mypage.css">

<title>mypage-order-delivery</title>
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
				<li class="breadcrumb-item"><a href="../index.html"><i
						class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item"><a href="../mypage/mypage-main.html">마이페이지</a></li>
				<li class="breadcrumb-item"><a
					href="../mypage/mypage-order-delivery.html">주문내역</a></li>

			</ol>
		</nav>
		<div class="main-content">
			<aside class="sidebar">
				<h3>쇼핑정보</h3>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link"
						href="../mypage/mypage-order-delivery.html">주문배송현황</a></li>

				</ul>
				<hr class="hr" />

				<h3>활동정보</h3>
				<ul class="nav nav-pills flex-column">

					<li class="nav-item"><a class="nav-link"
						href="../order/orderCart-static.html">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../mypage/mypage-review.html">나의 상품 후기</a></li>
				</ul>
				<hr class="hr" />
				<h3>개인정보</h3>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link"
						href="../member/member-edit.html">회원정보수정</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><button
								id="delete-account">회원탈퇴</button></a></li>
				</ul>
			</aside>
			<!-- content부분입니다. -->
			<section class="content">
				<h2>주문내역</h2>
				<div class="orderdelivery-summary">
					<p>
						<span>황망고</span>님이 쇼핑몰에서 주문한 내역입니다.
					</p>
				</div>
				<div class="orderdelivery-filter">
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('today')">오늘</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('yesterday')">어제</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('week')">일주일</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('month')">1개월</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('three-months')">3개월</button>
					<button type="button" class="btn btn-secondary"
						onclick="setDateRange('year')">1년</button>
				</div>
				<div class="orderdelivery-search">
					<input type="date" id="start-date" value=""> <input
						type="date" id="end-date" value="">
					<button type="button" class="btn btn-secondary">조회</button>
				</div>
				<table class="orderdelivery-table">
					<thead>
						<tr>
							<th style="text-align: center;">주문일자</th>
							<th style="text-align: center;">상품명</th>
							<th style="text-align: center;">결제금액</th>
							<th style="text-align: center;">상태</th>
							<th style="text-align: center;">주문상세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align: center;">2024-08-16</td>
							<td style="text-align: center;">자연효모빵 외 1종</td>
							<td style="text-align: center;">31,200원</td>
							<td style="text-align: center;">배송중</td>
							<td style="text-align: center;"><a
								href="../mypage/mypage-orderDetail.html"><button type="button"
										class="btn btn-secondary">조회</button></a></td>
						</tr>

						<tr>
							<td style="text-align: center;">2024-08-04</td>
							<td style="text-align: center;">팡도르 외 3종</td>
							<td style="text-align: center;">28,400원</td>
							<td style="text-align: center;">배송완료</td>
							<td style="text-align: center;"><a
								href="../mypage/mypage-orderDetail.html"><button type="button"
										class="btn btn-secondary">조회</button></a></td>
						</tr>

						<tr>
							<td style="text-align: center;">2024-07-23</td>
							<td style="text-align: center;">걀렛뜨 데로와 푀유떼 외 4종</td>
							<td style="text-align: center;">78,900원</td>
							<td style="text-align: center;">배송완료</td>
							<td style="text-align: center;"><a
								href="../mypage/mypage-orderDetail.html"><button type="button"
										class="btn btn-secondary">조회</button></a></td>
						</tr>
					</tbody>
				</table>
				<br> <br> <br>
				<div class="orderdelivery-notice">
					<p>주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</p>

				</div>
			</section>
		</div>
	</div>

	<!-- content 부분 끝입니다. -->
	<footer>
		<br>
		<div
			class="footer-container d-flex justify-content-center align-items-center">
			<img src="https://i.ibb.co/PZPP7Br/logo.png" width="150px">
			<div>
				<p>(주)토박이</p>
				<p>
					호스팅제공자: KOSA | 이메일 <a href="mailto:tobaki@test.com">tobaki@test.com</a>
				</p>
				<p>조장 양정윤 | 사업자등록번호 xxx-xx-xxxxx[사업자정보확인] | 통신판매업신고번호
					2024-서울종로-0402호</p>
				<p>주소: 서울시 종로구 창경궁로 254 동원빌딩</p>
				<p>토박이베이커리는 KOSA의 위탁으로 오티아이3기 4명의 학생들이 운영하는 쇼핑몰입니다.</p>
				<p>copyright (c) 2024 by TOBAKI. all rights reserved.</p>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		document.getElementById('delete-account').addEventListener('click',
				function() {

					const userConfirmed = confirm("정말 탈퇴하시겠습니까?");

					if (userConfirmed) {

						alert("탈퇴가 완료되었습니다.");

					} else {

					}
				});
	</script>
	<script>
		function setDateRange(range) {
			const today = new Date();
			let startDate, endDate;

			endDate = today.toISOString().split('T')[0];

			if (range === 'today') {
				startDate = endDate;
			} else if (range === 'yesterday') {
				const yesterday = new Date(today);
				yesterday.setDate(today.getDate() - 1);
				startDate = yesterday.toISOString().split('T')[0];
				endDate = startDate;
			} else if (range === 'week') {
				const weekAgo = new Date(today);
				weekAgo.setDate(today.getDate() - 7);
				startDate = weekAgo.toISOString().split('T')[0];
			} else if (range === 'month') {
				const monthAgo = new Date(today);
				monthAgo.setMonth(today.getMonth() - 1);
				startDate = monthAgo.toISOString().split('T')[0];
			} else if (range === 'three-months') {
				const threeMonthsAgo = new Date(today);
				threeMonthsAgo.setMonth(today.getMonth() - 3);
				startDate = threeMonthsAgo.toISOString().split('T')[0];
			} else if (range === 'year') {
				const yearAgo = new Date(today);
				yearAgo.setFullYear(today.getFullYear() - 1);
				startDate = yearAgo.toISOString().split('T')[0];
			}

			document.getElementById('start-date').value = startDate;
			document.getElementById('end-date').value = endDate;
		}
	</script>
</body>
</html>
