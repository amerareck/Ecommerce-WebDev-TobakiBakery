<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${productList}" var="element" >
	<%-- 상품 상세 호출 모달 시작 --%>
	<div class="modal fade" id="productDetailsModal-${element.productId}">
	    <div class="modal-dialog modal-dialog-centered modal-lg">
	        <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h3 class="modal-title">상품 상세</h3>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>
	                
	            <!-- Modal body -->
	            <div class="modal-body">
	                <div class="product-container">
	                    <div class="block-left flex-grow-1">
	                        <div class="form-group flex-column">
	                            <label for="productName-${element.productId}"><b>상품명</b></label>
	                            <input type="text" class="form-control" id="productName-${element.productId}" value="${element.productName}" disabled />
	                        </div>
	
	                        <div class="form-group">
	                            <label for="productDetails-${element.productId}"><b>상품상세</b></label>
	                            <textarea class="form-control" id="productDetails-${element.productId}" rows="5" readonly>${element.productDetail}</textarea>
	                        </div>
	
	                        <div class="form-group">
	                            <label for="detailsCategory-${element.productId}"><b>카테고리</b></label>
	                            <input type="text" class="form-control" id="detailsCategory-${element.productId}" value="${element.categoryName}" disabled />
	                        </div>
	
	                        <div class="d-flex justify-content-between" style="width: 95%;">
	                            <div class="form-group">
	                                <label for="productPrice-${element.productId}"><b>상품가격</b></label>
	                                <input type="number" class="form-control" id="productPrice-${element.productId}" value="${element.productPrice}" readonly />
	                            </div>
	                            <div class="form-group">
	                                <label for="productAmount-${element.productId}"><b>상품수량</b></label>
	                                <input type="number" class="form-control" id="productAmount-${element.productId}" value="${element.productStock }" readonly />
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="block-right flex-grow-1">
	                        <div class="form-group d-flex flex-column">
	                            <label for="productImagefile-${element.productId}"><b>상품 썸네일</b></label>
	                            <img src="${pageContext.request.contextPath}/product/productImage?productId=${element.productId}&productUsecase=THUMBNAIL" class="rounded" id="productImagefile-${element.productId}" width="300px" height="275px"/>
	                        </div>
	
	                        <div class="d-flex justify-content-between" style="width: 95%;">
	                            <div class="form-group">
	                                <label for="productState-${element.productId}"><b>상품상태</b></label>
	                                <input type="text" class="form-control" id="productState-${element.productId}" value="${element.productState}" readonly />
	                            </div>
	                            <div class="flex-sort d-flex justify-content-center align-items-center">
	                                <div class="custom-control custom-switch mt-2">
	                                    <input type="checkbox" class="custom-control-input" id="recommendedProduct-${element.productId}" disabled <c:if test="${element.productRecom == 1}">checked="checked"</c:if> />
	                                    <label class="custom-control-label" for="recommendedProduct-${element.productId}"><b>추천상품 설정</b></label>
	                                </div>
	                            </div>
	                        </div>
	
	                    </div>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</div>
</c:forEach>
<%-- 상품 상세 호출 모달 끝 --%>
<%-- 상품 수정 호출 모달 시작 --%>
<c:forEach items="${productList}" var="element" >
<div class="modal fade productUpdateModal" id="productUpdateModal-${element.productId}">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h3 class="modal-title">상품 수정</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
                
            <!-- Modal body -->
            <div class="modal-body">
                <form action="#" id="productUpdateForm-${element.productId}">
                    <div class="product-container">
                        <div class="block-left flex-grow-1">
                            <div class="form-group flex-column">
                                <label for="updateName-${element.productId}"><b>상품명</b></label>
                                <input type="text" class="form-control" id="updateName-${element.productId}" name="productName" value="${element.productName}" />
                            </div>

                            <div class="form-group">
                                <label for="updateDetails-${element.productId}"><b>상품상세</b></label>
                                <textarea class="form-control" id="updateDetails-${element.productId}" name="productDetail" rows="5">${element.productDetail}</textarea>
                                <div></div>
                                <input type="file" class="form-control-file mt-1" id="updateDetailsImage-${element.productId}">
                            </div>

                            <div class="form-group">
                                <label for="updateCategory-${element.productId}"><b>카테고리</b></label>
                                <select class="form-control form-select" id="updateCategory-${element.productId}" name="categoryName" style="width: 90%">
                                    <option value="BREAD" <c:if test="${element.categoryName == 'BREAD'}">selected</c:if>>Bread</option>
                                    <option value="CAKE" <c:if test="${element.categoryName == 'CAKE'}">selected</c:if> >Cake</option>
                                    <option value="DESSERT" <c:if test="${element.categoryName == 'DESSERT'}">selected</c:if> >Dessert</option>
                                </select>
                            </div>

                            <div class="d-flex justify-content-between" style="width: 95%;">
                                <div class="form-group">
                                    <label for="updatePrice-${element.productId}"><b>상품가격</b></label>
                                    <input type="number" class="form-control" id="updatePrice-${element.productId}" name="productPrice" value="${element.productPrice}" />
                                </div>
                                <div class="form-group">
                                    <label for="updateAmount-${element.productId}"><b>상품수량</b></label>
                                    <input type="number" class="form-control" id="updateAmount-${element.productId}" name="productCount" value="${element.productStock}" />
                                </div>
                            </div>

                            <div class="d-flex justify-content-between w-100" style="width: 95%;">
                                <div class="form-group w-50">
                                    <label for="updateProductState-${element.productId}"><b>상품상태</b></label>
                                    <select class="form-control form-select" id="updateProductState-${element.productId}" style="width: 85%;">
                                        <option value="ON_SALE" <c:if test="${element.productState == 'ON_SALE'}">selected</c:if> >판매중</option>
                                        <option value="NOT_SALE" <c:if test="${element.productState == 'NOT_SALE'}">selected</c:if> >판매중단</option>
                                        <option value="SOLD_OUT" <c:if test="${element.productState == 'SOLD_OUT'}">selected</c:if> >매진</option>
                                    </select>
                                </div>
                                <div class="flex-sort d-flex align-items-center w-50">
                                    <div class="custom-control custom-switch mt-2">
                                        <input type="checkbox" class="custom-control-input" id="updateRecommendedProduct-${element.productId}" <c:if test="${element.productRecom == 1 }">checked="checked"</c:if> />
                                        <label class="custom-control-label" for="updateRecommendedProduct-${element.productId}"><b>추천상품 설정</b></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="block-right flex-grow-1 h-100">
                            <div class="form-group">
                                <div class="text-left">
                                  <label for="updateProductImagefile-${element.productId}"><b>상품 썸네일</b></label>
                                </div>
                                <img src="${pageContext.request.contextPath}/product/productImage?productId=${element.productId}&productUsecase=THUMBNAIL" class="rounded" id="updateProductImagefile-${element.productId}" width="300px" height="275px"/>
                                <input type="file" class="form-control-file mt-1" id="updateImagefileUpload-${element.productId}">
                            </div>

                            <div class="d-flex justify-content-end align-items-end ml-3" style="width: 95%; margin-top: 150px;">
                                <button type="submit" class="btn btn-secondary" id="updateSubmit-${element.productId}">수정하기</button>
                            </div>

                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
</c:forEach>
<%-- 상품 수정 호출 모달 끝 --%>