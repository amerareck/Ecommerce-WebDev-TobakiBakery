<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/alert.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/center.css">
	
	<hr class="hr" />
    
    <section class="page-container mb-5" style="max-width: 1200px;">
        <!-- Breadcrumbs 영역 시작-->
        <nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/center">고객센터</a></li>
                <li class="breadcrumb-item active" aria-current="page">${breadcrumb}</li>
            </ol>
        </nav>
        <!-- Breadcrumbs 영역 해제-->

        <!-- 메인 컨테이너 -->
        <div class="list-container">
		<%@include file="/WEB-INF/views/center/boardSubNavigation.jsp" %>

            <!-- 게시글 작성 컴포넌트 시작 -->
            <div class="card my-4">
                <div class="card-body">
                    <form action="${formAction}" method="post" enctype="multipart/form-data" id="boardWriteForm" >
                        <div class="form-group d-flex align-items-center">
                            <div class="form-title">
                                <label class="control-label" for="memberName"><b>아이디</b></label>
                            </div>
                            <div class="form-content" style="margin-left: 40px;">
                                <input class="form-control" id="memberName" type="text" name="${author}" value="엄상식" readonly />
                            </div>
                        </div>
                        <c:if test="${showCategory == 'show'}">
	                        <hr class="hr" />
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
	                                    <select class="form-control" id="boardProductName" name="productId">
	                                        <option value="1">옥수수빵</option>
	                                        <option value="2">옥수수식빵</option>
	                                        <option value="3">생크림빵</option>
	                                        <option value="4">단팥빵</option>
	                                        <option value="5">메론빵</option>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
                        </c:if>
                        <c:if test="${showReview == 'show'}">
	                        <hr class="hr" />
	                        <!-- 상품 문의 작성 페이지 속성 종료 -->
	                        <!-- 리뷰 작성 페이지일 경우 visible-->
	                        <div class="form-group d-flex align-items-center w-100" id="productReviewForm">
	                            <div class="form-title border-right w-30" style="height: 40px;">
	                                <label for="content" style="margin-right: 22px; line-height: 40px;"><b>리뷰 상품</b></label>
	                            </div>
	                            <div class="form-content max-width d-flex justify-content-center align-items-center" style="margin:0;">
	                                <div class="square-img"><img src="../resources/image/cake/갸또 쇼꼴라.jpg" class="img-fluid"></div>
	                                <span id="reviewProdName" class="mx-3">상품명 :&emsp;[<b>갸또 쇼콜라</b>]</span>
	                                <span id="reviewProdPrice" class="mx-3">가격 :&emsp;[<b>5,000원</b>]</span>
	                            </div>
	                        </div>
                        </c:if>
                        <hr class="hr"/>
                        <!-- 리뷰 작성 페이지 속성 끝-->
                        <div class="form-group d-flex" id="boradTitleForm">
                            <div class="form-title d-flex align-items-center">
                                <label for="title" style="margin: 0;"><b>제목</b></label>
                            </div>
                            <div class="form-content d-flex flex-grow-1">
                                <div class="form-start" style="width: 75%">
                                    <input type="text" class="form-control" id="title" name="${postTitle}">
                                </div>
                                <div class="form-end d-flex justify-content-start mt-1" style="width: 40%">
                                	<c:if test="${boardType != 'notice'}">
                                    <div class="custom-control custom-checkbox flex-grow-1 ml-2">
                                        <input type="checkbox" class="custom-control-input" id="secretBorad" name="${isSecret}" checked>
                                        <label class="custom-control-label" for="secretBorad" style="width:auto;">
                                            <small class="form-text text-muted">게시글 비공개 여부</small>
                                        </label>
                                    </div>
                                	</c:if>
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
                                <textarea class="form-control" id="boardContent" name="${postContent}" rows="10"></textarea>
                            </div>
                        </div>

                        <hr class="hr"/>
                        <div class="form-group d-flex" id="boardFileForm">
                            <div class="form-title d-flex align-items-center">
                                <label for="attachment" style="margin: 0;"><b>첨부</b></label>
                            </div>
                            <div class="form-content">
                                <input type="file" class="form-control-file" id="attachment" name="${postFile}" multiple="multiple" />
                            </div>
                        </div>
                        
                        <hr class="hr"/>
                        <div class="form-group d-flex justify-content-end">
                            <button type="submit" class="btn btn-secondary mr-1" id="boardSubmitButton">등록하기</button>
                            <a class="btn btn-secondary buttonAnchor" href="${pageContext.request.contextPath}/center" >목록보기</a>
                        </div>
                        <input type="hidden" id="timestamp" name="${timestamp}" />
                    </form>
                </div>
            </div>
            <!-- 게시글 작성 컴포넌트 종료 -->
        </div>
    </section>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>