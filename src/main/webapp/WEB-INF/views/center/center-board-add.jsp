<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>고객센터</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/center.css">
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
    <section class="page-container mb-5" style="max-width: 1200px;">
        <!-- Breadcrumbs 영역 시작-->
        <nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../index.html"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="../center/center-board-list.html">고객센터</a></li>
                <li class="breadcrumb-item active" aria-current="page">기타문의</li>
            </ol>
        </nav>
        <!-- Breadcrumbs 영역 해제-->

        <!-- 메인 컨테이너 -->
        <div class="list-container">
            <!-- 서브 네비게이터 시작 -->
            <div class="d-flex justify-content-center">
                <h2 class="h2 mb-5 border-bottom" style="width: 100px;">기타문의</h2>
            </div>
            <ul class="nav nav-tabs justify-content-center mb-3">
                <li class="nav-item">
                    <a class="nav-link" href="../center/center-board-list.html">공지사항</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../center/center-board-list.html">상품문의</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="../center/center-board-list.html">기타문의</a>
                </li>
            </ul>
            <!-- 서브 네비게이터 종료 -->

            <!-- 게시글 작성 컴포넌트 시작 -->
            <div class="card my-4">
                <div class="card-body">
                    <form action="#" id="boardWriteForm">
                        <div class="form-group d-flex align-items-center">
                            <div class="form-title">
                                <label class="control-label" for="memberName"><b>이름</b></label>
                            </div>
                            <div class="form-content">
                                <input class="form-control" id="memberName" type="text" value="엄상식" readonly>
                            </div>
                        </div>
                        <hr class="hr"/>
                        <!-- 상품 문의 작성 페이지시 visible-->
                        <!-- 주문에 대한 문의가 아님. 구매자가 주문 이전에 상품에 대한 질문을 하는 곳. -->
                        <div class="form-group d-flex align-items-center" id="productListForm">
                            <div class="form-title">
                                <b>유형</b>
                            </div>
                            <div class="form-content d-flex flex-grow-1">
                                <div class="form-start d-flex align-items-center border-left">
                                    <label for="category" class="text-center">카테고리</label>
                                    <select class="form-control" id="category">
                                        <option value="bread">Bread</option>
                                        <option value="cake">Cake</option>
                                        <option value="desert">Desert</option>
                                    </select>
                                </div>
                                <div class="form-end d-flex align-items-center border-left">
                                    <label for="boardProductName" class="text-center">상품이름</label>
                                    <select class="form-control" id="boardProductName">
                                        <option value="pid1">옥수수빵</option>
                                        <option value="pid2">옥수수식빵</option>
                                        <option value="pid3">생크림빵</option>
                                        <option value="pid4">단팥빵</option>
                                        <option value="pid5">메론빵</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr class="hr"/>
                        <!-- 상품 문의 작성 페이지 속성 종료 -->
                        <!-- 리뷰 작성 페이지일 경우 visible-->
                        <div class="form-group d-flex align-items-center w-100" id="productReviewForm">
                            <div class="form-title border-right w-30" style="height: 40px;">
                                <label for="content" style="margin-right: 22px; line-height: 40px;"><b>리뷰 상품</b></label>
                            </div>
                            <div class="form-content max-width d-flex justify-content-center align-items-center" style="margin:0;">
                                <div class="square-img"><img src="../img/cake/갸또 쇼꼴라.jpg" class="img-fluid"></div>
                                <span id="reviewProdName" class="mx-3">상품명 :&emsp;[<b>갸또 쇼콜라</b>]</span>
                                <span id="reviewProdPrice" class="mx-3">가격 :&emsp;[<b>5,000원</b>]</span>
                            </div>
                        </div>
                        <hr class="hr"/>
                        <!-- 리뷰 작성 페이지 속성 끝-->
                        <div class="form-group d-flex" id="boradTitleForm">
                            <div class="form-title d-flex align-items-center">
                                <label for="title" style="margin: 0;"><b>제목</b></label>
                            </div>
                            <div class="form-content d-flex flex-grow-1">
                                <div class="form-start" style="width: 75%">
                                    <input type="text" class="form-control" id="title">
                                </div>
                                <div class="form-end d-flex justify-content-start mt-1" style="width: 40%">
                                    <!--
                                    <div class="custom-control custom-checkbox flex-grow-1">
                                        <input type="checkbox" class="custom-control-input" id="confirmHTML" checked>
                                        <label class="custom-control-label" for="confirmHTML" style="width:auto;">
                                            <small class="form-text text-muted">HTML태그 허용</small>
                                        </label>
                                    </div>
                                    -->
                                    <div class="custom-control custom-checkbox flex-grow-1 ml-2">
                                        <input type="checkbox" class="custom-control-input" id="secretBorad" checked>
                                        <label class="custom-control-label" for="secretBorad" style="width:auto;">
                                            <small class="form-text text-muted">게시글 비공개 여부</small>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="hr"/>
                        <!-- 게시글 텍스트에리어 영역. smarteditor2 사용해서 끌어오려다가 잘 안됨. -->
                        <div class="form-group d-flex" id="boradContentForm">
                            <div class="form-title d-flex align-items-center">
                                <label for="boardContent" style="margin: 0;"><b>내용</b></label>
                            </div>
                            <div class="form-content" style="width: 56%">
                                <textarea class="form-control" id="boardContent" rows="10"></textarea>
                            </div>
                        </div>
                        <hr class="hr"/>
                        <div class="form-group d-flex" id="boardFileForm">
                            <div class="form-title d-flex align-items-center">
                                <label for="attachment" style="margin: 0;"><b>첨부</b></label>
                            </div>
                            <div class="form-content">
                                <input type="file" class="form-control-file" id="attachment">
                            </div>
                        </div>
                        <hr class="hr"/>
                        <div class="form-group d-flex justify-content-end">
                            <button type="submit" class="btn btn-secondary mr-1" id="boardSubmitButton">등록하기</button>
                            <a class="btn btn-secondary buttonAnchor" href="../center/center-board-list.html">목록보기</a>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 게시글 작성 컴포넌트 종료 -->
        </div>
    </section>

    <footer>
    	<br>
        <div class="footer-container d-flex justify-content-center align-items-center">
            <img src="https://i.ibb.co/PZPP7Br/logo.png" width="150px" style="margin-right:50px;" >
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

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../js/center.js"></script>
</body>
</html>