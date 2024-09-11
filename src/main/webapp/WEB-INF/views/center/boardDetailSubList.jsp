<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이전/이후 게시판 리스트 시작 -->
<table class="table table-hover table-striped my-4">
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
            <td><a href="${pageContext.request.contextPath}/center/detail?type=${boardType}">취소문의요&ensp;<span class="badge badge-info">NEW</span></a></td>
            <td>라*임</td>
            <td>2024-08-04</td>
            <td>1141</td>
        </tr>
        <tr>
            <td><b>2</b></td>
            <td><a href="${pageContext.request.contextPath}/center/detail?type=${boardType}">결제하기 클릭이 안되요. ㅠㅠ&ensp;<span class="badge badge-primary">답변완료</span></a></td>
            <td>홍*동</td>
            <td>2024-08-03</td>
            <td>1232</td>
        </tr>
        <tr>
            <td><b>1</b></td>
            <td><a href="${pageContext.request.contextPath}/center/detail?type=${boardType}"><i class="fas fa-lock fa-xs"></i> 택배가 젖어 왔어요&ensp;<span class="badge badge-primary">답변완료</span></a></td>
            <td>민*종</td>
            <td>2024-08-03</td>
            <td>1037</td>
        </tr>
    </tbody>
</table>
<!-- 이전/이후 게시판 리스트 종료 -->