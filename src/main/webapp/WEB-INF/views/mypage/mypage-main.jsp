<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
       
	<!-- 사이드바 부분입니다. -->
	<hr>
	<div class="container">
	<nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/mypage/mypage-main">마이페이지</a></li>
                
                
            </ol>
            
        </nav>
        <div class="main-content">
       
            <%@include file="/WEB-INF/views/mypage/sidebar.jsp" %>
            <!-- content부분입니다. -->
            <section class="content">
            
            
                <h2>마이페이지</h2>
                <div class="profile-info">
                    <div>
                        <p>황망고님 환영합니다.</p>
                       
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
                        
                        <tr>
                                <td>4</td>
                                <td><a href="${pageContext.request.contextPath}/order/orderDetail" style=color:black;>후르츠케잌 외 2종</a></td>
                                <td>48,900원</td>
                                <td>2024-08-16</td>
                            </tr>
                            
                            <tr>
                                <td>3</td>
                                <td><a href="${pageContext.request.contextPath}/order/orderDetail" style=color:black;>자연효모빵 외 3종</a></td>
                                <td>45,400원</td>
                                <td>2024-08-13</td>
                            </tr>
                            
                            <tr>
                                <td>2</td>
                                <td><a href="${pageContext.request.contextPath}/order/orderDetail" style=color:black;>유산균 발효 식빵 외 2종</a></td>
                                <td>28,800원</td>
                                <td>2024-08-04</td>
                            </tr>
                            
                            <tr>
                                <td>1</td>
                                <td><a href="${pageContext.request.contextPath}/order/orderDetail" style=color:black;>오렌지케잌 외 3종</a></td>
                                <td>38,400원</td>
                                <td>2024-07-20</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="recent-inquiries">
                    <h3>최근 문의 내역</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>게시판</th>
                                <th>글제목</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                         <tr>
                                <td>기타문의</td>
                                <td><a href="${pageContext.request.contextPath}/center/getBoardList" style=color:black;>택배가 젖어서 왔어요.</a></td>
                                <td>2024-08-13</td>
                            </tr>
                            
                            <tr>
                                <td>상품문의</td>
                                <td><a href="${pageContext.request.contextPath}/center/getBoardList" style=color:black;>빵 실온보관 문의드립니다.</a></td>
                                <td>2024-08-04</td>
                            </tr>
                            
                             <tr>
                                <td>상품문의</td>
                                <td><a href="${pageContext.request.contextPath}/center/getBoardList" style=color:black;>취소문의요.</a></td>
                                <td>2024-08-02</td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>
	
	<!-- content 부분 끝입니다. -->
	

    <%@include file="/WEB-INF/views/common/footer.jsp" %>

    