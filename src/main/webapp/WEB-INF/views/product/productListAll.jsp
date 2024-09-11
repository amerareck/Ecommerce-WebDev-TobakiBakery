<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/itemList.css">

<hr class="hr" />

<div id="wrap">
	<!-- content 부분입니다. -->
	<div id="contentWrapper">
		<nav class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index"
					style="color: black !important;"><i class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item"><a href="../order/orderCart-static"
					style="color: black !important;">빵</a></li>
			</ol>
		</nav>
		<!-- 상품 목록 내용 -->
		<div id="contentWrap">
			<div id="top_category">
				<ul>
					<li id="bread_all" class="category_click"><a
						href="../prduct/itemList_static">전체</a></li>
					<li id="bread"><a href="#">빵</a></li>
					<li id="cake"><a href="#">케이크</a></li>
					<li id="desert"><a href="#">디저트</a></li>
				</ul>
			</div>
			<div class="item_info">
				<div class="item_total">
					총 <b>${prodCount}</b> 개의 상품이 있습니다
				</div>
			</div>
			<div class="item_wrap">
				<c:forEach items="${prodListAll}" var="allProd">
					<dl class="item_elem">
						<dt class="thumb">
							<a href="productDetail?productId=${allProd.productId}"> <img class="prd_img"
								src="productImage?productId=${allProd.productId}&productUsecase=THUMBNAIL" />
							</a>
							<div class="cart-overlay">
								<a
									href="${pageContext.request.contextPath}/order/orderCart-static">
									<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" />
								</a>
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title">
								<a href="productDetail?productId=${allProd.productId}">${allProd.productName}</a>
								</li>
								<li class="prd_price"><fmt:formatNumber
										value="${allProd.productPrice}" pattern="#,##0" />원</li>
								<%-- 상품후기는 아직 데이터가 없으므로 건너뜁니다. --%>
								<li class="prd_review"><em>상품후기</em> (8)</li>
							</ul>
						</dd>
					</dl>
				</c:forEach>
			</div>
</div>
</div>
			<!-- 페이지네이션 -->
			<div>
				<tr>
					<td colspan="5" class="text-center">
						<%-- [처음][이전]1 2 3 4 5[다음][맨뒤] --%>
						<div>
							<a href="productListAll?pageNo=1"
								class="btn btn-outline-primary btn-sm">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a href="productListAll?pageNo=${pager.startPageNo-1}"
									class="btn btn-outline-info btn-sm">이전</a>
							</c:if>

							<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
								step="1" var="i">
								<c:if test="${pager.pageNo==i}">
									<a href="productListAll?pageNo=${i}"
										class="btn btn-danger btn-sm">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo!=i}">
									<a href="productListAll?pageNo=${i}"
										class="btn btn-outline-success btn-sm">${i}</a>
								</c:if>
							</c:forEach>

							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a href="productListAll?pageNo=${pager.endPageNo+1}"
									class="btn btn-outline-info btn-sm">다음</a>
							</c:if>

							<a href="productListAll?pageNo=${pager.totalPageNo}"
								class="btn btn-outline-primary btn-sm">맨 끝</a>
						</div>
					</td>
				</tr>

			</div>
		</div>

		<!-- content 부분 끝입니다. -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>