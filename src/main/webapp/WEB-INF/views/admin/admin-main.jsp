<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<div class="container">
        <div class="main-content">
			<%@include file="/WEB-INF/views/admin/adminSidebar.jsp" %>
            <!-- 메인 섹션 시작 -->
            <section class="content">
                <h2>관리 페이지</h2>
                <div class="d-flex profile-info mt-3">
                    <div>
                        <p>관리자님 환영합니다.</p>
                        <p>마지막 로그인: YYYY-MM-DD hh:mi:ss</p>
                    </div>
                    <div class="flex-fill text-center">
                        <p>총 상품 갯수</p>
                        <p><strong>10</strong> 개</p>
                    </div>
                    <div class="flex-fill text-center">
                        <p>총 주문 갯수</p>
                        <p><strong>4</strong> 개</p>
                    </div>
                </div>
                <hr class="hr my-4"/>
                <div class="total-products p-2 mb-4">
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
                                    <!-- 테이블 row 시작-->
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-1">
                                                <label class="custom-control-label" for="product-select-1"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#1</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-2">
                                                <label class="custom-control-label" for="product-select-2"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#2</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-3">
                                                <label class="custom-control-label" for="product-select-3"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#3</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-4">
                                                <label class="custom-control-label" for="product-select-4"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#4</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-5">
                                                <label class="custom-control-label" for="product-select-5"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#5</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-6">
                                                <label class="custom-control-label" for="product-select-6"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#6</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-7">
                                                <label class="custom-control-label" for="product-select-7"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#7</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-8">
                                                <label class="custom-control-label" for="product-select-8"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#8</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-9">
                                                <label class="custom-control-label" for="product-select-9"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#9</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
        
                                    <tr class="table-light text-center">
                                        <!-- 상품선택 -->
                                        <!-- 라벨을 줘야해서 id를 선택해야 했음. js 처리할때 귀찮을 수 있으므로 상의 좀 해봐야 됨. -->
                                        <td class="align-middle">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input product-select" id="product-select-10">
                                                <label class="custom-control-label" for="product-select-10"></label>
                                            </div>
                                        </td>
                                        <!-- 상품 번호-->
                                        <th scope="row" class="align-middle prodNum">#10</th>
                                        <!-- 카테고리 -->
                                        <td class="align-middle">DS</td>
                                        <!-- 상품이미지 -->
                                        <td class="align-middle">
                                            <img src="../resources/image/왕슈크림도넛.jpg" alt="이미지 깨짐" class="rounded-circle" width="50px">
                                        </td>
                                        <!-- 상품명 -->
                                        <td class="align-middle"><a href="#" data-toggle="modal" data-target="#productDetailsModal">왕슈크림도넛</a></td>
                                        <!-- 상품가격 -->
                                        <td class="align-middle">3,500원</td>
                                        <!-- 재고수량 -->
                                        <td class="align-middle">22개</td>
                                        <!-- 상품상태 -->
                                        <td class="align-middle">
                                            <div class="tm-status-circle moving"></div>
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
                                </tbody>
                            </table>
                        </div>
                        <!-- 게시판 페이징 -->
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
                    </form>
                </div>

                <hr class="hr my-5"/>

                <div class="total-orders p-2 mb-4" id="orderList">
                    <div class="d-flex justify-content-between mb-2 align-items-center">
                        <h3>주문 목록 리스트</h3>
                        <form class="form-inline my-2 my-lg-0" id="orderSearchForm">
                            <div class="input-group">
                                <select class="form-control mr-sm-1" id="searchOrderSelect">
                                    <option selected>검색조건</option>
                                    <option value="orderProd">주문상품</option>
                                    <option value="orderId">주문번호</option>
                                    <option value="orderStatus">배송상태</option>
                                </select>
                                <input class="form-control mr-sm-0" type="text" placeholder="Search" id="orderSearchKeyword">
                                <div class="input-group-append">
                                    <button class="btn btn-secondary my-2 my-sm-0" style="height: 35px;" type="submit">검색</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="table-wrapper">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr class="table-secondary text-center">
                                    <th style="width: 30px;">NO.</th>
                                    <th>상태</th>
                                    <th>주문 상품</th>
                                    <th>주문 수량</th>
                                    <th>주문 금액</th>
                                    <th>주문 일자</th>
                                    <th>구매자</th>
                                    <th style="width: 50px">수정</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <!-- 주문 번호 -->
                                    <th scope="row" class="align-middle">#12341</th>
                                    <!-- 배송 상태 -->
                                    <td class="align-middle del-status">
                                        <div class="tm-status-circle moving ml-2"></div><span>배송중</span>
                                    </td>
                                    <!-- 주문 수량 -->
                                    <td class="align-middle">
                                        6개
                                    </td>
                                    <!-- 주문 명 -->
                                    <td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">까망쿠키 치즈 1호 케이크 외 2종</a></td>
                                    <!-- 주문 금액 -->
                                    <td class="align-middle">35,000원</td>
                                    <!-- 주문 일자 -->
                                    <td class="align-middle">2024-08-04 12:02:33</td>
                                    <!-- 구매자 -->
                                    <td class="align-middle">
                                        김*윤
                                    </td>
                                    <!-- 상품수정 -->
                                    <td class="align-middle">
                                        <a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
    
                                <tr class="text-center">
                                    <!-- 주문 번호 -->
                                    <th scope="row" class="align-middle">#12342</th>
                                    <!-- 배송 상태 -->
                                    <td class="align-middle del-status">
                                        <div class="tm-status-circle pending ml-2"></div><span>배송대기</span>
                                    </td>
                                    <!-- 주문 수량 -->
                                    <td class="align-middle">
                                        12개
                                    </td>
                                    <!-- 주문 명 -->
                                    <td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">까놀레</a></td>
                                    <!-- 주문 금액 -->
                                    <td class="align-middle">42,000원</td>
                                    <!-- 주문 일자 -->
                                    <td class="align-middle">2024-08-04 11:58:14</td>
                                    <!-- 구매자 -->
                                    <td class="align-middle">
                                        정*상
                                    </td>
                                    <!-- 수정 -->
                                    <td class="align-middle">
                                        <a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
    
                                <tr class="text-center">
                                    <!-- 주문 번호 -->
                                    <th scope="row" class="align-middle">#12343</th>
                                    <!-- 배송 상태 -->
                                    <td class="align-middle del-status">
                                        <div class="tm-status-circle cancelled ml-2"></div><span>주문취소</span>
                                    </td>
                                    <!-- 주문 수량 -->
                                    <td class="align-middle">
                                        1개
                                    </td>
                                    <!-- 주문 명 -->
                                    <td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">진한 가나슈 케이크</a></td>
                                    <!-- 주문 금액 -->
                                    <td class="align-middle">28,000원</td>
                                    <!-- 주문 일자 -->
                                    <td class="align-middle">2024-08-04 08:47:34</td>
                                    <!-- 구매자 -->
                                    <td class="align-middle">
                                        임*정
                                    </td>
                                    <!-- 수정 -->
                                    <td class="align-middle">
                                        <a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
    
                                <tr class="text-center">
                                    <!-- 주문 번호 -->
                                    <th scope="row" class="align-middle">#12344</th>
                                    <!-- 배송 상태 -->
                                    <td class="align-middle del-status">
                                        <div class="tm-status-circle deliver-clear ml-2"></div><span>배송완료</span>
                                    </td>
                                    <!-- 주문 수량 -->
                                    <td class="align-middle">
                                        11개
                                    </td>
                                    <!-- 주문 명 -->
                                    <td class="align-middle"><a href="#" data-toggle="modal" data-target="#orderDetailsModal">갈릭버터소금빵 외 3종</a></td>
                                    <!-- 주문 금액 -->
                                    <td class="align-middle">24,000원</td>
                                    <!-- 주문 일자 -->
                                    <td class="align-middle">2024-08-03 20:37:54</td>
                                    <!-- 구매자 -->
                                    <td class="align-middle">
                                        김*수
                                    </td>
                                    <!-- 수정 -->
                                    <td class="align-middle">
                                        <a href="#" data-toggle="modal" data-target="#orderUpdateModal"><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div>
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
                </div>

                <hr class="hr my-5"/>

            </section>
            <!-- 메인 섹션 종료 -->
            <!-- 상품 상세 호출 모달 시작 -->
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
            <!-- 상품 상세 호출 모달 끝 -->
            <!-- 상품 수정 호출 모달 시작 -->
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

            <div class="modal fade" id="orderDetailsModal">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h3 class="modal-title">주문상세내역</h3>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                            
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="modal-content-1">
                                <h5 class="h5"><strong>주문자정보</strong></h5>
                                <table class="table table-sm table-bordered">
                                    <colgroup>
                                        <col width="120">
                                        <col width="*">
                                        <col width="120">
                                        <col width="*">
                                    </colgroup>
                                    
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                                <div class="tb-left">주문번호</div>
                                            </th>
                                            <td>
                                                <div class="tb-left">20240813-0001</div>
                                            </td>			
                                            <th scope="row">
                                                <div class="tb-left">주문일자</div>
                                            </th>
                                            <td>
                                                <div class="tb-left">2024.08.13</div>
                                            </td>				
                                        </tr>
                                                        
                                        <tr>
                                            <th scope="row">
                                                <div class="tb-left">주문자</div>
                                            </th>
                                            <td>
                                                <div class="tb-left">황망고</div>
                                            </td>			
                                            <th scope="row">
                                                <div class="tb-left">주문서 입금현황</div>
                                            </th>
                                            <td>
                                                <div class="tb-left">입금완료</div>
                                            </td>
                                        </tr>
                                                        
                                        <tr>
                                            <th scope="row">
                                                <div class="tb-left">주문 메모</div>
                                            </th>
                                            <td colspan="3"> 
                                                <div class="tb-left"></div>
                                            </td>								
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
						    <div class="modal-content-2">
                                <h5 class="h5"><strong>배송지 정보</strong></h5>
                                <table class="table table-sm table-bordered">
								    <colgroup>
									    <col width="120">
									    <col width="*">
									    <col width="120">
									    <col width="*">
								    </colgroup>

								    <tbody>
								        <tr>
								            <th scope="row">
								                <div class="tb-left">송장번호</div>
								            </th>
								            <td colspan="3">
								               <div class="tb-left">CJ대한통운 - 12345678910</div>
								            </td>
								        </tr>
								
                                        <tr class="">
                                            <th scope="row" style="width:15%">
                                                <div class="tb-left">수취인</div>
                                            </th>
                                            <td style="width:40%">
                                                <div class="tb-left">황망고</div>
                                            </td>
                                            <th style="width:15%">
                                                <div class="tb-right">연락처</div>
                                            </th>
                                            <td style="width:30%">
                                                <div class="tb-right">010-7658-3716</div>
                                            </td>
                                        </tr>
								
								        <tr>
								            <th scope="row">
								                <div class="tb-left">주소</div>
								            </th>
								            <td colspan="3">
								                <div class="tb-left">(03077)서울 종로구 창경궁로 254, 402호</div>
								            </td>
								        </tr>
								
								            <tr>
								                <th scope="row">
								                    <div class="tb-left">배송메세지</div>
								                </th>
								                <td colspan="3">
								                    <div class="tb-left">문 앞에 놔주세요.</div>
								                </td>
								            </tr>
								    </tbody>
								</table>
                            </div>
							
                            <div class="modal-content-3">
                                <h5 class="h5"><strong>주문상품정보</strong></h5>
                                <table class="table order-list-table">
                                    <thead>
                                        <tr class="text-center">
                                            <th scope="row">
                                                이미지
                                            </th>
                                            <th scope="row">
                                                주문상품
                                            </th>
                                            <th scope="row">
                                                수량
                                            </th>
                                            <th scope="row">
                                                가격
                                            </th>		
                                            <th scope="row">
                                                처리상태
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="text-center">
                                            <td>
                                                <div class="tb-center"><img src="../resources/image/bread/자연효모빵.jpg" style="width: 100px; height: 100px"></div>
                                            </td>
                                            <td>
                                                <div class="tb-left">자연효모빵</div>
                                            </td>					
                                            <td>
                                                <div class="tb-center">2</div>
                                            </td>
                                            <td>
                                                <div class="tb-center"><strong><font color="#FF5D00">9,200원</font></strong></div>
                                            </td>
                                            <td>
                                                <div class="tb-center"><strong><font color="blue">배송중</font></strong></div>
                                            </td>
                                        </tr>
                                        <tr class="text-center">
                                            <td>
                                                <div class="tb-center"><img src="../resources/image/bread/오렌지케익.jpg" style="width: 100px; height: 100px"></div>
                                            </td>
                                            <td>
                                                <div class="tb-left">오렌지케잌</div>
                                            </td>
                                            <td>
                                                <div class="tb-center">1</div>
                                            </td>
                                            <td>
                                                <div class="tb-center"><strong><font color="#FF5D00">22,000원</font></strong></div>
                                            </td>
                                            <td>
                                                <div class="tb-center"><strong><font color="blue">배송중</font></strong></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6" style=text-align:right;>31,200원(상품구매금액) + 0원(배송료) = <b>31,200</b>원</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- 모달컨텐츠영역 end-->
                        </div>
                    </div>
                </div>
            <!-- 모달 끝 -->
            </div>

            <div class="modal fade" id="orderUpdateModal">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h3 class="modal-title">주문상세내역</h3>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                            
                        <!-- Modal body -->
                        <div class="modal-body">
                            <form action="#" id="orderUpdateSubmit">
                                <div class="modal-content-1">
                                    <h5 class="h5"><strong>주문자정보</strong></h5>
                                    <table class="table table-sm table-bordered">
                                        <colgroup>
                                            <col width="120">
                                            <col width="*">
                                            <col width="120">
                                            <col width="*">
                                        </colgroup>
                                        
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <div class="tb-left">주문번호</div>
                                                </th>
                                                <td>
                                                    <div class="tb-left">20240813-0001</div>
                                                </td>			
                                                <th scope="row">
                                                    <div class="tb-left">주문일자</div>
                                                </th>
                                                <td>
                                                    <div class="tb-left">2024.08.13</div>
                                                </td>				
                                            </tr>
                                                            
                                            <tr>
                                                <th scope="row">
                                                    <div class="tb-left">주문자</div>
                                                </th>
                                                <td>
                                                    <div class="tb-left">황망고</div>
                                                </td>			
                                                <th scope="row">
                                                    <div class="tb-left">주문서 입금현황</div>
                                                </th>
                                                <td>
                                                    <div class="tb-left">입금완료</div>
                                                </td>
                                            </tr>
                                                            
                                            <tr>
                                                <th scope="row">
                                                    <div class="tb-left">주문 메모</div>
                                                </th>
                                                <td colspan="3"> 
                                                    <div class="d-flex align-items-center">
                                                        <textarea id="memo" rows="1" style="resize: none; width:95%;"></textarea>
                                                    </div>
                                                </td>								
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-content-2">
                                    <h5 class="h5"><strong>배송지 정보</strong></h5>
                                    <table class="table table-sm table-bordered">
                                        <colgroup>
                                            <col width="120">
                                            <col width="*">
                                            <col width="120">
                                            <col width="*">
                                        </colgroup>
    
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <div class="tb-left">송장번호</div>
                                                </th>
                                                <td colspan="3">
                                                <div class="tb-left">CJ대한통운 - 12345678910</div>
                                                </td>
                                            </tr>
                                    
                                            <tr>
                                                <th scope="row" style="width:15%">
                                                    <div class="tb-left">
                                                        수취인
                                                    </div>
                                                </th>
                                                <td style="width:40%">
                                                    <div class="tb-left d-flex align-items-center">
                                                        <input id="receiver" value="황망고" style="width: 60%;" required />
                                                    </div>
                                                </td>
                                                <th style="width:15%">
                                                    <div class="tb-right">연락처</div>
                                                </th>
                                                <td style="width:30%">
                                                    <div class="tb-right">
                                                        <input id="receiverPhone" value="010-7658-3716" style="width: 80%;" required />
                                                    </div>
                                                </td>
                                            </tr>
                                    
                                            <tr>
                                                <th scope="row">
                                                    <div class="tb-left">주소</div>
                                                </th>
                                                <td colspan="3">
                                                    <div class="input-group d-flex justify-content-start w-100">
                                                        <input id="recevierPostNo" class="form-control" value="03077" style="width: 10%;" disabled/>
                                                        <input id="recevierAddr" class="form-control input-group-append" value="서울 종로구 창경궁로 254" style="width: 50%;" disabled/>
                                                        <input id="recevierDetailsAddr" class="form-control input-group-append" value="402호" style="width: 20%;" required />
                                                        <div class="input-group-append">
                                                            <button class="btn btn-secondary " type="button" onclick="execDaumPostcode()">주소검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <div class="tb-left">배송메세지</div>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="tb-left">문 앞에 놔주세요.</div>
                                                    </td>
                                                </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="modal-content-3">
                                    <h5 class="h5"><strong>주문상품정보</strong></h5>
                                    <table class="table order-list-table">
                                        <thead>
                                            <tr class="text-center">
                                                <th scope="row">
                                                    이미지
                                                </th>
                                                <th scope="row">
                                                    주문상품
                                                </th>
                                                <th scope="row">
                                                    수량
                                                </th>
                                                <th scope="row">
                                                    가격
                                                </th>		
                                                <th scope="row">
                                                    처리상태
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="orderProductData">
                                            <tr class="text-center">
                                                <td>
                                                    <div class="tb-center"><img src="../resources/image/bread/자연효모빵.jpg" style="width: 100px; height: 100px"></div>
                                                </td>
                                                <td>
                                                    <div class="product-name">자연효모빵</div>
                                                </td>					
                                                <td>
                                                    <div class="tb-center">2</div>
                                                </td>
                                                <td>
                                                    <div class="tb-center"><strong>9,200원</strong></div>
                                                </td>
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        <select class="form-control" id="orderState1" style="width:50%;">
                                                            <option value="1">배송대기</option>
                                                            <option value="2" selected>배송중</option>
                                                            <option value="3">배송완료</option>
                                                            <option value="4">주문취소</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="text-center">
                                                <td>
                                                    <div class="tb-center"><img src="../resources/image/bread/오렌지케익.jpg" style="width: 100px; height: 100px"></div>
                                                </td>
                                                <td>
                                                    <div class="product-name">오렌지케잌</div>
                                                </td>
                                                <td>
                                                    <div class="tb-center">1</div>
                                                </td>
                                                <td>
                                                    <div class="tb-center"><strong>22,000원</strong></div>
                                                </td>
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        <select class="form-control" id="orderState2" style="width:50%;">
                                                            <option value="1">배송대기</option>
                                                            <option value="2" selected>배송중</option>
                                                            <option value="3">배송완료</option>
                                                            <option value="4">주문취소</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="4" style=text-align:right;>
                                                    <div class="d-flex justify-content-end align-items-center mt-1">
                                                        31,200원(상품구매금액) + 0원(배송료) = <b>31,200</b>원
                                                    </div>
                                                </td>
                                                <td colspan="2" class="pr-0">
                                                    <div class="d-flex justify-content-end align-items-center">
                                                        <button type="submit" class="btn btn-secondary btn-sm">수정</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </form>
                            <!-- 모달컨텐츠영역 end-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 끝 -->
    	</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>