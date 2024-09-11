<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/center.css">
<body>

	<hr class="hr" />

    <section class="page-container" style="max-width: 1200px;">
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
        <div class="list-container mb-5">
		<%@include file="/WEB-INF/views/center/boardSubNavigation.jsp" %>

            <!-- 게시글 검색 컴포넌트 시작 -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="table-row-counter">총 3개의 게시물이 있습니다.</div>
                <form class="form-inline" id="boardSearchForm">
                    <div class="form-group mr-2">
                        <select class="form-control" id="searchCategory">
                            <option value="이름">이름</option>
                            <option value="제목">제목</option>
                            <option value="내용">내용</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label for="boardSearch" class="sr-only">검색</label>
                        <input type="text" class="form-control" id="boardSearch" placeholder="검색어를 입력해 주세요.">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary" style="border-color: transparent; padding-bottom: 5px;"><i class="fa fa-search"></i></button>
                        </div>
                    </div>

                </form>
            </div>
            <!-- 게시글 검색 컴포넌트 종료 -->
    
            <!-- 게시판 리스트 시작-->
            <table class="table table-hover mb-5">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">3</th>
                        <td><a href="${pageContext.request.contextPath}/center/detail?type=${boardType}">취소문의요&ensp; <span class="badge badge-info">NEW</span></a></td>
                        <td>라*임</td>
                        <td>2024/08/04</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td><a href="${pageContext.request.contextPath}/center/detail?type=${boardType}">결제하기 클릭이 안되요. ㅠㅠ&ensp; <span class="badge badge-primary">답변완료</span></a></td>
                        <td>ka******</td>
                        <td>2024/08/03</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td><a href="${pageContext.request.contextPath}/center/detail?type=${boardType}"><i class="fas fa-lock fa-xs"></i> 택배가 젖어 왔어요&ensp;<span class="badge badge-primary">답변완료</span></a></td>
                        <td>min******</td>
                        <td>2024/08/02</td>
                        <td>3</td>
                    </tr>
                    <!-- More rows as needed -->
                </tbody>
            </table>
            <!-- 게시판 리스트 종료-->

            <!-- 게시판 묶음 네비게이터 바 시작 -->
            <div class="paging-wrapper">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#">&laquo;</a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">4</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">5</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
              <!-- 게시판 묶음 네비게이터 바 종료 -->
    
            <a class="btn btn-secondary float-right btn-bottom" href="${pageContext.request.contextPath}/center/addBoard?type=${boardType}">글쓰기</a>
        </div>
    </section>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>