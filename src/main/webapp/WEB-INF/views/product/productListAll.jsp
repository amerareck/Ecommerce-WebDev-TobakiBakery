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
			<!-- listTitle이 있고 categoryName이 없을 때 제목을 표시 -->
			<c:if test="${listTitle != null && !listTitle.isEmpty() && (categoryName == null || categoryName.isEmpty())}">
			    <c:if test="${listTitle == 'BEST 상품'}">
			        <h1 style="color: #D9534F; -webkit-text-stroke: 1px #D9534F;">BEST 상품</h1>
			    </c:if>
			    <c:if test="${listTitle == '신상품'}">
			        <h1 style="color: #D9534F; -webkit-text-stroke: 1px #D9534F;">신상품</h1>
			    </c:if>
			    <c:if test="${listTitle == '추천 상품'}">
			        <h1 style="color: #D9534F; -webkit-text-stroke: 1px #D9534F;">추천 상품</h1>
			    </c:if>
    			    <c:if test="${listTitle == '검색 상품'}">
			        <h1 style="color: #D9534F; -webkit-text-stroke: 1px #D9534F;">총 개의 상품이 검색되었습니다.</h1>
			    </c:if>
			</c:if>

			<c:if test="${listTitle == '전체 상품' ||  listTitle == '빵' || listTitle == '케이크' || listTitle == '디저트'}">
			    <div id="top_category">
			        <ul>			        		
			            <li id="bread_all" <c:if test="${listTitle == '전체 상품'}">class="category_click"</c:if>>
			                <a href="${pageContext.request.contextPath}/product/productListAll?">전체</a>
			            </li>
			            <li id="bread" <c:if test="${listTitle == '빵'}">class="category_click"</c:if>>
			                <a href="${pageContext.request.contextPath}/product/productListAll?categoryName=BREAD">빵</a>
			            </li>
			            <li id="cake" <c:if test="${listTitle == '케이크'}">class="category_click"</c:if>>
			                <a href="${pageContext.request.contextPath}/product/productListAll?categoryName=CAKE" >케이크</a>
			            </li>
			            <li id="desert" <c:if test="${listTitle == '디저트'}">class="category_click"</c:if>>
			                <a href="${pageContext.request.contextPath}/product/productListAll?categoryName=DESSERT">디저트</a>
			            </li>
			        </ul>
			    </div>
			</c:if>

			
			<div class="item_info">
				<div class="item_total">
					총 <b>${prodCount}</b> 개의 상품이 있습니다
				</div>
			</div>
			<div class="item_wrap">
				<c:forEach items="${productList}" var="prod">
					<dl class="item_elem">
						<c:if test="${listTitle != null && !listTitle.isEmpty() && (categoryName == null || categoryName.isEmpty())}">	
						<c:choose>
						    <c:when test="${prod.productNew == 1}">
						        <h2><div class="badge">NEW</div></h2>
						    </c:when>
						    <c:when test="${prod.productBest == 1}">
						        <h2><div class="badge">BEST</div></h2>
						    </c:when>
						    <c:when test="${prod.productRecom == 1}">
						        <h2><div class="badge">PICK</div></h2>
						    </c:when>
						</c:choose>
						</c:if>
						<dt class="thumb">
							<a href="productDetail?productId=${prod.productId}"> <img class="prd_img"
								src="productImage?productId=${prod.productId}&productUsecase=THUMBNAIL" />
							</a>
							<div class="cart-overlay">
								<a
									href="${pageContext.request.contextPath}/order/orderCart?productId=${prod.productId}">
									<img
									src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" />
								</a>
							</div>
						</dt>
						<dd>
							<ul>
								<li class="prd_title">
								<a href="productDetail?productId=${prod.productId}">${prod.productName}</a>
								</li>
								<li class="prd_price"><fmt:formatNumber
										value="${prod.productPrice}" pattern="#,##0" />원</li>
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
		        <div class="pagination mt-3 justify-center">
		            <div class="d-flex align-items-center">
		                <ul class="pagination justify-content-center mt-3 mb-2">    
			                <li class="page-item">
				                	<a class="page-link" href="${pageContext.request.contextPath}/product/productListAll?pageNo=1<c:if test="${listName == null || listName.isEmpty()}">&categoryName=${pager.categoryName}</c:if><c:if test="${categoryName == null || categoryName.isEmpty()}">&listName=${pager.listName}</c:if>" >&laquo;</a>
		                    	</li>
		                    <c:if test="${pager.groupNo>1}" >
		                    	<li class="page-item" >
			                        <a class="page-link" href="${pageContext.request.contextPath}/product/productListAll?pageNo=${pager.startPageNo-1}<c:if test="${listName == null || listName.isEmpty()}">&categoryName=${pager.categoryName}</c:if><c:if test="${categoryName == null || categoryName.isEmpty()}">&listName=${pager.listName}</c:if>" >&lt;</a>
			                    </li>
		                    </c:if>
		                    
		                    <c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
								step="1" var="i">
		                    	<c:if test="${pager.pageNo == i}" >
		                    		<li class="page-item active">
		                        		<a class="page-link" href="${pageContext.request.contextPath}/product/productListAll?pageNo=${i}<c:if test="${listName == null || listName.isEmpty()}">&categoryName=${pager.categoryName}</c:if><c:if test="${categoryName == null || categoryName.isEmpty()}">&listName=${pager.listName}</c:if>">${i}</a>
		                    		</li>
		                    	</c:if>
		                    		
		                    	<c:if test="${pager.pageNo != i}" >
		                    		<li class="page-item">
				                        <a class="page-link" href="${pageContext.request.contextPath}/product/productListAll?pageNo=${i}<c:if test="${listName == null || listName.isEmpty()}">&categoryName=${pager.categoryName}</c:if><c:if test="${categoryName == null || categoryName.isEmpty()}">&listName=${pager.listName}</c:if>">${i}</a>
				                    </li>
		                    	</c:if>
		                    </c:forEach>
		                    
							<c:if test="${pager.groupNo<pager.totalGroupNo}" >
			                    <li class="page-item">
			                        <a class="page-link" href="${pageContext.request.contextPath}/product/productListAll?pageNo=${pager.endPageNo+1}<c:if test="${listName == null || listName.isEmpty()}">&categoryName=${pager.categoryName}</c:if><c:if test="${categoryName == null || categoryName.isEmpty()}">&listName=${pager.listName}</c:if>">&gt;</a>
			                    </li>
		                    </c:if>
			                    <li class="page-item">
			                        <a class="page-link" href="${pageContext.request.contextPath}/product/productListAll?pageNo=${pager.totalPageNo}<c:if test="${listName == null || listName.isEmpty()}">&categoryName=${pager.categoryName}</c:if><c:if test="${categoryName == null || categoryName.isEmpty()}">&listName=${pager.listName}</c:if>">&raquo;</a>
			                    </li>
		                </ul>
		            </div>
		        </div>
		</div>

		<!-- content 부분 끝입니다. -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>