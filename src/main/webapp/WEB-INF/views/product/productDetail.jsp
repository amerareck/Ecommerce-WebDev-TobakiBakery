<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itemDetail.css">

		<hr class="hr" />

		<!-- 상세페이지 -->
		<div id="contentWrapper">

			<div id="contentWrap">
				<nav class="breadcrumb-container">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="../"
							style="color: black !important;"><i class="fas fa-home"></i></a></li>
						<li class="breadcrumb-item"><a
							href="../product/itemDetail-static"
							style="color: black !important;">상세페이지</a></li>
					</ol>
				</nav>
				<div id="productDetail" class="fixed_view">
					<div class="page_body">
						<!-- 상품 설명 상단 -->
						<div class="thumb-info">
							<!-- 상품 왼쪽 이미지 -->
							<div class="thumb-wrap">
								<img src="productImage?productId=${prodDetail.productId}&productUsecase=THUMBNAIL">
							</div>
							<!-- thumb-wrap -->
							<!-- 상품 오른쪽 정보 -->
							<div class="thumb-info-text">
								<!-- 상품 정보 -->
								<form>
									<div class="info">
										<div class="info_inner_outer">
											<!-- 상품 정보단 -->
											<div class="info_inner">
												<!-- 상품 이름 출력 -->
												<h3 class="tit-prd">${prodDetail.productName}</h3>
												<br>
												<!-- 상품 정보 테이블 나오는 곳 -->
												<div class="table-opt">
													<!-- 상품 테이블 -->
													<table class="table">
														<colgroup>
															<col width="90">
															<col width="*">
														</colgroup>
														<!-- 상품 테이블 입력단 -->
														<tbody>
															<!-- 판매가격 -->
															<tr class="for_price">
																<th scope="row">
																	<div class="tb-left">판매가격</div>
																</th>
																<td class="price">
																	<div class="tb-left">
																		<b><fmt:formatNumber value="${prodDetail.productPrice}" pattern="#,##0" />원</b>
																	</div>
																</td>
															</tr>

															<!-- 보관방법 -->
															<tr>
																<th scope="row">
																	<div class="tb-left">보관방법</div>
																</th>
																<td class="price">
																	<div class="tb-left">직사광선을 피하고 서늘한 곳 보관(개봉 후
																		냉장보관)</div>
																</td>
															</tr>

															<!-- 배송비 -->
															<tr>
																<th scope="row">
																	<div class="tb-left">배송비</div>
																</th>
																<td class="price">
																	<div class="tb-left">배송조건 : 3000원 (30,000원 이상 구매
																		시 무료)</div>
																</td>
															</tr>
														</tbody>
													</table>

													<!-- 상품 수량 -->
													<div>
														<label for="exampleSelect1" class="form-label mt-4"
															style="margin-right: 30px">상품 수량</label> <select
															class="form-select" id="exampleSelect1">
															<option>1</option>
															<option>2</option>
															<option>3</option>
															<option>4</option>
															<option>5</option>
															<option>6</option>
															<option>7</option>
															<option>8</option>
															<option>9</option>
															<option>10</option>
														</select> 개
													</div>
												</div>

												<!-- table opt -->
												<!-- 버튼 시작 -->
												<!-- 상품 구매정보 버튼 -->
												<div class="prd-btn">
													<button type="button" class="btn btn-light"
														onclick="location.href='../mypage/mypageOrder'">구매하기</button>
													<button type="button" class="btn btn-light"
														onclick="location.href='../order/orderCart'">장바구니</button>
												</div>

											</div>
											<!-- info_inner -->
											<div class="paybtn-wrap">
												<div></div>
											</div>
										</div>
										<!-- info_inner_outer -->

									</div>
								</form>
							</div>
							<!-- thumb-info-text -->

						</div>
						<!-- thumb-info -->

						<!-- 상품 추천단 -->
						<div class="item-wrap recommend">
							<!-- 상품 추천 상단 -->
							<div class="item-recommend-top">
								<b>스마트 추천 상품</b> 이 상품을 구매한 분들이 아래 상품도 함께 주문하셨습니다.
							</div>
							<div class="row">
								<!-- 추천 상품1 -->
								<div class="col-md-3">
									<div class="card">
										<a href="../product/itemDetail-static"> <img
											src="${pageContext.request.contextPath}/resources/image/bread/팡도르.jpg" class="card-img-top"
											alt="팡도르">
										</a>
										<div class="card-body">
											<h5 class="card-title">팡도르</h5>
											<p class="card-text">22,000원</p>
										</div>
									</div>
								</div>

								<!-- 추천 상품2 -->
								<div class="col-md-3">
									<div class="card">
										<a href="../product/itemDetail-static"> <img
											src="${pageContext.request.contextPath}/resources/image/bread/파네토네.jpg" class="card-img-top"
											alt="파네토네">
										</a>
										<div class="card-body">
											<h5 class="card-title">파네토네</h5>
											<p class="card-text">9,500원</p>
										</div>
									</div>
								</div>

								<!-- 추천 상품3 -->
								<div class="col-md-3">
									<div class="card">
										<a href="../product/itemDetail-static"> <img
											src="${pageContext.request.contextPath}/resources/image/bread/자연효모빵.jpg" class="card-img-top"
											alt="자연효모빵">
										</a>
										<div class="card-body">
											<h5 class="card-title">자연효모빵</h5>
											<p class="card-text">4,600원</p>
										</div>
									</div>
								</div>

								<!-- 추천 상품4 -->
								<div class="col-md-3">
									<div class="card">
										<a href="../product/itemDetail-static"> <img
											src="${pageContext.request.contextPath}/resources/image/bread/유산균 발효 식빵.jpg"
											class="card-img-top" alt="유산균 발효 식빵">
										</a>
										<div class="card-body">
											<h5 class="card-title">유산균 발효 식빵</h5>
											<p class="card-text">4,000원</p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 상품 상세 정보단 페이지 -->
						<div class="tab_cont for_shopdetail">
							<div class="list-navigator">
								<!-- 상품 상세 정보단 탭 -->
								<ul class="nav nav-tabs w-100" role="tablist">
									<li class="nav-item w-25 text-center" role="presentation">
									<a class="nav-link active" id="tab-detail-info" data-toggle="tab"
										href="#detail-info" aria-selected="true" role="tab">상품상세정보</a></li>
									<li class="nav-item w-25 text-center" role="presentation"><a
										class="nav-link" id="tab-shipping-info" data-toggle="tab"
										href="#shipping-info" aria-selected="true" role="tab">배송/교환/환불</a></li>
									<li class="nav-item w-25 text-center" role="presentation"><a
										class="nav-link" id="tab-product-inquiry" data-toggle="tab"
										href="#product-inquiry" aria-selected="true" role="tab">상품문의</a></li>
									<li class="nav-item w-25 text-center" role="presentation"><a
										class="nav-link" id="tab-product-reviews" data-toggle="tab"
										href="#product-reviews" aria-selected="true" role="tab">상품후기</a></li>
								</ul>
							</div>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade show active" id="detail-info"
									role="tabpanel">
									<p>
										<img src="productImage?productId=${prodDetail.productId}&productUsecase=DETAIL" class="img-fluid" alt="상품 상세 이미지">
									</p>
								</div>
								<div class="tab-pane fade" id="shipping-info" role="tabpanel">
									<p>배송/교환/환불 정보 내용</p>
								</div>
								<div class="tab-pane fade" id="product-inquiry" role="tabpanel">
									<p>상품문의 내용</p>
								</div>
								<div class="tab-pane fade" id="product-reviews" role="tabpanel">
									<!-- 상품후기 목록 및 내용을 볼 수 있는 부분입니다. -->
									<div class="container mt-5">
										<h2 style="text-align: center;">상품 후기</h2>
										<br>
										<div class="accordion" id="accordionExample">
											<!-- 후기 리스트 테이블 -->
											<table class="table table-bordered mt-3">
												<thead class="thead-light">
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>평점</th>
														<th>조회</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>5</td>
														<td><div class="card">
																<div class="card-header" id="headingOne">
																	<h2 class="mb-0">
																		<button class="btn text-left" type="button"
																			data-toggle="collapse" data-target="#collapseOne"
																			aria-expanded="true" aria-controls="collapseOne"
																			style="background-color: white; color: black;">
																			<strong>다른 맛도 만들어주세요 ! 너무 맛있네요</strong>
																		</button>
																	</h2>
																</div>
																<div id="collapseOne" class="collapse show"
																	aria-labelledby="headingOne"
																	data-parent="#accordionExample">
																	<div class="card-body">
																		<a href="https://imgbb.com/"><img
																			src="https://i.ibb.co/fxN7Hmx/Qkd.jpg" alt="Qkd"
																			border="0"></a> <br> 여기서 이걸 처음먹어보는데 너무 맛있어요 !
																		다른 맛도 추가로 출시해주시면 좋겠 어요 ~ 역시 빵에죽고 빵에사는 빵생빵사에요 ㅎㅎ
																	</div>
																</div>
															</div></td>
														<td>ju*****</td>
														<td>2024/08/18</td>
														<td style="color: #c85855;">★★★★</td>
														<td>16</td>
													</tr>
													<tr>
														<td>4</td>
														<td><div class="card">
																<div class="card-header" id="headingOne">
																	<h2 class="mb-0">
																		<button class="btn text-left" type="button"
																			data-toggle="collapse" data-target="#collapseOne"
																			aria-expanded="true" aria-controls="collapseOne"
																			style="background-color: white; color: black;">
																			<strong>빵이 맛있긴 한데 좀 달아요</strong>
																		</button>
																	</h2>
																</div>
																<div id="collapseOne" class="collapse show"
																	aria-labelledby="headingOne"
																	data-parent="#accordionExample">
																	<div class="card-body">
																		<a href="https://imgbb.com/"><img
																			src="https://i.ibb.co/MGCW5CM/rnt.jpg" alt="rnt"
																			border="0"></a> <br> 빵이 맛은 있는데 좀 많이 다네요~ 커피나
																		우유없이 그냥은 먹기 힘들거 같아요 좀 덜 달게 해주세요~
																	</div>
																</div>
															</div></td>
														<td>yj*****</td>
														<td>2024/08/16</td>
														<td style="color: #c85855;">★★★</td>
														<td>10</td>
													</tr>
													<tr>
														<td>3</td>
														<td><div class="card">
																<div class="card-header" id="headingOne">
																	<h2 class="mb-0">
																		<button class="btn text-left" type="button"
																			data-toggle="collapse" data-target="#collapseOne"
																			aria-expanded="true" aria-controls="collapseOne"
																			style="background-color: white; color: black;">
																			<strong>빵이 엄청 쫄깃해요~</strong>
																		</button>
																	</h2>
																</div>

																<div id="collapseOne" class="collapse show"
																	aria-labelledby="headingOne"
																	data-parent="#accordionExample">
																	<div class="card-body">
																		<a href="https://imgbb.com/"><img
																			src="https://i.ibb.co/wKhQSSb/image.jpg" alt="image"
																			class="img-fluid"></a> <br> 다음 날 먹어도 쫄깃하고
																		부드럽네요~ 너무 맛있어서 아이들과 만들어먹기도 했어요
																	</div>
																</div>
															</div></td>
														<td>ba*****</td>
														<td>2024/08/14</td>
														<td style="color: #c85855;">★★★★★</td>
														<td>16</td>
													</tr>
													<tr>
														<td>2</td>
														<td><div class="card">
																<div class="card-header" id="headingTwo">
																	<h2 class="mb-0">
																		<button class="btn text-left collapsed" type="button"
																			data-toggle="collapse" data-target="#collapseTwo"
																			aria-expanded="false" aria-controls="collapseTwo"
																			style="background-color: white; color: black;">
																			<strong>비주얼도 굿 맛도 굿!</strong>
																		</button>
																	</h2>
																</div>
																<div id="collapseTwo" class="collapse"
																	aria-labelledby="headingTwo"
																	data-parent="#accordionExample">
																	<div class="card-body">생각보다 더 맛있네요. 선물용으로도 좋을 듯
																		해요~</div>
																</div>
															</div></td>
														<td>ka********</td>
														<td>2024/08/12</td>
														<td style="color: #c85855;">★★★★★</td>
														<td>14</td>
													</tr>
													<tr>
														<td>1</td>
														<td><div class="card">
																<div class="card-header" id="headingThree">
																	<h2 class="mb-0">
																		<button class="btn text-left collapsed" type="button"
																			data-toggle="collapse" data-target="#collapseThree"
																			aria-expanded="false" aria-controls="collapseThree"
																			style="background-color: white; color: black;">
																			<strong>인생 빵집입니다</strong>
																		</button>
																	</h2>
																</div>
																<div id="collapseThree" class="collapse"
																	aria-labelledby="headingThree"
																	data-parent="#accordionExample">
																	<div class="card-body">빵순이라서 여기저기 빵 많이 사러다녔지만 이렇게
																		부드럽고 맛있는 빵집은 처음이에요 ㅜㅜ단골 될 거같아요</div>
																</div>
															</div></td>
														<td>sj*******</td>
														<td>2024/08/12</td>
														<td style="color: #c85855;">★★★★★</td>
														<td>22</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!-- 상품후기 목록 및 내용 끝입니다. -->
								</div>
							</div>
						</div>
					</div>
					<!--#page_body 끝-->
				</div>
				<!--#productDetail 끝-->
			</div>
		</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>