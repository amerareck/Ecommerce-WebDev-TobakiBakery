<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>토박이 베이커리 - 회원정보수정</title>
    <link rel="stylesheet" href="https://bootswatch.com/4/sandstone/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/member-style.css">
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
            <a class="breadcrumb-item" href="../"><i class="fas fa-home"></i></a>
            <a class="breadcrumb-item" href="../mypage/mypage-main">마이페이지</a>
            <a class="breadcrumb-item" href="../member/member-edit">회원정보수정</a>
        </nav>
        <!-- 네비게이션 끝 -->

        <br>

        <!-- 회원가입 섹션 시작 -->
        <div class="signup-section">
            <h1><b>회원정보수정</b></h1>
            <br>
            <br>
            <form id="signupForm" action="" method="post" onsubmit="return editdateForm()">

                <!-- 회원정보 입력 헤더 시작 -->
                <div class="signup-header">
                    <h2><b>회원정보수정</b></h2>
                    <p>* 표시는 필수입력항목입니다.</p>
                </div>
                <!-- 회원정보 입력 헤더 끝 -->

                <br>

                <!-- 회원정보 입력 테이블 시작 -->
                <table class="table table-bordered" style="width: 900px; margin: 0 auto;">
                    <tbody>
                        <!-- 이름 입력 필드 시작 -->
                        <tr>
                            <td>* 이름</td>
                            <td><input type="text" class="form-control input-small" name="name" value="홍길동" required></td>
                        </tr>
                        <!-- 이름 입력 필드 끝 -->

                        <!-- 아이디 입력 필드 시작 -->
                        <tr>
                            <td>&nbsp;&nbsp;아이디</td>
                            <td>
                                <input type="text" class="form-control input-small" name="username" id="username" value="hgd1234" readonly required>
                            </td>
                        </tr>
                        <!-- 아이디 입력 필드 끝 -->

                        <!-- 비밀번호 입력 필드 시작 -->
                        <tr>
                            <td>* 비밀번호</td>
                            <td>
                                <input type="password" class="form-control input-small" name="password" id="password" required>
                                <small class="form-text text-muted">영문 대소문자/숫자/특수문자를 혼용하여 3종류 10-16자</small>
                            </td>
                        </tr>
                        <!-- 비밀번호 입력 필드 끝 -->

                        <!-- 비밀번호 확인 입력 필드 시작 -->
                        <tr>
                            <td>* 비밀번호 확인</td>
                            <td><input type="password" class="form-control input-small" name="password_confirm" id="password_confirm" required></td>
                        </tr>
                        <!-- 비밀번호 확인 입력 필드 끝 -->

                        <!-- 생일 및 성별 입력 필드 시작 -->
                        <tr>
                            <td>* 생일/성별</td>
                            <td>
                                <div class="d-flex align-items-center birthday-gender-row">
                                    <select class="form-control input-tiny" name="birth_year" required>
                                        <option>1900</option>
                                        <script>
                                            for (let i = new Date().getFullYear(); i >= 1900; i--) {
                                                document.write('<option value="'+i+'">'+i+'</option>');
                                            }
                                        </script>
                                    </select>
                                    <h6> 년 </h6>
                                    <select class="form-control input-tiny" name="birth_month" required>
                                        <option>10</option>
                                        <script>
                                            for (let i = 1; i <= 12; i++) {
                                                document.write('<option value="'+i+'">'+i+'</option>');
                                            }
                                        </script>
                                    </select>
                                    <h6> 월 </h6>
                                    <select class="form-control input-tiny" name="birth_day" required>
                                        <option>10</option>
                                        <script>
                                            for (let i = 1; i <= 31; i++) {
                                                document.write('<option value="'+i+'">'+i+'</option>');
                                            }
                                        </script>
                                    </select>
                                    <h6> 일 </h6>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="M" checked="checked" required>
                                        <label class="form-check-label">남</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="F" required>
                                        <label class="form-check-label">여</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!-- 생일 및 성별 입력 필드 끝 -->

                        <!-- 주소 입력 필드 시작 -->
                        <tr>
                            <td>* 주소</td>
                            <td>
                                <div class="input-group-append">
                                    <input type="text" class="form-control input-small-postcode" id="postcode" name="postcode" placeholder="03084" readonly required>
                                    &nbsp;
                                    <button class="btn btn-secondary" type="button" onclick="execDaumPostcode()">우편번호검색</button>
                                </div>
                                <input type="text" class="form-control mt-2" id="address" name="address" placeholder="주소" style="width: 500px;" value="서울 종로구 대학로 136" readonly>
                                <input type="text" class="form-control mt-2" id="address_detail" name="address_detail" placeholder="상세주소" value="103호" style="width: 500px;">
                            </td>
                        </tr>
                        <!-- 주소 입력 필드 끝 -->

                        <!-- 휴대폰 입력 필드 시작 -->
                        <tr>
                            <td>* 휴대폰</td>
                            <td>
                                <div class="form-row">
                                    <div class="col">
                                        <select class="form-control" name="phone_prefix" required>
                                            <option>010</option>
                                            <option>011</option>
                                            <option>012</option>
                                            <option>017</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" name="phone_middle_number" value="1234" required>
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" name="phone_last_number" value="1234" required>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!-- 휴대폰 입력 필드 끝 -->

                        <!-- 이메일 입력 필드 시작 -->
                        <tr>
                            <td>* 이메일</td>
                            <td>
                                <div class="input-group-append">
                                    <input type="text" class="form-control" name="email_local" style="width: 150px;" value="hgd1234" required>
                                    <span class="input-group-text">@</span>
                                    <input type="text" class="form-control" name="email_domain" id="email_domain" style="width: 150px;" required>
                                    <div class="input-group-append">
                                        <select class="form-control" name="email_select" id="email_select" required onchange="setEmailDomain()">
                                            <option value="">직접입력</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="gmail.com">gmail.com</option>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <button class="btn btn-secondary" type="button" onclick="showEmailAlert()">이메일 중복확인</button>
                                </div>
                            </td>
                        </tr>
                        <!-- 이메일 입력 필드 끝 -->

                        <!-- 본인확인 질문 및 답변 필드 시작 -->
                        <tr>
                            <td>* 본인확인 질문</td>
                            <td>
                                <div>
                                    <select class="form-control input-small" name="question" required>
                                        <option>가장 좋아하는 색깔은?</option>
                                        <option>가장 좋아하는 동물은?</option>
                                        <option>내가 다녔던 초등학교는?</option>
                                        <option>어렸을때의 별명은?</option>
                                        <option>현재 거주하고 있는 주소는?</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>* 본인확인 답변</td>
                            <td><input type="text" class="form-control input-small" name="answer" value="빨간색" required></td>
                        </tr>
                        <!-- 본인확인 질문 및 답변 필드 끝 -->

                    </tbody>
                </table>
                <!-- 회원정보 입력 테이블 끝 -->

                <br>
                <br>

                <!-- 가입 완료 및 이전 버튼 시작 -->
                <div class="form-group text-center">
                    <button type="submit-edit" class="btn btn-dark">수정완료</button>
                    <button type="button" class="btn btn-secondary" onclick="window.history.back()">이전으로</button>
                </div>
                <!-- 가입 완료 및 이전 버튼 끝 -->

            </form>
        </div>
        <!-- 회원가입 섹션 끝 -->
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
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="../js/member.js"></script>
    <!-- 스크립트 파일 포함 끝 -->
</body>
</html>