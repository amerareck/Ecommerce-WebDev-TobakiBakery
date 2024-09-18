
// 계속 쇼핑하기 버튼 기능
document.querySelector('.btns_order .btn-outline-secondary:nth-child(2)').addEventListener('click', function () {
    window.location.href = '../product/productListAll';
});

// 장바구니 비우기 버튼 기능
document.querySelector('.btns_order .btn-outline-secondary:nth-child(3)').addEventListener('click', function () {
    const cartItems = document.querySelectorAll('#cartTable tbody tr');
    cartItems.forEach(function (item) {
        item.remove(item);
    });
    updateTotalPrice();
});

$(document).ready(function() {
    $('.product-amount').each(function() {
        var productQty = $(this).data("qty"); 
        $(this).val(productQty); 
    });
	
	$('#productList').on('change', '.product-amount', function() {
		var selectedQty = $(this).val();
		var productId = $(this).data("pid");
		
		$.ajax({
			url: "updateQty",
			type: "POST",
			data: {productId : productId, cartCount : selectedcartCount},
			success: function(response) {
				console.log("장바구니 상품 수량 업데이트 완료");
			}
		});
	});
});