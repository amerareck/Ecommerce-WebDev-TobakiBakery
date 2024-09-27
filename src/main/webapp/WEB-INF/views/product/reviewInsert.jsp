<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/center.css">

<hr class="hr" />

<section class="page-container mb-5" style="max-width: 1200px;">
    <!-- Breadcrumbs 영역 시작-->
    <nav class="breadcrumb-container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
            <li class="breadcrumb-item active" aria-current="page">${breadcrumb}</li>
        </ol>
    </nav>
    <!-- Breadcrumbs 영역 종료-->

    <!-- 메인 컨테이너 -->
    <div class="list-container">

        <!-- 게시글 작성 컴포넌트 시작 -->
        <div class="card my-4">
            <div class="card-body">
                <form action="${formAction}" method="post" enctype="multipart/form-data" id="boardWriteForm">
                    <!-- 로그인한 회원의 아이디 표시 -->
                    <div class="form-group d-flex align-items-center">
                        <div class="form-title">
                            <label class="control-label" for="memberName"><b>아이디</b></label>
                        </div>
                        <div class="form-content" style="margin-left: 40px;">
                            <input class="form-control" id="memberName" type="text" name="${author}" value="${memberId}" readonly />
                        </div>
                    </div>

                    <hr class="hr" />
                    <!-- 리뷰 작성 페이지일 경우 visible-->
                    <div class="form-group d-flex align-items-center w-100" id="productReviewForm">
                        <div class="form-title border-right w-30" style="height: 40px;">
                            <label for="content" style="margin-right: 22px; line-height: 40px;"><b>리뷰 상품</b></label>
                        </div>
                        <div class="form-content max-width d-flex justify-content-center align-items-center" style="margin:0;">
                            <div class="square-img"><img src="${pageContext.request.contextPath}${productImageUrl}" class="img-fluid"></div>
                            <span id="reviewProdName" class="mx-3">상품명 :&emsp;[<b>${productName}</b>]</span>
                            <span id="reviewProdPrice" class="mx-3">가격 :&emsp;[<b>${productPrice}원</b>]</span>
                        </div>
                    </div>
                    <!-- 리뷰 점수 -->
					<div class="form-group d-flex" id="reviewPointForm">
					    <div class="form-title d-flex align-items-center">
					        <label for="reviewPoint" style="margin: 0;"><b>평점</b></label>
					    </div>
					    <div class="form-content d-flex flex-grow-1">
					        <select class="form-control" id="reviewPoint" name="reviewPoint" value="${board.reviewPoint}" required>
					            <option value="1">1점</option>
					            <option value="2">2점</option>
					            <option value="3">3점</option>
					            <option value="4">4점</option>
					            <option value="5">5점</option>
					        </select>
					    </div>
					</div>

                    <hr class="hr" />
                    <!-- 리뷰 제목 -->
                    <div class="form-group d-flex" id="boradTitleForm">
                        <div class="form-title d-flex align-items-center">
                            <label for="title" style="margin: 0;"><b>제목</b></label>
                        </div>
                        <div class="form-content d-flex flex-grow-1">
                            <div class="form-start" style="width: 75%">
                                <input type="text" class="form-control" id="title" name="${postTitle}" value="${board.title}" required>
                            </div>
                        </div>
                    </div>

                    <hr class="hr" />
                    <!-- 리뷰 내용 -->
                    <div class="form-group d-flex" id="boradContentForm">
                        <div class="form-title d-flex align-items-center">
                            <label for="boardContent" style="margin: 0;"><b>내용</b></label>
                        </div>
                        <div class="form-content" style="width: 56%">
                            <textarea class="form-control" id="boardContent" name="${postContent}" rows="10" required>${board.content}</textarea>
                        </div>
                    </div>

                    <hr class="hr" />
                    <!-- 첨부 파일 -->
                    <div class="form-group d-flex" id="boardFileForm">
                        <div class="form-title d-flex align-items-center">
                            <label for="attachment" style="margin: 0;"><b>첨부</b></label>
                        </div>
                        <div class="form-content">
                            <c:if test="${updateBoard == 'show'}">
                                <div id="savedFileNamesRavel" class="mb-1"><b>현재 첨부된 파일</b></div>
                                <c:if test="${empty board.savedFileNames}">
                                    <div id="notFoundAttachFiles" class="mb-1">현재 첨부된 파일이 존재하지 않습니다.</div>
                                </c:if>
                                <c:forEach items="${board.savedFileNames}" var="fileName">
                                    <div id="${fileName}" class="savedFiles">
                                        <span>${fileName}</span>
                                        <button type="button" name="deleteImage" class="d-inline-block btn btn-link p-1 deleteImage">삭제</button>
                                    </div>
                                </c:forEach>
                                <hr class="hr mt-1" />
                                <input id="boardIdForDeleteImage" name="reviewId" type="hidden" value="${board.boardId}" />
                            </c:if>

                            <input type="file" class="form-control-file mt-3" id="attachment" name="${postFile}" multiple="multiple" />
                        </div>
                    </div>

                    <hr class="hr" />
                    <!-- 등록 및 수정 버튼 -->
                    <div class="form-group d-flex justify-content-end">
                        <c:if test="${updateBoard != 'show'}">
                            <button type="submit" class="btn btn-secondary mr-1" id="boardSubmitButton">등록하기</button>
                        </c:if>
                        <c:if test="${updateBoard == 'show'}">
                            <button type="submit" class="btn btn-secondary mr-1" id="boardSubmitButton">수정하기</button>
                        </c:if>
                        <a class="btn btn-secondary buttonAnchor" href="${pageContext.request.contextPath}/product/review/list?productId=${productId}">목록보기</a>
                    </div>
                    <input type="hidden" id="timestamp" name="timestamp" />
                    <input name="productId" type="hidden" value="${productId}" />
                   
                </form>
            </div>
        </div>
        <!-- 게시글 작성 컴포넌트 종료 -->
    </div>
</section>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
