<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="total-products p-2 mb-4">
	<%-- 상품 검색 start --%>
    <div class="d-flex justify-content-between mb-2 align-items-center">
        <h3>상품 목록 리스트</h3>
        <form class="form-inline my-2 my-lg-0" id="productSearchForm">
            <div class="input-group">
                <select class="form-control mr-sm-1" id="searchProductSelect">
                    <option selected>검색조건</option>
                    <option value="pname">이름</option>
                    <option value="category">분류</option>
                    <option value="pstatus">상태</option>
                </select>
                <input class="form-control mr-sm-0" type="text" placeholder="Search" id="productSearchKeyword">
                <div class="input-group-append">
                    <button class="btn btn-secondary my-2 my-sm-0" style="height: 35px;" type="submit">검색</button>
                </div>
            </div>
        </form>
    </div>
    <%-- 상품 검색 end --%>
    <form action="#" id="productTableForm">
        <div class="table-wrapper">
            <table class="table table-hover table-striped">
                <thead class="thead-fixed">
                    <tr class="table-secondary text-center">
                        <!-- 상품 전체 토글 -->
                        <th style="width: 30px" class="align-middle">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="totalProductSelect">
                                <label class="custom-control-label" for="totalProductSelect"></label>
                            </div>
                        </th>
                        <!-- 토글 종료 -->
                        <th style="width: 30px;">NO.</th>
                        <th style="width: 50px;">분류</th>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>상품가격</th>
                        <th>재고수량</th>
                        <th style="width: 50px;">상태</th>
                        <th style="width: 50px;">수정</th>
                        <th style="width: 50px;">삭제</th>
                    </tr>
                </thead>
                <tbody id="productTableData">
                	<c:forEach items="${productList}" var="element">
						<tr class="table-light text-center">
							<!-- 상품 선택 -->
							<td class="align-middle">
							    <div class="custom-control custom-checkbox">
							        <input type="checkbox" class="custom-control-input product-select" id="product-select-${element.productId}">
							        <label class="custom-control-label" for="product-select-1"></label>
							    </div>
							</td>
							<!-- 상품 번호-->
							<th scope="row" class="align-middle prodNum">${element.productId}</th>
							<!-- 카테고리 -->
							<td class="align-middle">
								<c:if test="${element.categoryName == 'BREAD'}" >BR</c:if>
								<c:if test="${element.categoryName == 'CAKE'}" >CK</c:if>
								<c:if test="${element.categoryName == 'DESSERT'}" >DS</c:if>
							</td>
							<!-- 상품이미지 -->
							<td class="align-middle">
							    <img 
							    	src="${pageContext.request.contextPath}/product/productImage?productId=${element.productId}&productUsecase=THUMBNAIL" 
							    	class="rounded-circle" width="50px">
							</td>
							<!-- 상품명 -->
							<td class="align-middle">
								<a href="#" data-toggle="modal" data-target="#productDetailsModal">${element.productName}</a>
							</td>
							<!-- 상품가격 -->
							<td class="align-middle">
								<fmt:formatNumber value="${element.productPrice}" pattern="#,##0" />원
							</td>
							<!-- 재고수량 -->
							<td class="align-middle">${element.productStock}개</td>
							<!-- 상품상태 -->
							<td class="align-middle">
								<c:if test="${element.productState == 'ON_SALE'}"><div class="tm-status-circle moving"></div></c:if>
								<c:if test="${element.productState == 'NOT_SALE'}"><div class="tm-status-circle pending"></div></c:if>
								<c:if test="${element.productState == 'SOLD_OUT'}"><div class="tm-status-circle cancelled"></div></c:if>
							</td>
							<!-- 상품수정 -->
							<td class="align-middle">
							    <a href="#" data-toggle="modal" data-target="#productUpdateModal"><i class="fas fa-pen"></i></a>
							</td>
							<!-- 상품삭제 -->
						    <td class="align-middle">
						        <a href="#" class="product-delete-selector"><i class="far fa-trash-alt tm-product-delete-icon"></i></a>
						    </td>
						</tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
        
        <%-- 게시판 페이지네이션 start --%>
        <div class="pagination mt-3 justify-content-between">
            <div class="d-flex align-items-center">
                <ul class="pagination justify-content-center mt-3 mb-2">
                    <li class="page-item disabled">
                    <a class="page-link" href="#">&laquo;</a>
                    </li>
                    <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                    <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item">
                    <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item">
                    <a class="page-link" href="#">4</a>
                    </li>
                    <li class="page-item">
                    <a class="page-link" href="#">5</a>
                    </li>
                    <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
            <div class="d-flex align-items-center">
                <button type="submit" class="btn btn-secondary" id="productDelete">삭제</button>
            </div>
        </div>
        <%-- 게시판 페이지네이션 end --%>
    </form>
</div>