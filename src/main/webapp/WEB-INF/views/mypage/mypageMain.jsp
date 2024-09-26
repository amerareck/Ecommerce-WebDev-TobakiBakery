<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
       
	<!-- 사이드바 부분입니다. -->
	<hr>
	<div class="container">
	<nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a></li>
                
                
            </ol>
            
        </nav>
        <div class="main-content">
       
            <%@include file="/WEB-INF/views/mypage/sidebar.jsp" %>
            <!-- content부분입니다. -->
            <section class="content">
            
            
                <h2>마이페이지</h2>
                <div class="profile-info">
                    <div>
                        <p>${memberId}님 환영합니다.</p>
                       
                    </div>
                    
                </div>
                <div class="recent-orders">
                    <h3>최근 주문 정보</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>상품명</th>
                                <th>결제금액</th>
                                <th>주문일자</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                       <c:forEach var="orders" items="${orders}">
        <tr>
            <td>${orders.orderNumber}</td> 
            <td>${orders.productName}</td>
            <td>${orders.orderProductPrice}</td>
            <td><fmt:formatDate value="${orders.orderDate}" pattern="yyyy-MM-dd"/></td>
        </tr>
    </c:forEach> 
                        </tbody>
                    </table>
                </div>
                <div class="recent-inquiries">
                    <h3>최근 문의 내역</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>문의번호</th>
                                <th>글제목</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="inquiry" items="${inquiry}">
                         	<tr>
                                <td>${inquiry.helpdeskId}</td>
                                <td><a href="${pageContext.request.contextPath}/center/detail?type=helpdesk&boardNum=${inquiry.helpdeskId}" style=color:black;>${inquiry.helpdeskTitle}</a></td>
                                <td><fmt:formatDate value="${inquiry.helpdeskDatetime}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            </c:forEach>
                          
                        </tbody>
                    </table>
                </div>
                
    		
				<%-- 상품 상세보기 및 수정하기 모달 호출  --%>
    				<%@include file="/WEB-INF/views/mypage/memberDeleteModal.jsp" %>
			
            </section>
        </div>
    </div>
	
	<!-- content 부분 끝입니다. -->
	

    <%@include file="/WEB-INF/views/common/footer.jsp" %>

    