<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itemList.css">

	<hr class="hr" />

	<div id="wrap">
		<!-- content 부분입니다. -->
		<div id="contentWrapper">
			<nav class="breadcrumb-container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="../"
						style="color: black !important;"><i class="fas fa-home"></i></a></li>
					<li class="breadcrumb-item"><a
						href="../order/orderCart-static" style="color: black !important;">BEST</a></li>
				</ol>
			</nav>
			<!-- 상품 목록 내용 -->
			<div id="contentWrap">

				<h1 style="color: #D9534F; -webkit-text-stroke: 1px #D9534F;">BEST
					상품</h1>

				<div class="item_info">
					<div class="item_total">
						총 <b>8</b> 개의 상품이 있습니다
					</div>
				</div>
				<div class="item_wrap">
					<!-- 1행 -->
				<c:forEach items="${bestProductList}" var="bestProd">
				<dl class="item_elem">
					<c:if test="${bestProd.productBest==1}">
						<div class="badge">BEST</div>
					</c:if>
					<dt class="thumb">
						<a href="product/productDetail?productId=${bestProd.productId}">
							<img class="prd_img" src="productImage?productId=${bestProd.productId}&productUsecase=THUMBNAIL" />
						</a>
						<div class="cart-overlay">
							<a href="#" id="insertCart-${bestProd.productId}" class="cartInsert" >
								<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" />
							</a>
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title">
								<a href="${pageContext.request.contextPath}/product/productDetail">${bestProd.productName}</a>
							</li>
							<li class="prd_price">
								<fmt:formatNumber value="${bestProd.productPrice}" pattern="#,##0" />원
							</li>
							<%-- 상품후기는 아직 데이터가 없으므로 건너뜁니다. --%>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
			</c:forEach>
		</div>


				<!-- 페이지네이션 -->
				<div>
					<ul class="pagination">
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
					</ul>
				</div>
			</div>

			<!-- content 부분 끝입니다. -->

			<!-- footer 자리 -->
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>