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
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/center">고객센터</a></li>
                <li class="breadcrumb-item active" aria-current="page">${breadcrumb}</li>
            </ol>
        </nav>
        <!-- Breadcrumbs 영역 종료-->

        <!-- 메인 컨테이너 -->
        <div class="list-container">
		<%@include file="/WEB-INF/views/center/boardSubNavigation.jsp" %>

            <!-- 게시글 섹션 시작-->
            <div class="card mb-4 mt-4">
                <div class="card-body">
                    <div class="post-info">
                        <h4 class="card-title h4 board-title">${board.title}</h4>
                        <p class="card-text">
                            <small class="text-muted">글번호: </small>
                            <small class="text-muted board-index">${board.boardId}</small>
                            <small class="text-muted"> | 등록일: </small>
                            <small class="text-muted board-timestamp">
                            	<fmt:formatDate value="${board.datetime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                            </small>
                            <small class="text-muted"> | 등록자: </small>
                            <small class="board-author">${board.memberId}</small>
                            <small class="text-muted"> | 조회수: </small>
                            <small class="border-views">${board.views}</small>
                        </p>
                    </div>
                    <hr>
                    <div class="post-content">
                        <p class="card-text">
                            ${board.content}
                        </p>
                        <c:if test="${board.imageNames != null}">
                        	<c:forEach items="${board.imageNames}" var="imageName" >
                        		<p><img src="${pageContext.request.contextPath}/center/image?type=${boardType}&imageName=${imageName}&boardId=${board.boardId}" /></p>
                        	</c:forEach>
                        </c:if>
                    </div>
                    
                    <a href="${pageContext.request.contextPath}/center/list?type=${boardType}" class="btn btn-outline-secondary float-right mr-1" id="redirectPage">목록</a>
                    <c:if test="${boardType=='notice'}">
                    	<sec:authorize access="hasRole('ROLE_ADMIN')">
		                    <button type="button" id="removeBoardBotton" class="btn btn-outline-secondary float-right mr-1">삭제</button>
		                    <a href="${pageContext.request.contextPath}/center/update?type=${boardType}&boardNum=${board.boardId}" class="btn btn-outline-secondary float-right mr-1">수정</a>
                    	</sec:authorize>
                    </c:if>
                    <c:if test="${boardType=='helpdesk'}">
	                    <button type="button" id="removeBoardBotton" class="btn btn-outline-secondary float-right mr-1">삭제</button>
	                    <a href="${pageContext.request.contextPath}/center/update?type=${boardType}&boardNum=${board.boardId}" class="btn btn-outline-secondary float-right mr-1">수정</a>
                    </c:if>
                </div>
            </div>
            <!-- 게시글 섹션 종료-->

            <div id="commentArea">
                <!-- 댓글 리스트 -->
                <div id="commentList">
                    <ul class="list-group mb-4">
                    	<c:forEach items="${board.commentList}" var="comment" >
	                        <li class="list-group-item">
	                            <div class="reply-author">
	                                <p><strong id="memberId-${comment.commentId}">${comment.memberId}</strong> <small class="text-muted"><fmt:formatDate value="${comment.commentDatetime}" pattern="YYYY-MM-dd HH-mm-ss" /> </small> 
	                                    <button class="btn btn-light btn-sm disabled commentDelete" id="commentId-${comment.commentId}" ><i class="fas fa-times"></i></button>
	                                </p>
	                            </div>
	                            <div class="reply-content">
	                                <p>${comment.commentContent}</p>
	                            </div>
	                        </li>
                    	</c:forEach>
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
                                    <label class="control-label mb-0 mr-3" for="memberName">아이디</label>
                                    <input class="form-control" id="memberName" type="text" style="margin-right: 0;" value="<sec:authentication property="principal.username"/>" disabled>
                                </div>
                            </div>
                            <input type="hidden" id="boardType" value="${boardType}" />
                        </div>
                    </form>
                </div>
                <!-- 댓글 작성 폼 종료 -->
            </div>

            <hr class="hr"/>
            <%@include file="/WEB-INF/views/center/boardDetailSubList.jsp" %>
        </div>
	</section>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>