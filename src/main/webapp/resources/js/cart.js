// 계속 쇼핑하기 버튼 기능
$('.btns_order .btn-outline-secondary:nth-child(2)').on('click', function () {
    window.location.href = '../product/productListAll';
});


// 장바구니 비우기 버튼 기능
$('.btns_order .btn-outline-secondary:nth-child(3)').on('click', function () {
    $('#cartTable tbody tr').each(function() {
        $(this).remove();
    });
    updateTotalPrice();
});




    // 선택상품 주문하기 버튼 기능 & 유효성 체크
    $('.btns_order .btn-outline-danger').on('click', function() {
        console.log("Order button clicked");
        const checkedItems = $('#cartTable tbody input[type="checkbox"]:checked');
        
        if (checkedItems.length > 0) {
            window.location.href = '${pageContext.request.contextPath}/mypage/mypageOrder';
        } else {
            alert("선택된 제품이 없습니다.");
        }
    });


