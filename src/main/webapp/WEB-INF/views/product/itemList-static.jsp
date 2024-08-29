<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itemList.css">

	<hr class="hr" />

	<div id="wrap">
		<!-- content 부분입니다. -->
		<div id="contentWrapper">
			<nav class="breadcrumb-container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="../index"
						style="color: black !important;"><i class="fas fa-home"></i></a></li>
					<li class="breadcrumb-item"><a
						href="../order/orderCart-static" style="color: black !important;">빵</a></li>
				</ol>
			</nav>
			<!-- 상품 목록 내용 -->
			<div id="contentWrap">
				<div id="top_category">
					<ul>
						<li id="bread"><a href="../prduct/itemList_bread">빵</a></li>
						<li id="cake"><a href="../product/itemList_cake">케이크</a></li>
						<li id="desert"><a href="../product/itemList_desert">디저트</a></li>
					</ul>
				</div>
				<div class="item_info">
					<div class="item_total">
						총 <b>8</b> 개의 상품이 있습니다
					</div>
				</div>
				<div class="item_wrap">
					<!-- 1행 -->

					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static"><img class="prd_img"
								src="${pageContext.request.contextPath}/resources/image/bread/걀렛뜨 데로와 푀유떼.jpg"
								></a>
							<div class="cart-overlay"
								onclick="location.href='../order/orderCart-static'">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">걀렛뜨 데로와 푀유떼</a></li>
								<li class="prd_price">9,800원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>
					
					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static"><img class="prd_img" src="${pageContext.request.contextPath}/resources/image/bread/로데브.jpg"></a>
							<div class="cart-overlay"
								onclick="location.href='../order/orderCart-static'">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">로데브</a></li>
								<li class="prd_price">12,000원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>

					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static"><img class="prd_img" src="${pageContext.request.contextPath}/resources/image/bread/바따르.jpg"></a>
							<div class="cart-overlay"
								onclick="location.href='orderCart-static'">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">바따르</a></li>
								<li class="prd_price">3,800원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>

					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static"><img class="prd_img" src="${pageContext.request.contextPath}/resources/image/bread/자연효모빵.jpg"></a>
							<div class="cart-overlay"
								onclick="location.href='../product/orderCart-static'">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">자연효모빵</a></li>
								<li class="prd_price">1,800원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>

					<!-- 2행 -->
					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static"><img class="prd_img" src="${pageContext.request.contextPath}/resources/image/bread/카스텔라.jpg"></a>
							<div class="cart-overlay"
								onclick="location.href='orderCart-static'">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">카스텔라</a></li>
								<li class="prd_price">3,000원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>

					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static"><img class="prd_img" src="${pageContext.request.contextPath}/resources/image/bread/오렌지케익.jpg"></a>
							<div class="cart-overlay"
								onclick="location.href='orderCart-static'">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">오렌지케익</a></li>
								<li class="prd_price">4,400원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>

					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static"><img class="prd_img" src="${pageContext.request.contextPath}/resources/image/bread/마블케익.jpg"></a>
							<div class="cart-overlay"
								onclick="location.href='orderCart-static'">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">마블케익</a></li>
								<li class="prd_price">4,000원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>

					<dl class="item_elem">
						<div class="badge">BEST</div>
						<dt class="thumb">
							<a href="../product/itemDetail-static">
							<img class="prd_img" src="${pageContext.request.contextPath}/resources/image/bread/뺑드미.jpg">
							</a>
							<a href="../order/orderCart-static"><div class="cart-overlay">
								<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
									alt="장바구니로 이동">
							</div></a>
						</dt>
						<dd>
							<ul>
								<li class="prd_title"><a
									href="../product/itemDetail-static">뺑드미</a></li>
								<li class="prd_price">3,300원</li>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>
				</div>


				<!-- 페이지네이션 -->
				<div>
					<ul class="pagination">
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
					</ul>
				</div>
			</div>

			<!-- content 부분 끝입니다. -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
