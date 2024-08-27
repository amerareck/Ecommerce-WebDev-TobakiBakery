<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/center.css">
	<section class="page-container mb-5" style="max-width: 1200px;">
        <!-- Breadcrumbs 영역 시작-->
        <nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="getBoardList">고객센터</a></li>
                <li class="breadcrumb-item active" aria-current="page">기타문의</li>
            </ol>
        </nav>
        <!-- Breadcrumbs 영역 종료-->

        <!-- 메인 컨테이너 -->
        <div class="list-container">
		<%@include file="/WEB-INF/views/center/centerSubNavigor.jsp" %>

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
                    
                    <a href="getBoardList" class="btn btn-outline-secondary float-right mr-1">목록으로</a>
                    <button type="button" id="removeBoardBotton" class="btn btn-outline-secondary float-right mr-1">삭제</button>
                    <a href="getBoardDetail" class="btn btn-outline-secondary float-right mr-1">수정</a>
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
                        <td><a href="getBoardDetail">취소문의요&ensp;<span class="badge badge-info">NEW</span></a></td>
                        <td>라*임</td>
                        <td>2024-08-04</td>
                        <td>1141</td>
                    </tr>
                    <tr>
                        <td><b>2</b></td>
                        <td><a href="getBoardDetail">결제하기 클릭이 안되요. ㅠㅠ&ensp;<span class="badge badge-primary">답변완료</span></a></td>
                        <td>홍*동</td>
                        <td>2024-08-03</td>
                        <td>1232</td>
                    </tr>
                    <tr>
                        <td><b>1</b></td>
                        <td><a href="getBoardDetail"><i class="fas fa-lock fa-xs"></i> 택배가 젖어 왔어요&ensp;<span class="badge badge-primary">답변완료</span></a></td>
                        <td>민*종</td>
                        <td>2024-08-03</td>
                        <td>1037</td>
                    </tr>
                </tbody>
            </table>
            <!-- 이전/이후 게시판 리스트 종료 -->
        </div>
	</section>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>