<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
    
   
	<!-- 사이드바 부분입니다. -->
	<hr>
	<div class="container">
	<nav class="breadcrumb-container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../index.html"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="../mypage/mypage-main.html">마이페이지</a></li>
                <li class="breadcrumb-item"><a href="../mypage/mypage-review.html">나의 상품 후기</a></li>
                
                
            </ol>
        </nav>
        <div class="main-content">
            <aside class="sidebar">
                <h3>쇼핑정보</h3>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item"><a class="nav-link" href="../mypage/mypage-order-delivery.html">주문배송현황</a></li>
                                 
                </ul>
                <hr class="hr"/>
                
                <h3>활동정보</h3>
                <ul class="nav nav-pills flex-column">
                    
                    <li class="nav-item"><a class="nav-link" href="../order/orderCart-static.html">장바구니</a></li>                 
                    <li class="nav-item"><a class="nav-link" href="../mypage/mypage-review.html">나의 상품 후기</a></li>
                </ul>
                <hr class="hr"/>
                <h3>개인정보</h3>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item"><a class="nav-link" href="../member/member-edit.html">회원정보수정</a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><button id="delete-account">회원탈퇴</button></a></li>
                </ul>
            </aside>
            <!-- content부분입니다. -->
                        <section class="content">
                <h2>나의 상품 후기</h2>
                <div class="review-summary">
                    <p><span>황망고</span>님이 쇼핑몰에 작성한 상품후기 내역입니다.</p>
                </div>
                <table class="review-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>사진</th>
                            <th>상품명</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>조회</th> 
                            <th></th>               
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td>2</td>
                            <td><a href="../product/itemDetail.static.html"><img src="${pageContext.request.contextPath}/resources/image/bread/팡도르.jpg" alt="상품 이미지"></a></td>
                            <td>
                                <p class="item-name">팡도르</p>
                                
                            </td>
                            <td>빵이 다음 날 먹어도 쫄깃해요</td>
                            <td>2024-08-05</td>
                            <td>27</td>
                            
                            <td>
                                                          
                                <button class="btn-delete" style="margin-top: 10px;">후기삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="../product/itemDetail.static.html"><img src="${pageContext.request.contextPath}/resources/image/bread/파네토네.jpg" alt="상품 이미지"></a></td>
                            <td>
                                <p class="item-name">파네토네</p>
                                
                            </td>
                            <td>빵이 진짜 부드럽고 많이 안달아요</td>
                            <td>2024-07-24</td>
                            <td>39</td>
                            
                            <td>
                                                                
                                <button class="btn-delete" style="margin-top: 10px;">후기삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                        
            </section>
        </div>
    </div>
    
	<!-- content 부분 끝입니다. -->
	
	<script>
       
        document.getElementById('delete-account').addEventListener('click', function() {
           
            const userConfirmed = confirm("정말 탈퇴하시겠습니까?");
            
            if (userConfirmed) {
               
                alert("탈퇴가 완료되었습니다.");
                
            } else {
                
            }
        });
    </script>
	<script>
    <!--모든 삭제 버튼에 클릭 이벤트 추가-->
    document.querySelectorAll('.btn-delete').forEach(function(button) {
        button.addEventListener('click', function(event) {
            
            var row = event.target.closest('tr');
            
            
            row.remove();
            
           
            alert("후기가 삭제되었습니다.");
        });
    });
</script>
<script>
	$(document).ready(function () {
$("footer").load("../common/Footer.html");
$("header").load("../common/Header.html"); 
	});
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
    