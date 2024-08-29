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
			<!-- 1행 -->
			<dl class="item_elem">
				<div class="badge">
					BEST
				</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/걀렛뜨 데로와 푀유떼.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay" onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" />
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">걀렛뜨 데로와 푀유떼</a></li>
						<li class="prd_price">9,800원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">BEST</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/로데브.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./product/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">로데브</a></li>
						<li class="prd_price">12,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">BEST</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/바따르.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">바따르</a></li>
						<li class="prd_price">3,800원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">BEST</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/자연효모빵.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">자연효모빵</a></li>
						<li class="prd_price">1,800원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<!-- 2행 -->
			<dl class="item_elem">
				<div class="badge">BEST</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/카스텔라.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">카스텔라</a></li>
						<li class="prd_price">3,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">BEST</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/오렌지케익.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">오렌지케익</a></li>
						<li class="prd_price">4,400원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">BEST</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/마블케익.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">마블케익</a></li>
						<li class="prd_price">4,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">BEST</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/bread/뺑드미.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">뺑드미</a></li>
						<li class="prd_price">3,300원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>
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
			<!-- 1행 -->
			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/cake/갸또 쇼꼴라.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">갸또
								쇼콜라</a></li>
						<li class="prd_price">39,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/cake/고구마 생크림 케익.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">고구마
								생크림 케이크</a></li>
						<li class="prd_price">32,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/cake/샤를로뜨.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">샤를로뜨</a></li>
						<li class="prd_price">23,800원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/desert/라피누.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">라피누</a></li>
						<li class="prd_price">18,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<!-- 2행 -->
			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/cake/프레지에.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">프레지에</a></li>
						<li class="prd_price">43,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/cake/티라미수.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">티라미수</a></li>
						<li class="prd_price">34,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/cake/쉭쎄.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">쉭쎄</a></li>
						<li class="prd_price">41,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>

			<dl class="item_elem">
				<div class="badge">NEW</div>
				<dt class="thumb">
					<img class="prd_img" src="resources/image/cake/까망베르 치즈케익.jpg"
						onclick="location.href='./product/itemDetail-static'">
					<div class="cart-overlay"
						onclick="location.href='./order/orderCart-static'">
						<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png"
							alt="장바구니로 이동">
					</div>
				</dt>
				<dd>
					<ul>
						<li class="prd_title"><a href="./product/itemDetail-static">까망베르
								치즈케익</a></li>
						<li class="prd_price">30,000원</li>
						<li class="prd_review"><em>상품후기</em> (8)</li>
					</ul>
				</dd>
			</dl>
		</div>
		<div class="gap"></div>
	</div>
	<!-- content 부분 끝입니다.-->

	<%@include file="/WEB-INF/views/common/footer.jsp" %>