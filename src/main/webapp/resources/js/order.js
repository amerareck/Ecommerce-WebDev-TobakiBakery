$('#orderSubmitButton').on('click', function(event){
	if($('#disagree').is(':checked')) {
		showModal('주의','약관에 동의하지 않으시면 물품을 구매하실 수 없습니다.');
		return;
	}
	
	const orderForm = {};
	
	orderForm.receiverName = $('#receiverName').val();
	orderForm.deliveryPostNum = $('#deliveryPostNum').val();
	orderForm.deliveryAddress = $('#deliveryAddress').val();
	orderForm.deliveryAddressDetail = $('#deliveryAddressDetail').val();
	orderForm.orderMemo = $('#orderMemo').val().replace(/\n/g, '<br>');
	orderForm.orderTotalPrice = $('#orderTotalPrice').val();
	
	orderForm.receiverPhoneNum = '';
	$('#receiverPhoneNumber').find('input').each(function(index){
		const number = $(this).val().replace(/\./g, '');
		orderForm.receiverPhoneNum += number;
	});
	
	orderForm.productList = [];
	$('.product-set').each(function(){
		const product = {};
		const productId = $(this).attr('data-productId');
		product.productId = productId;
		product.productName = $(this).find('#productName-'+productId).attr('data-productName');
		product.cartCount = $(this).find('#cartCount-'+productId).attr('data-cartCount');
		product.productPrice = $(this).find('#productPrice-'+productId).attr('data-productPrice');
		orderForm.productList.push(product);
	});
	
	console.log(orderForm);
	
	$.ajax({
		url: 'submitOrder',
		method: 'post',
		contentType: 'application/json',
		data: JSON.stringify(orderForm),
		success: function(response) {
			if (response.status === 'ok') {
				location.href = response.redirect+'?orderNumber='+response.orderNumber;
				
			} else if (response.status === 'not-add-order') {
				showModal('서버에서 알 수 없는 오류로 주문 처리를 진행하지 못하였습니다.\n잠시 후 다시 시도해 보세요.');
				location.href = response.redirect;
			
			} else if (response.status === 'not-remove-cart') {
				showModal('서버에서 장바구니를 삭제하지 못하였습니다.');
				location.href = response.redirect;
				
			} else if (response.status === 'fail') {
				console.log('유효성 검증 실패');
				$('#receiverPhoneNum-error-message').empty();
				$('#orderMemo-error-message').empty();
				$('#error-message').empty();
				
	            const errorMap = response.errors;
	            for (const field in errorMap) {
	            	let target;
	            	if (field == 'receiverName') {
	            		target = $('#receiverName-error-message');
	            	} else if (field == 'receiverPhoneNum') {
	            		target = $('#receiverPhoneNum-error-message');
	            	} else if (field == 'orderMemo') {
	            		target = $('#orderMemo-error-message');
	            	} else {
	            		target = $('#error-message');
	            	}
	                $(`<strong id=${field}Error></strong>`).text(errorMap[field]).appendTo(target);
	                target.append($('<br/>'));
	                console.log(field + ': ' + errorMap[field]);
	            }
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	});
});

$('#orderSearchPostCode').on('click', function(event){
	new daum.Postcode({
		oncomplete: function(data) {
			let addr = '';
			let extraAddr = '';
			
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
			
			$('#deliveryPostNum').val(data.zonecode);
			$('#deliveryAddress').val(addr);
			$('#deliveryAddressDetail').focus();
		}
	}).open();
});