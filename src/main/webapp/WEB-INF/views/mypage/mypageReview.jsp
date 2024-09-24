<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">


<!-- 사이드바 부분입니다. -->
<hr>
<div class="container">
	<nav class="breadcrumb-container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/mypage/mypageReview">나의
					상품 후기</a></li>


		</ol>
	</nav>
	<div class="main-content">
		<%@include file="/WEB-INF/views/mypage/sidebar.jsp"%>
		<!-- content부분입니다. -->
		<section class="content">
			<h2>나의 상품 후기</h2>
			<div class="review-summary">
				<p>
					<span>yooni01</span>님이 쇼핑몰에 작성한 상품후기 내역입니다.
				</p>
			</div>
			<table class="review-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>사진</th>
						<th>상품명</th>
						<th>제목</th>
						<th>날짜</th>
						<th>조회</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				    <c:forEach var="review" items="${reviews}">
				        <tr>
				            <td>${review.productReviewId}</td>
				            <td>
				                <c:if test="${not empty review.imageOriginalName}">
				                    <a href="product/productDetail?productId=${review.productId}">
				                        <img class="prd_img"
								src="../center/image?type=productReview&imageName=${review.imageOriginalName}&boardId=${review.productReviewId}" />
				                    </a>
				                </c:if>
				                <c:if test="${empty review.imageOriginalName}">
				                    <a href="product/productDetail?productId=${review.productId}">
				                        <img class="prd_img"
								src="productImage?productId=${review.productId}&productUsecase=THUMBNAIL" />
				                    </a>
				                </c:if>
				            </td>
				            
				            <td>${review.reviewTitle}</td>
				            <td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy-MM-dd"/></td>
				            <td>${review.reviewViews}</td>
				            <td>
				                <button class="btn-delete" style="margin-top: 10px;">후기삭제</button>
				            </td>
				        </tr>
				    </c:forEach>
</tbody>

			</table>


		</section>
	</div>
</div>

<!-- content 부분 끝입니다. -->

<%@include file="/WEB-INF/views/common/footer.jsp"%>
