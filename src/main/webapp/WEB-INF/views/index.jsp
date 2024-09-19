<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itemList.css">

	<hr class="hr" />

	<!-- content 부분입니다. -->
	<div id="contentWrapper">
		<!-- 슬라이더 -->
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/image/banner-img1.jpg" class="d-block w-100"
						onclick="location.href='./product/itemList-best'">
				</div>
				<div class="carousel-item">
					<img src="resources/image/banner-img2.jpg" class="d-block w-100"
						onclick="location.href='./product/itemList-best'">
				</div>
				<div class="carousel-item">
					<img src="resources/image/banner-img3.jpg" class="d-block w-100"
						onclick="location.href='./product/itemList-best'">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#carouselExampleControls" data-slide="prev"
				style="border: hidden; background-color: transparent;">
				<span class="carousel-control-prev-icon" aria-hidden="true">
				</span> <span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#carouselExampleControls" data-slide="next"
				style="border: hidden; background-color: transparent;">
				<span class="carousel-control-next-icon" aria-hidden="true">;
				</span> <span class="sr-only">Next</span>
			</button>
		</div>

		<div class="gap"></div>

		<div class="intro">
			<h3>
				꾸준히 사랑받는 <strong>베스트</strong>
			</h3>
			<h5>자주 구매하는 빵, 식기전에 구매하세요~</h5>
		</div>
		
		<!-- 베스트 -->
		<div class="item_wrap" id="best">
			<c:forEach items="${bestProductList}" var="bestProd">
				<dl class="item_elem">
					<c:if test="${bestProd.productBest==1}">
						<div class="badge">BEST</div>
					</c:if>
					<dt class="thumb">
						<a href="product/productDetail?productId=${bestProd.productId}">
							<img class="prd_img" 
								src="${pageContext.request.contextPath}/product/productImage?productId=${bestProd.productId}&productUsecase=THUMBNAIL" />
						</a>
						<div class="cart-overlay">
							<a href="${pageContext.request.contextPath}/order/orderCart?productId=${bestProd.productId}">
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

		<div class="gap"></div>

		<div class="intro">
			<h3>
				새롭게 나온 <strong>신상품!</strong>
			</h3>
			<h5>맛있는 신메뉴!</h5>
		</div>

		<!-- 신제품 -->
		<div class="item_wrap" id="new">
			<c:forEach items="${newProdList}" var="prod">
				<dl class="item_elem">
					<c:if test="${prod.productNew == 1}">
						<div class="badge">NEW</div>
					</c:if>
					<dt class="thumb">
						<a href="product/productDetail?productId=${prod.productId}">
							<img class="prd_img" 
								src="${pageContext.request.contextPath}/product/productImage?productId=${prod.productId}&productUsecase=THUMBNAIL" />
						</a>
						<div class="cart-overlay">
							<a href="${pageContext.request.contextPath}/order/orderCart?productId=${prod.productId}">
								<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" />
							</a>
						</div>
					</dt>
					<dd>
						<ul>
							<li class="prd_title">
								<a href="${pageContext.request.contextPath}/product/productDetail">${prod.productName}</a>
							</li>
							<li class="prd_price">
								<fmt:formatNumber value="${prod.productPrice}" pattern="#,##0" />원
							</li>
							<%-- 상품후기는 아직 데이터가 없으므로 건너뜁니다. --%>
							<li class="prd_review"><em>상품후기</em> (8)</li>
						</ul>
					</dd>
				</dl>
			</c:forEach>
			
		</div>
		<div class="gap"></div>
	</div>
	<!-- content 부분 끝입니다.-->
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>