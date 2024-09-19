<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    	<c:forEach items="${subList}" var="element">
    		<c:if test="${element.boardId == board.boardId}"><tr class="table-active"></c:if>
    		<c:if test="${element.boardId != board.boardId}"><tr></c:if>
	            <td><b>${element.boardId}</b></td>
	            <td>
	            	<a href="${pageContext.request.contextPath}/center/detail?type=${boardType}&boardNum=${element.boardId}" class="d-inline" >${element.title}&ensp;</a>
	            	<span class="badge badge-info">NEW</span>
	            </td>
	            <td>${element.memberId}</td>
	            <td><fmt:formatDate value="${element.datetime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
	            <td>${element.views}</td>
        	</tr>
    	</c:forEach>
    </tbody>
</table>
<!-- 이전/이후 게시판 리스트 종료 -->