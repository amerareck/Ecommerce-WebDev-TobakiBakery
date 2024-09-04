<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 상품 상세 호출 모달 시작 --%>
<div class="modal fade" id="productDetailsModal">
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
                            <label for="productName"><b>상품명</b></label>
                            <input type="text" class="form-control" id="productName" value="왕슈크림도넛" disabled />
                        </div>

                        <div class="form-group">
                            <label for="productDetails"><b>상품상세</b></label>
                            <textarea class="form-control" id="productDetails" rows="5" readonly>슈크림이 진득하게 들어 있어 맛과 향이 진하게 배어 들어 있는 큼지막한 도넛 슈크림 빵입니다.</textarea>
                        </div>

                        <div class="form-group">
                            <label for="detailsCategory"><b>카테고리</b></label>
                            <input type="text" class="form-control" id="detailsCategory" value="디저트" disabled />
                        </div>

                        <div class="d-flex justify-content-between" style="width: 95%;">
                            <div class="form-group">
                                <label for="productPrice"><b>상품가격</b></label>
                                <input type="number" class="form-control" id="productPrice" value="3500" readonly />
                            </div>
                            <div class="form-group">
                                <label for="productAmount"><b>상품수량</b></label>
                                <input type="number" class="form-control" id="productAmount" value="22" readonly />
                            </div>
                        </div>
                        
<%--
                                    <div class="d-flex justify-content-between" style="width: 95%;">
                                        <div class="form-group">
                                            <label for="deliveryCompany"><b>배송업체</b></label>
                                            <input type="text" class="form-control" id="deliveryCompany" value="대한통운" disabled />
                                        </div>
                                        <div class="form-group">
                                            <label for="deliveryPrice"><b>배송가격</b></label>
                                            <input type="number" class="form-control" id="deliveryPrice" value="3000" readonly>
                                        </div>
                                    </div>
 --%>
                    </div>

                    <div class="block-right flex-grow-1">
                        <div class="form-group d-flex flex-column">
                            <label for="productImagefile"><b>상품 썸네일</b></label>
                            <img src="../resources/image/왕슈크림도넛.jpg" class="rounded" id="productImagefile" width="300px" height="275px"/>
                        </div>

                        <div class="d-flex justify-content-between" style="width: 95%;">
                            <div class="form-group">
                                <label for="productState"><b>상품상태</b></label>
                                <input type="text" class="form-control" id="productState" value="판매중" readonly />
                            </div>
                            <div class="flex-sort d-flex justify-content-center align-items-center">
                                <div class="custom-control custom-switch mt-2">
                                    <input type="checkbox" class="custom-control-input" id="recommendedProduct" disabled />
                                    <label class="custom-control-label" for="recommendedProduct"><b>추천상품 설정</b></label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%-- 상품 상세 호출 모달 끝 --%>
<%-- 상품 수정 호출 모달 시작 --%>
<div class="modal fade" id="productUpdateModal">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h3 class="modal-title">상품 수정</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
                
            <!-- Modal body -->
            <div class="modal-body">
                <form action="#" id="productUpdateForm">
                    <div class="product-container">
                        <div class="block-left flex-grow-1">
                            <div class="form-group flex-column">
                                <label for="updateName"><b>상품명</b></label>
                                <input type="text" class="form-control" id="updateName" name="productName" value="왕슈크림도넛" />
                            </div>

                            <div class="form-group">
                                <label for="updateDetails"><b>상품상세</b></label>
                                <textarea class="form-control" id="updateDetails" name="productDetail" rows="5">슈크림이 진득하게 들어 있어 맛과 향이 진하게 배어 들어 있는 큼지막한 도넛 슈크림 빵입니다.</textarea>
                                <input type="file" class="form-control-file mt-1" id="updateDetailsImage">
                            </div>

                            <div class="form-group">
                                <label for="updateCategory"><b>카테고리</b></label>
                                <select class="form-control form-select" id="updateCategory" name="categoryName" style="width: 90%">
                                    <option value="bread">Bread</option>
                                    <option value="cake">Cake</option>
                                    <option value="desert" selected>Desert</option>
                                </select>
                            </div>

                            <div class="d-flex justify-content-between" style="width: 95%;">
                                <div class="form-group">
                                    <label for="updatePrice"><b>상품가격</b></label>
                                    <input type="number" class="form-control" id="updatePrice" name="productPrice" value="3500" />
                                </div>
                                <div class="form-group">
                                    <label for="updateAmount"><b>상품수량</b></label>
                                    <input type="number" class="form-control" id="updateAmount" name="productCount" value="22" />
                                </div>
                            </div>

                            <div class="d-flex justify-content-between w-100" style="width: 95%;">
                                <div class="form-group w-50">
                                    <label for="updateProductState"><b>상품상태</b></label>
                                    <select class="form-control form-select" id="updateProductState" style="width: 85%;">
                                        <option value="1" selected>판매중</option>
                                        <option value="2">판매중단</option>
                                        <option value="3">매진</option>
                                    </select>
                                </div>
                                <div class="flex-sort d-flex align-items-center w-50">
                                    <div class="custom-control custom-switch mt-2">
                                        <input type="checkbox" class="custom-control-input" id="updateRecommendedProduct" />
                                        <label class="custom-control-label" for="updateRecommendedProduct"><b>추천상품 설정</b></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="block-right flex-grow-1 h-100">
                            <div class="form-group">
                                <div class="text-left">
                                  <label for="updateProductImagefile"><b>상품 썸네일</b></label>
                                </div>
                                <img src="../resources/image/왕슈크림도넛.jpg" class="rounded" id="updateProductImagefile" width="300px" height="275px"/>
                                <input type="file" class="form-control-file mt-1" id="updateImagefileUpload">
                            </div>

                            <div class="d-flex justify-content-end align-items-end ml-3" style="width: 95%; margin-top: 150px;">
                                <button type="submit" class="btn btn-secondary" id="updateSubmit">수정하기</button>
                            </div>

                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<%-- 상품 수정 호출 모달 끝 --%>