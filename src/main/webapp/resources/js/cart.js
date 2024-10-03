// 계속 쇼핑하기 버튼 기능
$('#continueShoping').on('click', function (event) {
    location.href = '../product/productListAll';
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
				showModal('장바구니 삭제','선택한 장바구니 상품이 삭제되었습니다.');
				location.href='cart';
			} else if (data.status === 'not-found-user') {
				showModal('로그인 요청','로그인 후 다시 시도해주십시오.');
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
				showModal('장바구니 삭제','모든 장바구니 상품을 삭제하였습니다.');
				location.href='cart';
			} else if (data.status === 'not-found-user') {
				showModal('로그인 요청','로그인 후 다시 시도해주십시오.');
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
	$('#out-of-stock-row').remove();
	$('#sold-out-row').remove();
	const outOfStock = $(`
		<tr id="out-of-stock-row">
			<td colspan="6" class="pl-4">
				<div id="out-of-stock-message" class="text-danger" style="font-size: 0.7rem">
					<strong>죄송합니다. 현재 해당 상품은 재고가 부족하여 주문 처리를 수행할 수 없습니다.</strong>
				</div>
			</td>
		</tr>
	`);
	const soldOut = $(`
		<tr id="sold-out-row">
			<td colspan="6" class="pl-4">
				<div id="sold-out-message" class="text-danger" style="font-size: 0.7rem">
					<strong>죄송합니다. 현재 상품은 품절되었습니다. 빠르게 준비하도록 하겠습니다.</strong>
				</div>
			</td>
		</tr>
	`);
	
	$('.item-select').each(function(){
		if (!$(this).is(':checked')) return;
		
		const target = $(this).closest('tr');
		const dto = {};
		dto.productId = $(this).attr('id').split('-')[2];
		dto.cartCount = target.find('#productQuantity-'+dto.productId).val();
		dto.productCurrentPrice = target.find('#productPriceNumber-'+dto.productId).data('product-price');
		list.push(dto);
	});
	console.log(list);
	if(list.length < 1) {
		showModal('선택하신 상품이 존재하지 않습니다.');
		return;
	}
	
	$.ajax({
		url: 'sendCart',
		method: 'post',
		contentType: 'application/json; charset=UTF-8',
		data: JSON.stringify(list),
		success: function(data) {
			if(data.status === 'ok') {
				location.href=data.redirect;
			} else if(data.status === 'not_sale') {
				console.log(data.notSaleProductId);
				console.log(data.soldOutProductId);
				
				if(data.notSaleProductId !== undefined && data.notSaleProductId.length) {
					console.log('재고부족: '+data.notSaleProductId);
					$.each(data.notSaleProductId, function(index, value){
						$('#cartRow-'+value).after(outOfStock);
					});
				}
				if(data.soldOutProductId !== undefined && data.soldOutProductId.length) {
					console.log('상품매진: '+data.soldOutProductId);
					$.each(data.soldOutProductId, function(index, value){
						$('#cartRow-'+value).after(soldOut);
					});
					console.log(data.soldOutProductId);
				}
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	});
});
