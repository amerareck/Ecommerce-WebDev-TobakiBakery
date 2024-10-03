<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- 서브 네비게이터 시작 -->
<div class="d-flex justify-content-center">
    <h2 class="h2 mb-5 border-bottom" style="width: 100px;">${title}</h2>
</div>

          
<ul class="nav nav-tabs justify-content-center mb-3">
    <li class="nav-item">
    	
        <a class="nav-link <c:if test="${boardType == 'notice'}">active</c:if>" href="${pageContext.request.contextPath}/center/list?type=notice">공지사항</a>
    </li>
    <%-- 
    <li class="nav-item">
        <a class="nav-link ${isActive}" href="${pageContext.request.contextPath}/center/product">상품문의</a>
    </li>
    --%>
    <li class="nav-item">
        <a class="nav-link <c:if test="${boardType == 'helpdesk'}">active</c:if>" href="${pageContext.request.contextPath}/center/list?type=helpdesk">문의사항</a>
    </li>
</ul>

<!-- 서브 네비게이터 종료 -->