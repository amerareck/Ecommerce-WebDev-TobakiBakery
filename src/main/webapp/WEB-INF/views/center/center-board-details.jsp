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
        <!-- Breadcrumbs 영역 종료-->

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

            <!-- 게시글 섹션 시작-->
            <div class="card mb-4 mt-4">
                <div class="card-body">
                    <div class="post-info">
                        <h4 class="card-title h4 board-title">결제하기 클릭이 안되요. ㅠㅠ</h4>
                        <p class="card-text">
                            <small class="text-muted">글번호: </small>
                            <small class="text-muted board-index">2</small>
                            <small class="text-muted"> | 등록일: </small>
                            <small class="text-muted board-timestamp">2024.08.04 12:08:25</small>
                            <small class="text-muted"> | 등록자: </small>
                            <small class="board-author">홍*동</small>
                            <small class="text-muted"> | 조회수: </small></small>
                            <small class="border-views">1232</small>
                        </p>
                    </div>
                    <hr>
                    <div class="post-content">
                        <p class="card-text">
                            구매 했는데 결제하기 버튼이 클릭이 안되네요.<br>
                            결제가 안 나와요.<br>
                            몇번을 시도하다가 지쳐서 글 남겨요.<br>
                            어떻게 하면 되나요?<br><br>
                            그리고 핸드폰으로는 결제할 수 없는건가요?<br>
                            핸드폰으로 결제하기 눌러도 결제가 안되더라구요.ㅠㅠ
                        </p>
                    </div>
                    
                    <a href="../center/center-board-list.html" class="btn btn-outline-secondary float-right mr-1">목록으로</a>
                    <a href="#" class="btn btn-outline-secondary float-right mr-1">삭제</a>
                    <a href="../center/center-board-add.html" class="btn btn-outline-secondary float-right mr-1">수정</a>
                </div>
            </div>
            <!-- 게시글 섹션 종료-->

            <div id="commentArea">
                <!-- 댓글 리스트 -->
                <div id="commentList">
                    <ul class="list-group mb-4">
                        <li class="list-group-item">
                            <div class="reply-author">
                                <p><strong>글 작성자</strong> <small class="text-muted">2024-08-04 13:12:34</small> 
                                    <button class="btn btn-light btn-sm disabled commentDelete" ><i class="fas fa-times"></i></button>
                                </p>
                            </div>
                            <div class="reply-content">
                                <p>저도 같은 문제를 겪고 있습니다. 해결 방법이 궁금하네요.</p>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="reply-author">
                                <p><strong>관리자</strong> <small class="text-muted">2024-08-04 13:15:22</small>
                                    <button class="btn btn-light btn-sm disabled commentDelete"><i class="fas fa-times"></i></button>
                                </p>
                            </div>
                            <div class="reply-content">
                                <p>안녕하세요, 고객님. 불편을 드려 죄송합니다. 현재 해당 문제를 확인 중에 있습니다. 빠른 시일 내에 해결하도록 하겠습니다.</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 댓글 리스트 종료 -->
                <hr class="hr"/>
                <!-- 댓글 작성 폼 시작 -->
                <div class="form-container ml-1 my-4" id="commentWrite">
                    <form class="d-flex flex-column" id="commentForm">
                        <label for="commentCentent" class="mb-1">댓글</label>
                        <div class="form-group d-flex align-items-center w-100">
                            <textarea class="form-control w-80 mr-2" id="commentCentent" rows="3" placeholder="내용"></textarea>
                            <button type="submit" class="btn btn-secondary btn-bottom w-20 btn-submit">등록</button>
                        </div>
                        
                        <div class="form-group d-flex justify-content-end">
                            <div class="form-input-wrapper d-flex justify-content-center">
                                <div class="form-input-wrapper d-flex align-items-center">
                                    <label class="control-label mb-0 mr-3" for="memberName">작성자</label>
                                    <input class="form-control" id="memberName" type="text" style="margin-right: 0;" value="엄상식" disabled>
                                </div>
                            </div>
                            
                        </div>
                    </form>
                </div>
                <!-- 댓글 작성 폼 종료 -->
            </div>

            <hr class="hr"/>
            <!-- 이전/이후 게시판 리스트 시작 -->
            <table class="table table-hover my-4">
                <thead class="thead-light">
                    <tr>
                        <th>#</th>
                        <th>제목</th>
                        <th>이름</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><b>3</b></td>
                        <td><a href="#">취소문의요&ensp;<span class="badge badge-info">NEW</span></a></td>
                        <td>라*임</td>
                        <td>2024-08-04</td>
                        <td>1141</td>
                    </tr>
                    <tr>
                        <td><b>2</b></td>
                        <td><a href="#">결제하기 클릭이 안되요. ㅠㅠ&ensp;<span class="badge badge-primary">답변완료</span></a></td>
                        <td>홍*동</td>
                        <td>2024-08-03</td>
                        <td>1232</td>
                    </tr>
                    <tr>
                        <td><b>1</b></td>
                        <td><a href="#"><i class="fas fa-lock fa-xs"></i> 택배가 젖어 왔어요&ensp;<span class="badge badge-primary">답변완료</span></a></td>
                        <td>민*종</td>
                        <td>2024-08-03</td>
                        <td>1037</td>
                    </tr>
                </tbody>
            </table>
            <!-- 이전/이후 게시판 리스트 종료 -->
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="../js/center.js"></script>
</body>
</html>