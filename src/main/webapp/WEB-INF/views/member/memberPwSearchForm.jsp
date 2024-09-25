<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 안내 문구 시작 -->
<p class="info">아이디, 이름, 질문에 대한 답변을 통해<br>비밀번호를 확인하실 수 있습니다.</p>
<!-- 안내 문구 끝 -->

<br>

<!-- 비밀번호 찾기 폼 컨테이너 시작 -->
<div class="form-container">
    <form method="post" action="memberPwSearch" id="pwSearchForm">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <!-- 비밀번호 찾기 입력 테이블 시작 -->
        <table class="table" style="width: 500px;">
            <tbody>
                <!-- 아이디 입력 필드 시작 -->
                <tr>
                    <td>아이디</td>
                    <td><input type="text" class="form-control input-small" name="memberId" id="memberId"></td>
                </tr>
                <!-- 아이디 입력 필드 끝 -->

                <!-- 이름 입력 필드 시작 -->
                <tr>
                    <td>이름</td>
                    <td><input type="text" class="form-control input-small" name="memberName" id="memberName"></td>
                </tr>
                <!-- 이름 입력 필드 끝 -->

                <!-- 질문 선택 필드 시작 -->
                <tr>
                    <td>질문</td>
                    <td>
                        <select class="form-control input-small" name="memberQuestion" id="memberQ">
                            <option value="1">가장 좋아하는 색깔은?</option>
                            <option value="2">가장 좋아하는 동물은?</option>
                            <option value="3">내가 다녔던 초등학교는?</option>
                            <option value="4">어렸을때의 별명은?</option>
                            <option value="5">현재 거주하고 있는 주소는?</option>
                        </select>
                    </td>
                </tr>
                <!-- 질문 선택 필드 끝 -->

                <!-- 답변 입력 필드 시작 -->
                <tr>
                    <td>답변</td>
                    <td><input type="text" class="form-control input-small" name="memberAnswer" id="memberA"></td>
                </tr>
                <!-- 답변 입력 필드 끝 -->
            </tbody>
        </table>
        <!-- 비밀번호 찾기 입력 테이블 끝 -->

        <!-- 확인 버튼 시작 -->
		<button id="pw-search-complete" class="btn btn-dark" >확인</button>
        <!-- 확인 버튼 끝 -->

        <br>
    </form>
</div>