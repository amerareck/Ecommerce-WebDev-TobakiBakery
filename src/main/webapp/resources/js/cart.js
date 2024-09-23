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
//전체선택 체크박스
$(document).ready(function(){
	$('#allchk').prop('checked', true);
	$('.product-checkbox').prop('checked', true);
	calculatePrice();
	
	$('#allchk').click(function() {
		let ischecked = $(this).is(':checked');
		$('.product-checkbox').prop('checked',ischecked);
		calculatePrice();
	});
	$('.product-checkbox').change(function(){
		calculatePrice();
	});
});
//결제 가격 업뎃
function calculatePrice(){
	let totalOrderPrcie=0;
	let deliveryPrice=3000;
	
	//체크 상품 업뎃
	$('.product-checkbox:checked').each(function(){
		let price = parseInt($(this).data('price'));
		let cartCount = parseInt($(this).closest('.product'),find('.quantity-number').text());
		totalOrderPrice +=price * cartCount;
	});
	let totalPrice = deliveryPrice + totalOrderPrice;
	
	$('#sumPrice').text(totalOrderPrice.toLocaleString()+' 원');
	$('#totalPrice-num').text(totalPrice.toLocaleString());
}
//상품 삭제
//삭제 버튼
$(document).on('click', '.btn-danger btn-sm', function(){
	deleteProduct(this);
	calculatePrice();
})
//선택삭제
$('#choice-delete').on('click', function() {
	deleteSelected();
});
$('#order-button').on('click', function() {
	orderSelected();
})
function toOrder(data){
	$.ajax({
		url:"toOrder",
	    method:"GET",
	   data: {
		   productId : $(data).data("productId")
		   },
	   success: function() {
	   },
	   error:function(){
		   alert("에러가 발생했습니다.")
	   }
	   })
}
function orderSelected(){
	$('.product-checkbox:checked').each(function(){
		toOrder(this);
	});
		window.location.href="payment";
}
function deleteSelected() {
	$('.product-checkbox:checked').each(function(){
		deleteProduct(this);
	});
	calculatePrice();
}

// 수량 감소 함수
function decreaseQuantity(button) {
	let quantity = $(button).siblings('.quantity-number');
	let stock = parseInt($(button).parent().data('stock'));
	
	if(stock>1){
		stock-=1;
		quantity.text(stock.toLocaleString());
		$(button).parent().data('stock', stock);
		updateTotalPrice(button);
	}
}

//증가 함수
function increaseQuantity(button) {
	let quantity = $(button).siblings('.quantity-number');
	let stock = parseInt($(button).parent().data('stock'));
	stock +=1;
	
	quantity.text(stock.toLocaleString());
	$(button).parent().data('stock',stock);
	updateTotalPrice(button);
}

//수량 변경에 따른 가격 업뎃
function updateTotalPrice(button) {
	let quantity = parseInt($(button).siblings('.quantity-number').text());
	let price = parseInt($(button).parent().siblings('product-price').data('price'));
	let totalPrice = quantity * price;
	
	let productId = $(button).parent().siblings('.product-price').data('productId');
	
	$.ajax({
		url:"changeQty",
		method:"GET",
		data: {
			productId:productId,
			cartCount:cartCount
		},
		success: function(data){
			console.log(data);
			$(button).parent().siblings('.product-price').html(`<strong>${totalPrice.toLocaleString()}</strong>원`);
			
		},
		error: function(data){
			alert("수량 변경에 실패했습니다.");
		}
	})
	calculatePrice();
}
function deleteItem(data) {
	$.ajax({
		url:"deleteItem",
		method:"GET",
		data:{productId: $(data).data("productId")},
		success:function(){
			window.location.href ="orderCart";
		},
		error:function(){
			alert("삭제에 실패하였습니다.");
		}
	})
}




// 선택상품 주문하기 버튼 기능 & 유효성 체크
document.querySelector('.btns_order .btn-outline-danger').addEventListener('click', function () {
    const checkedItems = document.querySelectorAll('#cartTable tbody input[type="checkbox"]:checked');
    
    if (checkedItems.length > 0) {
        window.location.href = '../mypage/mypage-order';
    } else {
        alert("선택된 제품이 없습니다.");
    }
});

$('.cartInsert').on('click', function(event){
	const productId = $(this).attr('id').split('-')[1];
	console.log(productId);
});

