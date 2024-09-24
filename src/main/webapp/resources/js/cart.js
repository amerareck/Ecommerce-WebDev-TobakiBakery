// 계속 쇼핑하기 버튼 기능
document.querySelector('.btns_order .btn-outline-secondary:nth-child(2)').addEventListener('click', function () {
    window.location.href = '../product/productListAll';
});

$('#selectAll').on('change', function(event){
	const isChecked = $(this).is(':checked');
	
	$('.item-select').each(function(index){
        $(this).prop('checked', isChecked);
    });
});

$('#selectRemover').on('click', function(event){
	if(!confirm('선택하신 장바구니 상품을 삭제할까요?')) return;
	
	const list = [];
	$('.item-select:checked').each(function(){
		let productId = $(this).attr('id').split('-')[2];
		list.push({productId});
	});
	console.log(list);
	
	$.ajax({
		url: 'deleteCartItems',
		method: 'post',
		contentType: 'application/json',
		data: JSON.stringify(list),
		success: function(data){
			if (data.status === 'ok') {
				alert('선택한 장바구니 상품이 삭제되었습니다.');
				location.href='cart';
			} else if (data.status === 'not-found-user') {
				alert('로그인 후 다시 시도해주십시오.');
				location.href='../login';
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	});
});

$('.quantity-minus').on('click', function(event){
	let countHandler = $(this).parent().find('input').val();
	if(countHandler <= 1) {
		return;
	} else {
		countHandler = parseInt(countHandler)-1;
	}
	
	const productId = $(this).attr('id').split('-')[1];
	const target = $(this).parent().find('input');
	
	$.ajax({
		url: 'updateQty',
		method: 'post',
		data: {productId, countHandler},
		success: function(data) {
			if(data.status === 'ok') {
				target.val(countHandler);
				let format = new Intl.NumberFormat('en-US').format(data.productPrice);
				$('#productPriceNumber-'+productId).text(format+'원');
				format = new Intl.NumberFormat('en-US').format(data.totalPrice);
				$('#orderTotalPrice').text(format+'원');
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	})
});

$('.quantity-plus').on('click', function(event){
	let countHandler = $(this).parent().find('input').val();
	if(countHandler > 9) {
		return;
	} else {
		countHandler = parseInt(countHandler)+1;
	}
	
	const productId = $(this).attr('id').split('-')[1];
	const target = $(this).parent().find('input');
	
	$.ajax({
		url: 'updateQty',
		method: 'post',
		data: {productId, countHandler},
		success: function(data) {
			if(data.status === 'ok') {
				target.val(countHandler);
				let format = new Intl.NumberFormat('en-US').format(data.productPrice);
				$('#productPriceNumber-'+productId).text(format+'원');
				format = new Intl.NumberFormat('en-US').format(data.totalPrice);
				$('#orderTotalPrice').text(format+'원');
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	})
});

$('#emptyCart').on('click', function(){
	if(!confirm('모든 장바구니를 비우시겠습니까?')) return;
	
	const list = [];
	$('.item-select').each(function(){
		let productId = $(this).attr('id').split('-')[2];
		list.push({productId});
	});
	console.log(list);
	
	$.ajax({
		url: 'deleteCartItems',
		method: 'post',
		contentType: 'application/json',
		data: JSON.stringify(list),
		success: function(data){
			if (data.status === 'ok') {
				alert('모든 장바구니 상품을 삭제하였습니다.');
				location.href='cart';
			} else if (data.status === 'not-found-user') {
				alert('로그인 후 다시 시도해주십시오.');
				location.href='../login';
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	});
});

$('#orderProcess').on('click', function(){
	const list = [];
	$('.item-select').each(function(){
		const target = $(this).closest('tr');
		const dto = {};
		dto.productId = $(this).attr('id').split('-')[2];
		dto.orderProductCount = target.find('#productQuantity-'+dto.productId).val();
		dto.orderProductPrice = target.find('#productPriceNumber-'+dto.productId).data('product-price');
		list.push(dto);
	});
	console.log(list);
	
	$.ajax({
		url: 'sendCart',
		method: 'post',
		contentType: 'application/json; charset=UTF-8',
		data: JSON.stringify(list),
		success: function(data) {
			if(data.status === 'ok') {
				location.href=data.redirect;
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	});
});
