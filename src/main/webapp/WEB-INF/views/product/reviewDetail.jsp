<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/center.css">

<hr class="hr" />

<section class="page-container mb-5" style="max-width: 1200px;">
    <!-- Breadcrumbs 영역 시작-->
    <nav class="breadcrumb-container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/product">상품</a></li>
            <li class="breadcrumb-item active" aria-current="page">상품후기</li>
        </ol>
    </nav>
    <!-- Breadcrumbs 영역 종료-->

    <!-- 메인 컨테이너 -->
    <div class="list-container">

        <!-- 게시글 섹션 시작-->
        <div class="card mb-4 mt-4">
            <div class="card-body">
                <div class="post-info">
                    <h4 class="card-title h4 board-title">${board.title}</h4>
                    <p class="card-text">
                        <small class="text-muted">글번호: </small>
                        <small class="text-muted board-index">${board.productReviewId}</small>
                        <small class="text-muted"> | 등록일: </small>
                        <small class="text-muted board-timestamp">
                            <fmt:formatDate value="${board.reviewDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
                        </small>
                        <small class="text-muted"> | 작성자: </small>
                        <small class="board-author">${board.memberId}</small>
                        <small class="text-muted"> | 조회수: </small>
                        <small class="border-views">${board.reviewViews}</small>
                    </p>
                </div>
                <hr>
                <div class="post-content">
                    <p class="card-text">
                        ${board.reviewContent}
                    </p>
                    <c:if test="${board.imageNames != null}">
                        <c:forEach items="${board.imageNames}" var="imageName">
                            <p><img src="${pageContext.request.contextPath}/product/review/image?imageName=${imageName}&reviewId=${board.productReviewId}" /></p>
                        </c:forEach>
                    </c:if>
                </div>
                
                <a href="${pageContext.request.contextPath}/product/list?productId=${board.productId}" class="btn btn-outline-secondary float-right mr-1" id="redirectPage">목록</a>
                <button type="button" id="removeBoardBotton" class="btn btn-outline-secondary float-right mr-1">삭제</button>
                <a href="${pageContext.request.contextPath}/product/update?productReviewId=${board.productReviewId}" class="btn btn-outline-secondary float-right mr-1">수정</a>
            </div>
        </div>
        <!-- 게시글 섹션 종료-->
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
