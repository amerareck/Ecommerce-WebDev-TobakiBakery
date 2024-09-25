$('#orderSubmitButton').on('click', function(event){
	if($('#disagree').is(':checked')) {
		alert('약관에 동의하지 않으시면 물품을 구매하실 수 없습니다.');
		return;
	}
	
	const orderForm = {};
	
	orderForm.receiverName = $('#receiverName').val();
	orderForm.deliveryPostNum = $('#deliveryPostNum').val();
	orderForm.deliveryAddress = $('#deliveryAddress').val();
	orderForm.deliveryAddressDetail = $('#deliveryAddressDetail').val();
	orderForm.deliveryMemo = $('#deliveryMemo').text().replace(/\n/g, "<br>");
	orderForm.orderTotalPrice = $('#orderTotalPrice').val();
	
	let stopSubmit = false;
	orderForm.receiverPhoneNum = '';
	$('#receiverPhoneNumber').find('input').each(function(index){
		const number = $(this).val().replace(/\./g, '');
		if(index == 0) {
			const startNumber = '01';
			const compare = number.split('')[0]+number.split('')[1];
			if(startNumber !== compare) {
				alert(`휴대번호는 '01X'으로 시작되어야만 합니다.`);
				stopSubmit = true;
				return;
			} else if(number.length != 3){
				alert(`휴대번호 앞 3자리를 정확히 입력해주십시오.`);
				stopSubmit = true;
				return;
			}
		} else if (!/^\d+$/.test(number)) {
			alert(`휴대번호는 숫자만 입력하여 주십시오.`);
			stopSubmit = true;
			return;
		} else if (index != 0 && number.length != 4) {
			alert(`휴대번호 중간 혹은 끝 자리는 정확히 4자의 숫자만을 입력해 주십시오.`);
			stopSubmit = true;
			return;
		}
		orderForm.receiverPhoneNum += number;
	});
	if(stopSubmit) return;
	
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
				alert('서버에서 알 수 없는 오류로 주문 처리를 진행하지 못하였습니다.\n잠시 후 다시 시도해 보세요.');
				location.href = response.redirect;
			
			} else if (response.status === 'not-remove-cart') {
				alert('서버에서 장바구니를 삭제하지 못하였습니다.');
				location.href = response.redirect;
				
			} else if (response.status === 'fail') {
				const errorMap = response.errorMap;
				for (const field in errorMap) {
					const target = $('#error-massage');
                    $(`<span id=${field}Error></span>`).text(errors[field]).appendTo(target);
                    target.append($('<br/>'));
                }
			}
		},
		error: function(xhr, status, error) {
	        console.log('에러 발생:', error);
	    }
	});
	
});