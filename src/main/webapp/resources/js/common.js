function showModal(title, message){
    // 검색어가 비어 있을 경우 모달 표시
    var modal = new tingle.modal({
        footer: true,
        closeMethods: ['button', 'overlay'],
        closeLabel: "Close",
        cssClass: ['tingle-modal'],
        onOpen: function() {
            console.log('모달이 열렸습니다.');
        },
        onClose: function() {
            console.log('모달이 닫혔습니다.');
        },
        beforeClose: function() {
            return true;
        }
    });

    modal.setContent('<h2>' + title + '</h2><h5>' + message + '</h5>');
    modal.addFooterBtn('닫기', 'tingle-btn tingle-btn--default', function() {
        modal.close();
    });
    modal.open();
	}

$('#headerSearch').on('submit', function(event) { 
    event.preventDefault(); 
    const searchText = $(this).find('.headerSearchInput'); 
    
    
    if (searchText.val().trim() === '') {
    		showModal('검색 확인!', '검색 상품을 입력해 주세요.')

    }  else {
        // 검색어가 있는 경우 폼을 정상적으로 제출
        this.submit(); // 폼 제출
    }
    
});

$('.cartInsert2').on('click', function(event){
	event.preventDefault();
	const auth = $('#isNotLogin')
	if(auth.length) {
		location.href=auth.attr('href');
	} else {
		const productId = $(this).attr('id').split('-')[1];
		console.log(productId);
		
		const check = confirm("장바구니에 상품을 등록하시겠습니까?");
		if(check) {
			$.ajax({
				url: "../order/addCart",
				method: "POST",
				data: {productId},
				success: function(data) {
					if(data.status==='ok') {
						location.href='../order/cart';
					} else {
						alert("장바구니 등록에 실패했습니다.");
					}
				}
					
			});
		}
	}
});

$('.cartInsert').on('click', function(event){
	event.preventDefault();
	const auth = $('#isNotLogin')
	if(auth.length) {
		location.href=auth.attr('href');
	} else {
		const productId = $(this).attr('id').split('-')[1];
		console.log(productId);
		
		const check = confirm("장바구니에 상품을 등록하시겠습니까?");
		if(check) {
			$.ajax({
				url: "order/addCart",
				method: "POST",
				data: {productId},
				success: function(data) {
					if(data.status==='ok') {
						location.href='order/cart';
					} else {
						alert("로그인이 필요합니다.") 
					}
				}
					
			});
		}
	}
	
});




	

