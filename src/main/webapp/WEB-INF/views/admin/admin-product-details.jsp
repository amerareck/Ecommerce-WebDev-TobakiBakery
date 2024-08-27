<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <div class="container">
        <div class="main-content">
			<%@include file="/WEB-INF/views/admin/adminSidebar.jsp" %>
            <!-- 메인 섹션 시작 -->
            <section class="content">
                <h2>상품 등록</h2>
                <hr class="hr">
                <div class="d-flex form-wrapper my-4">
                    <form method="post" action="addProduct" id="productInsertForm">
                        <div class="product-container">
                            <div class="block-left flex-grow-1">
                                <!-- 상품 이름 -->
                                <div class="form-group">
                                    <label for="product-name"><b>상품명</b></label>
                                    <input type="text" class="form-control" id="product-name" name="productName" aria-describedby="productName" placeholder="상품 이름 입력" required>
                                </div>
                                <!-- 상품 상세 -->
                                <div class="form-group">
                                    <label for="product-details"><b>상품상세</b></label>
                                    <textarea class="form-control" id="product-details" name="productDetail" rows="5" required></textarea>
                                    <input type="file" class="form-control-file mt-1" id="product-details-imagefile" aria-describedby="details-imagefile">
                                </div>
                                <!-- 카테고리 선택 -->
                                <div class="form-group">
                                    <label for="product-category"><b>카테고리</b></label>
                                    <select class="form-control form-select" id="product-category" name="categoryName" required>
                                      <option disabled selected>카테고리 선택</option>
                                      <option value="bread">Bread</option>
                                      <option value="cake">Cake</option>
                                      <option value="desert">Desert</option>
                                    </select>
                                </div>
                                <!-- 상품가격 / 상품 수량-->
                                <div class="d-flex justify-content-between" style="width: 95%;">
                                    <div class="form-group">
                                        <label for="product-price"><b>상품가격</b></label>
                                        <input type="number" class="form-control" id="product-price" name="productPrice" placeholder="상품 가격" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="product-amount"><b>상품수량</b></label>
                                        <input type="number" class="form-control" id="product-amount" name="productCount" placeholder="수량 설정" required>
                                    </div>
                                </div>
                                <!-- 상품 상태 및 추천 설정 -->
                                <label for="productState"><b>상품상태 설정</b></label>
                                <div class="form-group d-flex justify-content-between" style="width: 95%;">
                                    <div class="w-50">
                                        <select class="form-control form-select" id="productState" name="productState" required>
                                          <option disabled selected>상품상태</option>
                                          <option value="1">판매중</option>
                                          <option value="2">상품품절</option>
                                          <option value="3">판매중단</option>
                                        </select>
                                    </div>
                                    <div class="flex-sort d-flex justify-content-center align-items-center checkbox-area">
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" class="custom-control-input" id="recommendedProduct" name="productRecom" value="recommendedProd">
                                            <label class="custom-control-label" for="recommendedProduct"><b>추천상품 설정</b></label>
                                        </div>
                                    </div>
                                    <div style="margin-left: 13px;">
                                    	 
                                    </div>
                                </div>
                            </div>

                            <!-- 우측 영역 -->
                            <div class="block-right flex-grow-1">
                                <!-- 상품 이미지 -->
                                <div class="form-group text-center">
                                    <div class="text-left ml-2">
                                      <label for="productMainImage"><b>상품 썸네일</b></label>
                                    </div>
                                    <img src="../resources/image/왕슈크림도넛.jpg" class="rounded" id="productMainImage" width="300px" height="275px"/>
                                    <div class="input-group input-center text-left mt-2 mb-3">
                                        <div class="custom-file">
                                          <input type="file" class="custom-file-input" id="productMainImagefile">
                                          <label class="custom-file-label" for="productMainImagefile">상품 이미지 업로드</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- 타임스탬프 -->
                                <input type="hidden" name="productDateTime" id="productDateTime">
                            </div>
                        </div>

                        <hr class="hr">
                        
                        <div class="d-flex justify-content-end">
                            <button type="reset" class="btn btn-secondary mr-1">비우기</button>
                            <button type="submit" class="btn btn-secondary">등록하기</button>
                        </div>
                    </form>
                </div>
            </section>
            <!-- 메인 섹션 종료 -->
        </div>
    </div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>

