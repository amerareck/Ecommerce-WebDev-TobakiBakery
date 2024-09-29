src="https://code.jquery.com/jquery-3.6.0.min.js"

$('#totalProductSelect').change(function(event){
    const isChecked = $(this).is(':checked');
    
    $('.product-select').each(function(index){
        $(this).prop('checked', isChecked);
    });
});

$('#productSearchForm').on('submit', function(event) {
    const selector = $('#searchProductSelect option:selected');
    console.log(selector);

    if (selector.val() == '검색조건') {
    	showModal('검색 조건을 선택하세요.');
        event.preventDefault();
        return;
    } else if(selector.val() == 'productName') {
        const productName = $('#productSearchKeyword');
        if(!productName.val()) {
        	showModal('검색하실 상품명을 입력하세요.');
            event.preventDefault();
            return;
        }

    } else if(selector.val() == 'category') {
        const category = $('#productSearchCategory option:selected');
        if(category.val() == '카테고리') {
        	showModal('카테고리를 선택하세요.');
            event.preventDefault();
            return;
        }

    } else {
        const productState = $('#productSearchStatus option:selected');
        if(productState.val() == '상품상태') {
        	showModal('상품상태를 선택하세요.');
            event.preventDefault();
            return;
        }
    }
    
});

$('#searchProductSelect').change(function(event){
    const selected = $('#searchProductSelect option:selected').val();
    const targetTag = $('#productSearchForm .input-group').children().eq(1);

    if(selected =='category') {
        targetTag.replaceWith(
            `<select class="form-control mr-sm-0" id="productSearchCategory" name="keyword">
                <option selected>카테고리</option>
                <option value="BREAD">Bread</option>
                <option value="CAKE">Cake</option>
                <option value="DESSERT">Dessert</option> 
            </select>`
        );
    } else if(selected=='productState') {
        targetTag.replaceWith(
            `<select class="form-control mr-sm-0" id="productSearchStatus" name="keyword">
                <option selected>상품상태</option>
                <option value="ON_SALE">판매중</option>
                <option value="NOT_SALE">판매중단</option>
                <option value="SOLD_OUT">매진</option>
            </select>`
        );
    } else {
        $('#productSearchCategory, #productSearchStatus').replaceWith(
            `<input class="form-control mr-sm-0" type="text" placeholder="Search" id="productSearchKeyword" name="keyword">`
        );
    }
});
/*
$('#orderSearchForm').submit(function(event){
    event.preventDefault();
    const selector = $('select#searchOrderSelect option:selected');
    let str = '';

    if (selector.val() == '검색조건') {
        alert('검색 조건을 선택하세요.');
        return;
    } else if(selector.val() == 'orderProd') {
        const orderName = $('#orderSearchKeyword');
        if(orderName.val() == '') {
            alert('정확한 주문 이름을 입력하세요.');
            return;
        }
        str = '검색을 진행합니다.\n선택한 검색 타입 : '+selector.val()+'\n';
        str += '검색 키워드 : '+orderName.val().trim();

    } else if(selector.val() == 'orderId') {
        const orderNumber = $('#orderSearchOrderNumber');
        if(orderNumber.val() == '') {
            alert('정확한 상품 번호를 입력하세요.');
            return;
        }
        str = '검색을 진행합니다.\n선택한 검색 타입 : '+selector.val()+'\n';
        str += '입력한 상품번호 : '+orderNumber.val();
    } else {
        const productState = $('#orderSearchOrderState option:selected');
        if(productState.val() == '배송상태') {
            alert('상품상태를 선택하세요.');
            return;
        }
        str = '검색을 진행합니다.\n선택한 검색 타입 : '+selector.val()+'\n';
        str += '검색 배송상태 : '+productState.val();
    }

    alert(str);
});
*/

$('#searchOrderSelect').change(function(event){
    const selected = $('#searchOrderSelect option:selected').val();
    const targetTag = $('#orderSearchForm .input-group').children().eq(1);
    const typeTag = $('#orderSearchForm .input-group').children().eq(2);

    if(selected =='orderId') {
        targetTag.replaceWith(`
            <input class="form-control mr-sm-0" type="number" placeholder="Search" id="orderSearchOrderNumber" name="orderNumber" />
            `);
        typeTag.replaceWith(`
        	<input type="hidden" name="type" value="orderNumber" />
        `);
    } else if(selected=='orderStatus') {
        targetTag.replaceWith(`
        	<select class="form-control mr-sm-0" id="orderSearchOrderState" name="deliveryStatus" >
                <option selected>배송상태</option>
                <option value="DELIVERY_STAY">배송대기</option>
                <option value="DELIVERY_ING">배송중</option>
                <option value="DELIVERY_COMPLETE">배송완료</option>
                <option value="DELIVERY_CANCEL">주문취소</option>
            </select>
        `);
        typeTag.replaceWith(`
            	<input type="hidden" name="type" value="deliveryStatus" />
        `);
    } else {
        $('#orderSearchOrderNumber, #orderSearchOrderState').replaceWith(`
        	<input class="form-control mr-sm-0" type="text" placeholder="Search" id="orderSearchKeyword" name="productName">
        `);
        typeTag.replaceWith(`
        	<input type="hidden" name="type" value="productName" />
        `);
    }
});

$('.callPostcodeAPI').on('click', function(event){
	const orderNumber = $(this).attr('id').split('-')[1];
	const zoneCode = $('#deliveryPostNum-'+orderNumber);
	const address = $('#deliveryAddress-'+orderNumber);
	const focusTarget = $('#deliveryAddressDetail-'+orderNumber);
	
	new daum.Postcode({
		oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            // 도로명 주소와 지번 주소 구분
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
            // 주소 필드에 값 설정
            zoneCode.val(data.zonecode);
            address.val(addr);
            focusTarget.focus();
        }
	}).open();
});


$('#orderUpdateSubmit').submit(function(event){
    event.preventDefault();
    
    const phoneNumber = $('#receiverPhone').val().replace(/[^0-9]/g, '');
    const orderProductName = [];
    const orderProductState = [];
    const orderProductData = $('#orderProductData tr');
    orderProductData.each(function(index){
        orderProductName.push($(this).find('.product-name').text().trim());
        orderProductState.push($(this).find('select.form-control option:selected').text());
    });
    // 서버로 보낼 데이터 객체 생성
    const updateData = {
        memo: $('#memo').val().trim(),
        receiver: $('#receiver').val().trim(),
        phone: phoneNumber,
        postNo: $('#recevierPostNo').val().trim(),
        address: $('#recevierAddr').val().trim() + ' ' + $('#recevierDetailsAddr').val().trim(),
        products: orderProductName.map((name, index) => ({
            name: name,
            state: orderProductState[index]
        }))
    };

    // AJAX 요청 보내기
    $.ajax({
        url: "updateOrderDetails",  // 수정할 URL을 설정합니다.
        type: "post",
        contentType: "application/json",
        data: JSON.stringify(updateData),
        success: function(data) {
            if (data.status === 'ok') {
            	showModal("주문 정보가 성공적으로 수정되었습니다.");
                // 여기서 페이지 새로 고침이나 필요한 작업을 수행할 수 있습니다.
            } else {
            	showModal("주문 정보 수정에 실패했습니다.");
            }
        }
    });
});

$('.product-delete-selector').on('click', function(event){
	const productId = $(this).attr('id').split('-')[2];
	console.log(productId);
	const clickedElement = $(this);
	
	$.ajax({
		url: '../product/delete',
		type: 'post',
		data: {productId},
		success: function(data) {
			if (data.status == 'ok') {
				showModal('상품 삭제','상품이 삭제되었습니다.');
				const target = clickedElement.closest('tr');
				console.log(target);
				target.remove();
				
				if($('#productTableData').children().length === 0) {
					const pageNo = $('.page-item.active').find('a').text();
					location.href = 'main?pageNo='+(pageNo-1);
				}
			} else {
				showModal('서버에 문제가 발생하였습니다.')
			}
		},
		error: function (xhr, status, error) {
            console.log('Error: ' + error);
        }
	});
});

$('.productUpdateModal').on('show.bs.modal', function (event) {
    var modal = $(this);
    var modalId = modal.attr('id');
    var productId = modalId.split('-')[1];
    const detailImageNames = $('#updateModalDetailImageNames-'+productId);
    const thumbnailImageNames = $('#updateModalthumbnailImageNames-'+productId);
    
    detailImageNames.empty();
    thumbnailImageNames.empty();
    console.log(modalId);

    $.ajax({
        url: '../product/getImageNames',
        type: 'GET',
        data: { productId },
        success: function (data) {
        	$(`<div id="detailImageNamesRavel-${productId}" class="mt-3 mb-1"><b>현재 첨부된 파일</b></div>`).appendTo(detailImageNames);
        	$(`<div id="thumbnailImageNamesRavel-${productId}" class="mt-3 mb-1"><b>현재 첨부된 파일</b></div>`).appendTo(thumbnailImageNames);
        	let dcount = 0;
        	let tcount = 0;
            if (data.status === 'ok') {
            	console.log(data.imageNames);
            	for(let i=0; i<data.imageNames.length; i++) {
            		let imageName = data.imageNames[i];
            		if(imageName.productUsecase === 'DETAIL') {
            			$(`
                    		<div class="mb-1" data-id="${productId}">
                    			<span>${imageName.imageName}</span>
                    			<button type="button" class="d-inline-block btn btn-link p-1 deleteDetailImage" >삭제</button>
        					</div>
                    	`).appendTo(detailImageNames);
            			dcount++;
            		} else {
            			$(`
                    		<div class="mb-1" data-id="${productId}">
                    			<span>${imageName.imageName}</span>
                    			<button type="button" class="d-inline-block btn btn-link p-1 deleteThumbnailImage" >삭제</button>
        					</div>
                    	`).appendTo(thumbnailImageNames);
            			tcount++;
            		}
            	}
            	
            	if(dcount === 0) {
            		$(`
                    	<div class="mb-1"><span>현재 첨부된 파일이 존재하지 않습니다.<span></div>
                    `).appendTo(detailImageNames);
            	}
            	if(tcount === 0) {
            		$(`
            			<div class="mb-1"><span>현재 첨부된 파일이 존재하지 않습니다.<span></div>
                    `).appendTo(thumbnailImageNames);
            	}
            	
            } else if (data.status === 'no-data') {
            	console.log('이미지 없음.');
            	$(`
            		<div class="mb-2"><span>현재 첨부된 파일이 존재하지 않습니다.<span></div>
            	`).appendTo(detailImageNames);
            	$(`
                	<div class="mb-2"><span>현재 첨부된 파일이 존재하지 않습니다.<span></div>
               	`).appendTo(thumbnailImageNames);
            }
        },
        error: function (xhr, status, error) {
            console.log('Error: ' + error);
        }
    });
    
    detailImageNames.on('click', '.deleteDetailImage', function(event) {
    	const parent = $(this).parent();
    	const productId = parent.data('id');
    	const productUsecase = 'DETAIL';
    	const imageOriginalName = parent.children('span').text();
    	console.log(productId);
    	
    	$.ajax({
    		url: '../product/deleteImage',
    		type: 'post',
    		data: {productId, productUsecase, imageOriginalName},
    		success: function(data) {
    			if(data.status === 'ok') {
    				showModal('삭제 완료','상품 상세 이미지를 정상적으로 삭제하였습니다.');
    				parent.empty();
    				parent.append('<span>현재 첨부된 파일이 존재하지 않습니다.<span>');
    			} else {
    				showModal('서버에서 상품 삭제를 처리함에 있어 문제가 발생하였습니다.');
    			}
    		},
    		error: function (xhr, status, error) {
                console.log('Error: ' + error);
            }
    	})
    });
    
    thumbnailImageNames.on('click', '.deleteThumbnailImage', function(event) {
    	const parent = $(this).parent();
    	const productId = parent.data('id');
    	const productUsecase = 'THUMBNAIL';
    	const imageOriginalName = parent.children('span').text();
    	
    	$.ajax({
    		url: '../product/deleteImage',
    		type: 'post',
    		data: {productId, productUsecase, imageOriginalName},
    		success: function(data) {
    			if(data.status === 'ok') {
    				showModal('상품 상세 이미지를 정상적으로 삭제하였습니다.');
    				const grand = parent.parent();
    				parent.remove();
    				if (grand.find('span').length === 0) {
    					grand.append('<div class="mb-2"><span>현재 첨부된 파일이 존재하지 않습니다.<span></div>');
    					const imageTarget = $('#updateProductImagefile-'+productId);
    					imageTarget.attr('src', '../resources/image/no-thumbnail.png');
    				}
    			} else {
    				showModal('서버에서 상품 삭제를 처리함에 있어 문제가 발생하였습니다.');
    			}
    		},
    		error: function (xhr, status, error) {
                console.log('Error: ' + error);
            }
    	})
    });
});

$('#productMainImagefile').change(function(event){
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            $('#productMainImage').attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    }
});

$('.thumbnail-image-controller').on('change', '.thumbnail-image-file', function(event){
	const productId = $(this).attr('id').split('-')[1];
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            $('#updateProductImagefile-'+productId).attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    }
});

$('#productDelete').on('click', function(event){
	const list = [];
	const removeTarget = [];
	let str = '** 선택된 상품명 ** \n';
	$('.product-select:checked').each(function(index){
		let productId = $(this).attr('id').split('-')[2];
		let productName = $(this).closest('tr').find('#productName-'+productId).text();
		str += ' '+(index+1)+'. '+productName+'\n';
		list.push({productId});
		removeTarget.push($(this).closest('tr'));
	});
	console.log(list);
	if(list.length == 0) {
		showModal('삭제할 상품을 선택하여 주십시오.');
		return;
	}
	
	if (confirm('정말로 선택한 상품을 삭제하시겠습니까?\n\n'+str)) {
		$.ajax({
			url: '../product/deleteList',
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(list),
			success: function(data) {
				if(data.status === 'ok') {
					showModal('선택한 상품을 삭제처리 하였습니다.');
					$.each(removeTarget, function(index, target){
						target.remove();
					});
				} else {
					showModal('서버로부터 문제가 발생하여 삭제 처리를 수행하지 못하였습니다.');
				}
			},
			error: function(xhr, status, error) {
		        console.log('에러 발생:', error);
		    }
		});
	}
	
});

$('.orderUpdateSubmit').on('submit', function(event){
	event.preventDefault();
	
	const form = {};
	const orderNumber = $(this).attr('id').split('-')[1];
	form.orderNumber = orderNumber;
	form.orderMemo = $('#orderMemo-'+orderNumber).val();
	form.receiverName = $('#receiverName-'+orderNumber).val();
	form.receiverPhoneNum = $('#receiverPhoneNum-'+orderNumber).val();
	form.deliveryPostNum = $('#deliveryPostNum-'+orderNumber).val();
	form.deliveryAddress = $('#deliveryAddress-'+orderNumber).val();
	form.deliveryAddressDetail = $('#deliveryAddressDetail-'+orderNumber).val();
	
	const productId = $('.productList').eq(0).data('product-id');
	form.deliveryStatus = $('#deliveryStatus-'+productId).val();
	
	console.log(form);
	
	$.ajax({
		url: '../order/update',
		method: 'post',
		data: form,
		success: function(data){
			if (data.status === 'ok') {
				location.href = 'list?type=order';
			} else if (data.status === 'fail') {
				console.log('유효성 검증 실패');
				const errorMap = data.errors;
				for (const field in errorMap) {
	            	let target;
	            	if (field == 'receiverName') {
	            		target = $('#receiverName-error-message-'+orderNumber).empty();
	            	} else if (field == 'receiverPhoneNum') {
	            		target = $('#receiverPhoneNum-error-message-'+orderNumber).empty();
	            	} else if (field == 'orderMemo') {
	            		target = $('#orderMemo-error-message-'+orderNumber).empty();
	            	} else {
	            		target = $('#error-message-'+orderNumber).empty();
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

$('.deliveryStatus').on('change', function() {
	const selectedValue = $(this).val();
	const productId = $(this).closest('tr').data('product-id');
	console.log(selectedValue);
	console.log(productId);
	$('.deliveryStatus').each(function() {
		if ($(this).closest('tr').data('product-id') != productId) {
			$(this).val(selectedValue);
		}
	});
});