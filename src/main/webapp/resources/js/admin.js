src="https://code.jquery.com/jquery-3.6.0.min.js"
$('#updateImagefileUpload').change(function(event){
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            $('#updateProductImagefile').attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    }
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

$('#totalProductSelect').change(function(event){
    const isChecked = $(this).is(':checked');
    
    $('.product-select').each(function(index){
        $(this).prop('checked', isChecked);
    });
});

$('#productSearchForm').submit(function(event){
    event.preventDefault();
    const selector = $('select#searchProductSelect option:selected');
    let str = '';
    if (selector.val() == '검색조건') {
        alert('검색 조건을 선택하세요.');
        return;
    } else if(selector.val() == 'pname') {
        const productName = $('#productSearchKeyword');
        if(!productName.val()) {
            alert('검색하실 상품명을 입력하세요.');
            return;
        }
        str = '검색을 진행합니다.\n선택한 검색 타입 : '+selector.val()+'\n';
        str += '검색 키워드 : '+productName.val().trim();

    } else if(selector.val() == 'category') {
        const category = $('#productSearchCategory option:selected');
        if(category.val() == '카테고리') {
            alert('카테고리를 선택하세요.');
            return;
        }
        str = '검색을 진행합니다.\n선택한 검색 타입 : '+selector.val()+'\n';
        str += '검색 카테고리 : '+category.val();
    } else {
        const productState = $('#productSearchStatus option:selected');
        if(productState.val() == '상품상태') {
            alert('상품상태를 선택하세요.');
            return;
        }
        str = '검색을 진행합니다.\n선택한 검색 타입 : '+selector.val()+'\n';
        str += '검색 상품상태 : '+productState.val();
    }

    alert(str);
});

$('#searchProductSelect').change(function(event){
    const selected = $('#searchProductSelect option:selected').val();
    const targetTag = $('#productSearchForm .input-group').children().eq(1);

    if(selected =='category') {
        targetTag.replaceWith(
            `<select class="form-control mr-sm-0" id="productSearchCategory">
                <option selected>카테고리</option>
                <option value="bread">Bread</option>
                <option value="cake">Cake</option>
                <option value="desert">Desert</option> 
            </select>`
        );
    } else if(selected=='pstatus') {
        targetTag.replaceWith(
            `<select class="form-control mr-sm-0" id="productSearchStatus">
                <option selected>상품상태</option>
                <option value="1">판매중</option>
                <option value="2">판매중단</option>
                <option value="3">매진</option> 
            </select>`
        );
    } else {
        $('#productSearchCategory, #productSearchStatus').replaceWith(
            `<input class="form-control mr-sm-0" type="text" placeholder="Search" id="productSearchKeyword">`
        );
    }
});

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

$('#searchOrderSelect').change(function(event){
    const selected = $('#searchOrderSelect option:selected').val();
    const targetTag = $('#orderSearchForm .input-group').children().eq(1);

    if(selected =='orderId') {
        targetTag.replaceWith(
            `<input class="form-control mr-sm-0" type="number" placeholder="Search" id="orderSearchOrderNumber">`
        );
    } else if(selected=='orderStatus') {
        targetTag.replaceWith(
            `<select class="form-control mr-sm-0" id="orderSearchOrderState">
                <option selected>배송상태</option>
                <option value="1">배송대기</option>
                <option value="2">배송중</option>
                <option value="3">배송완료</option>
                <option value="4">주문취소</option>
            </select>`
        );
    } else {
        $('#orderSearchOrderNumber, #orderSearchOrderState').replaceWith(
            `<input class="form-control mr-sm-0" type="text" placeholder="Search" id="orderSearchKeyword">`
        );
    }
});

function getPostcodeAndAddress() {
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
            document.getElementById('recevierPostNo').value = data.zonecode;
            document.getElementById('recevierAddr').value = addr;
            document.getElementById('recevierDetailsAddr').focus();
        }
    }).open();
}



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
                alert("주문 정보가 성공적으로 수정되었습니다.");
                // 여기서 페이지 새로 고침이나 필요한 작업을 수행할 수 있습니다.
            } else {
                alert("주문 정보 수정에 실패했습니다.");
            }
        }
    });
});

    
//    let str = '수정을 하려고 하는 내역은 다음과 같습니다.\n';
//    str += '주문메모 : '+ $('#memo').text()+'\n';
//    str += '이름 : '+ $('#receiver').val()+'\n';
//    str += '폰번호 : '+ phoneNumber+'\n';
//    str += '우편번호 : '+ $('#recevierPostNo').val()+'\n';
//    str += '주소 : '+ $('#recevierAddr').val()+' '+$('#recevierDetailsAddr').val()+'\n';
//    str+= '배송상태 : ';
//    for(let i=0; i<orderProductData.length; i++) {
//        str+= '['+orderProductName[i]+' - '+orderProductState[i]+']\n';
//    }
//    alert(str);
//});

$('#productUpdateForm').submit(function(event){
    event.preventDefault();
/*
    let str = '수정을 하려고 하는 내역은 다음과 같습니다.\n';
    str += '상품명 : '+$('#updateName').val().trim()+'\n';
    str += '상품상세 : '+$('#updateDetails').val()+'\n';
    str += '카테고리 : '+$('#updateCategory option:selected').val()+'\n';
    str += '상품가격 : '+$('#updatePrice').val().replace(/[^0-9]/g, '')+'\n';
    str += '상품수량 : '+$('#updateAmount').val().replace(/[^0-9]/g, '')+'\n';
    str += '상품이미지 : '+$('#updateProductImagefile').attr('src')+'\n';
    str += '상품상태 : '+$('#updateProductState option:selected').val()+' - '+$('#updateProductState option:selected').text()+'\n';
    str += '추천상품상태 : '+$('#updateRecommendedProduct').is(':checked')+'\n';
*/
    const product = {
    		productName : $('#updateName').val().trim(),
    		productDetail : $('#updateDetails').val(),
    		categoryName : $('#updateCategory option:selected').val(),
    		productPrice : $('#updatePrice').val().replace(/[^0-9]/g, ''),
    		productCount : $('#updateAmount').val().replace(/[^0-9]/g, ''),
    		productState : $('#updateProductState option:selected').text(),
    		productRecom : $('#updateRecommendedProduct').is(':checked'),
    		productDateTime : moment().format('YYYY-MM-DD HH-mm-ss')
    };
    
    $.ajax({
    	url: "updateProduct",
    	type: "post",
    	data: product,
    	success: function(data){
    		if(data.status === "ok") {
    			alert("상품이 수정되었습니다.");
    			location.href="getAdminMain";
    		} else {
    			alert("수정에 실패했습니다.");
    		}
    	}
    });
});

$('#productTableForm').submit(function(event){
    event.preventDefault();

    let str = '선택된 상품 번호 - \n';
    const removeList = [];
    const tableData = $('#productTableData tr');
    const deleteData = tableData.filter(function(){
        return $(this).find('input.product-select:checked').length > 0;
    });
    
    deleteData.each(function(){
        str += $(this).find('th.prodNum').text().trim()+'\n';
        removeList.push({productId : $(this).find('th.prodNum').text().replace(/[^0-9]/g, '')});
    });
    $.ajax({
    	url: "removeProductList",
    	type: "post",
    	contentType: "application/json",
    	data: JSON.stringify(removeList),
    	success: function(data){
    		if(data.status === 'ok') {
    		    str += '해당 상품들이 삭제되었습니다.';
    		    deleteData.remove();
    		    alert(str);
    		} else {
    			alert("상품 삭제에 실패하였습니다.");
    		}
    	}
    });
});

$('#productTableData a.product-delete-selector').each(function(){
    $(this).click(function(event){
        event.preventDefault();

        const deleteData = $(this).parent().parent();
        const productId = deleteData.find('th.prodNum').text().trim().replace(/[^0-9]/g, '');
        let str = '선택한 상품NO ['
        str += productId+']';
        if(confirm(str+'\n정말 삭제하시겠습니까?')) {
        	$.ajax({
        		url: "removeProduct",
        		type: "post",
        		contentType: "application/json",
        		data: JSON.stringify({ productId }),
        		success: function(data) {
        			if(data.status === 'ok') {
        				deleteData.remove();
        	            str+= '을 삭제하였습니다.';
        	            alert(str);
        			} else {
        				alert("상품 삭제를 실패하였습니다.");
        			}
        		}
        	});
        }
    });
});


/*
$('#productInsertForm').submit(function(event){
    event.preventDefault();
    
    const category = $('#product-category');
    const productState = $('#productState');
    if(!category.val()) {
        alert('카테고리를 선택해 주세요.');
        return;
    } else if(!productState.val()) {
        alert('상품상태를 설정해 주세요.');
        return;
    }

    const prodName = $('#product-name');
    const prodDetails = $('#product-details');
    const prodDetailsImage = $('#product-details-imagefile')[0];
    const prodPrice = $('#product-price');
    const prodAmount = $('#product-amount');
    const prodMainImage = $('#productMainImagefile')[0];
    const isRecomenedProd = $('#recommendedProduct');

    let str = '등록하실 상품 정보는 다음과 같습니다.\n';
    str += '상품명: '+prodName.val().trim()+'\n';
    str += '상품상세: '+prodDetails.val()+'\n';
    prodDetailsImage.files.length > 0 && (str += '상품상세이미지: '+prodDetailsImage.files[0].name+'\n');
    str += '카테고리: '+category.find('option:selected').text()+'\n';
    str += '상품가격: '+prodPrice.val()+'\n';
    str += '상품수량: '+prodAmount.val()+'\n';
    prodMainImage.files.length > 0 ? (str+= '메인이미지 : '+prodMainImage.files[0].name+'\n') : (str+= '메인이미지 : 이미지 없음\n');
    str += '상품상태: '+productState.find('option:selected').text()+'\n';
    str += '추천상품설정: '+isRecomenedProd.is(':checked')+'\n';

    const product = {
    		productName : prodName.val().trim(),
    		productDetail : prodDetails.val(),
    		categoryName : category.find('option:selected').text(),
    		productPrice : prodPrice.val(),
    		productCount : prodAmount.val(),
    		productState : productState.find('option:selected').text(),
    		productRecom : isRecomenedProd.is(':checked'),
    		productDateTime : moment().format('YYYY-MM-DD HH-mm-ss')
    };
    
    $.ajax({
    	url: "addProduct",
    	type: "post",
    	data: product,
    	success: function(data){
    		if(data.status === 'ok') {
    			alert("상품 등록에 성공하였습니다.");
    			location.href="getAdminMain";
    		} else {
    			alert("상품 등록에 실패하였습니다.");
    		}
    	}
    });
});*/

