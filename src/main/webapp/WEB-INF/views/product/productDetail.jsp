<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itemDetail.css">

<hr class="hr" />

<!-- 상세페이지 -->
<div id="contentWrapper">
    <div id="contentWrap">
        <nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/product/productListAll?categoryName=${categoryName }">
                <c:if test="${categoryName=='BREAD'}">빵</c:if>
                <c:if test="${categoryName=='CAKE'}">케이크</c:if>
                <c:if test="${categoryName=='DESSERT'}">디저트</c:if>
                </a>
                </li>
            </ol>
        </nav>
        <div id="productDetail" class="fixed_view">
            <div class="page_body">
                <!-- 상품 설명 상단 -->
                <div class="thumb-info">
                    <!-- 상품 왼쪽 이미지 -->
                    <div class="thumb-wrap">
                        <img src="productImage?productId=${prodDetail.productId}&productUsecase=THUMBNAIL">
                    </div>
                    <!-- thumb-wrap -->
                    <!-- 상품 오른쪽 정보 -->
                    <div class="thumb-info-text">
                        <!-- 상품 정보 -->
                        <form action="" method="post" id="productDetailForm">
                            <div class="info">
                                <div class="info_inner_outer">
                                    <div class="info_inner">
                                        <!-- 상품 이름 출력 -->
                                        <h3 class="tit-prd">${prodDetail.productName}</h3>
                                        <br>
                                        <!-- 상품 정보 테이블 -->
                                        <div class="table-opt">
                                            <table class="table">
                                                <colgroup>
                                                    <col width="90">
                                                    <col width="*">
                                                </colgroup>
                                                <tbody>
                                                    <!-- 판매가격 -->
                                                    <tr class="for_price">
                                                        <th scope="row">
                                                            <div class="tb-left">판매가격</div>
                                                        </th>
                                                        <td class="price">
                                                            <div class="tb-left">
                                                                <b><fmt:formatNumber value="${prodDetail.productPrice}" pattern="#,##0" />원</b>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <!-- 보관방법 -->
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="tb-left">보관방법</div>
                                                        </th>
                                                        <td class="price">
                                                            <div class="tb-left">직사광선을 피하고 서늘한 곳 보관(개봉 후 냉장보관)</div>
                                                        </td>
                                                    </tr>
                                                    <!-- 배송비 -->
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="tb-left">배송비</div>
                                                        </th>
                                                        <td class="price">
                                                            <div class="tb-left">배송조건 : 3000원 (30,000원 이상 구매 시 무료)</div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                            <!-- 상품 수량 -->
                                            <div>
                                                <label for="exampleSelect1" class="form-label mt-4" style="margin-right: 30px">상품 수량</label>
                                                <select class="form-select" id="exampleSelect1" name="cartCount">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                    <option>6</option>
                                                    <option>7</option>
                                                    <option>8</option>
                                                    <option>9</option>
                                                    <option>10</option>
                                                </select> 개
                                            </div>
                                            <input type="hidden" name="productId" value="${prodDetail.productId}" />
                                            <input type="hidden" name="productCurrentPrice" value="${prodDetail.productPrice}" />
                                        </div>

                                        <!-- 상품 구매정보 버튼 -->
                                        <div class="prd-btn">
                                            <button type="button" class="btn btn-light" id="buyButton">구매하기</button>
                                            <button type="button" class="btn btn-light" id="cartButton">장바구니</button>
                                        </div>
                                    </div>
                                    <!-- info_inner -->
                                </div>
                                <!-- info_inner_outer -->
                            </div>
                        </form>
                    </div>
                    <!-- thumb-info-text -->
                </div>
                <!-- thumb-info -->

                <!-- 상품 추천단 -->
                <div class="item-wrap recommend">
                    <div class="item-recommend-top">
                        <b>스마트 추천 상품</b> 이 상품을 구매한 분들이 아래 상품도 함께 주문하셨습니다.
                    </div>
                    <div class="row">
                        <c:forEach items="${prodSmart}" var="prodSmart">
                            <div class="col-md-3">
                                <div class="card">
                                    <a href="${pageContext.request.contextPath}/product/productDetail?productId=${prodSmart.productId}">
                                        <img src="productImage?productId=${prodSmart.productId}&productUsecase=THUMBNAIL" class="card-img-top">
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title">${prodSmart.productName}</h5>
                                        <p class="card-text"><fmt:formatNumber value="${prodSmart.productPrice}" pattern="#,##0" />원</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- 상품 상세 정보단 페이지 -->
                <div class="tab_cont for_shopdetail">
                    <div class="list-navigator">
                        <ul class="nav nav-tabs w-100" role="tablist">
                            <li class="nav-item w-50 text-center" role="presentation">
                                <a class="nav-link active" id="tab-detail-info" data-toggle="tab" href="#detail-info" aria-selected="true" role="tab">상품상세정보</a>
                            </li>
                            <li class="nav-item w-50 text-center" role="presentation">
                                <a class="nav-link" id="tab-product-reviews" data-toggle="tab" href="#product-reviews" aria-selected="true" role="tab">상품후기</a>
                            </li>
                        </ul>
                    </div>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade show active" id="detail-info" role="tabpanel">
                            <p>
                                <img src="productImage?productId=${prodDetail.productId}&productUsecase=DETAIL" class="img-fluid" alt="상품 상세 이미지">
                            </p>
                        </div>
                        <div class="tab-pane fade" id="product-reviews" role="tabpanel">
                            <!-- 상품후기 목록 및 내용을 볼 수 있는 부분입니다. -->
                            <div class="container mt-5">
                                <h2 style="text-align: center;">상품 후기</h2>
                                <br>
                                <div class="accordion" id="accordionExample">
                                    <!-- 후기 리스트 테이블 -->
                                    <table class="table table-bordered mt-3">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>작성일</th>
                                                <th>평점</th>
                                                <th>조회</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="review" items="${reviews}">
                                                <tr>
                                                    <td>${review.productReviewId}</td>
                                                    <td>
                                                        <div class="card">
                                                            <div class="card-header" id="heading${review.productReviewId}">
                                                                <h2 class="mb-0">
                                                                    <button class="btn text-left" type="button" data-toggle="collapse" data-target="#collapse${review.productReviewId}" aria-expanded="true" aria-controls="collapse${review.productReviewId}" style="background-color: white; color: black;">
                                                                        <strong>${review.reviewTitle}</strong>
                                                                    </button>
                                                                </h2>
                                                            </div>
                                                            <div id="collapse${review.productReviewId}" class="collapse" aria-labelledby="heading${review.productReviewId}" data-parent="#accordionExample">
                                                                <div class="card-body">
                                                                    <c:if test="${review.imageOriginalName != null}">
                                                                        <img src="data:image/${review.imageType};base64,${review.imageData}" class="img-fluid">
                                                                    </c:if>
                                                                    <p>${review.reviewContent}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>${review.memberId}</td>
                                                    <td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy-MM-dd"/></td>
                                                    <td>${review.reviewPoint}</td>
                                                    <td>${review.reviewViews}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-right mb-3">
                                    <a class="btn btn-secondary float-right btn-bottom" href="${pageContext.request.contextPath}/product/addBoard?productId=${prodDetail.productId}">후기작성하기</a>
                                </div>
                            </div>
                            <!-- 상품후기 목록 및 내용 끝입니다. -->
                        </div>
                    </div>
                </div>
            </div>
            <!--#page_body 끝-->
        </div>
        <!--#productDetail 끝-->
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
