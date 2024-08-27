<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search-style.css">
    <div class="container">
        <!-- 네비게이션 시작 -->
        <nav class="breadcrumb">
            <a class="breadcrumb-item" href="../"><i class="fas fa-home"></i></a>
            <a class="breadcrumb-item" href="../member/member-search-pw">비밀번호 찾기</a>
        </nav>
        <!-- 네비게이션 끝 -->

        <br>

        <!-- 컨텐츠 래퍼 시작 -->
        <div class="content-wrapper">
            <h1><b>아이디 찾기 / 비밀번호 찾기</b></h1>
            <br>

            <!-- 탭 메뉴 시작 -->
            <div class="tabs">
                <button class="tab-button" onclick="location.href='../member/member-search-id'">아이디찾기</button> <!-- 아이디 찾기 탭 -->
                <button class="tab-button active" onclick="location.href='../member/member-search-pw'">비밀번호 찾기</button> <!-- 비밀번호 찾기 탭 -->
            </div>
            <!-- 탭 메뉴 끝 -->

            <br>

            <!-- 안내 문구 시작 -->
            <p class="info">아이디, 이름, 질문에 대한 답변을 통해<br>비밀번호를 확인하실 수 있습니다.</p>
            <!-- 안내 문구 끝 -->

            <br>

            <!-- 비밀번호 찾기 폼 컨테이너 시작 -->
            <div class="form-container">
                <form>
                    <!-- 비밀번호 찾기 입력 테이블 시작 -->
                    <table class="table" style="width: 500px;">
                        <tbody>
                            <!-- 아이디 입력 필드 시작 -->
                            <tr>
                                <td>아이디</td>
                                <td><input type="text" class="form-control input-small" name="username" required></td>
                            </tr>
                            <!-- 아이디 입력 필드 끝 -->

                            <!-- 이름 입력 필드 시작 -->
                            <tr>
                                <td>이름</td>
                                <td><input type="text" class="form-control input-small" name="name" required></td>
                            </tr>
                            <!-- 이름 입력 필드 끝 -->

                            <!-- 질문 선택 필드 시작 -->
                            <tr>
                                <td>질문</td>
                                <td>
                                    <select class="form-control input-small" name="question" required>
                                        <option>가장 좋아하는 색깔은?</option>
                                        <option>가장 좋아하는 동물은?</option>
                                        <option>내가 다녔던 초등학교는?</option>
                                        <option>어렸을때의 별명은?</option>
                                        <option>현재 거주하고 있는 주소는?</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- 질문 선택 필드 끝 -->

                            <!-- 답변 입력 필드 시작 -->
                            <tr>
                                <td>답변</td>
                                <td><input type="text" class="form-control input-small" name="answer" required></td>
                            </tr>
                            <!-- 답변 입력 필드 끝 -->
                        </tbody>
                    </table>
                    <!-- 비밀번호 찾기 입력 테이블 끝 -->

                    <!-- 확인 버튼 시작 -->
					<button type="button" class="btn btn-dark" onclick="location.href='../member/member-search-pw-complete'">확인</button>
                    <!-- 확인 버튼 끝 -->

                    <br>
                </form>
            </div>
            <!-- 비밀번호 찾기 폼 컨테이너 끝 -->

            <!-- 추가 안내 문구 시작 -->
            <p class="info">입력하신 정보는 본인확인을 위한 정보로만 사용되며, 본인확인 용도 외에는 사용되거나 저장되지 않습니다.
            <br>위 방법으로 정보를 찾으실 수 없는 고객님께서는 고객센터로 문의해주시기 바랍니다.</p>
            <!-- 추가 안내 문구 끝 -->

        </div>
        <!-- 컨텐츠 래퍼 끝 -->
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
