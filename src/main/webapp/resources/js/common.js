$('#headerSearch').on(function(event){
    event.preventDefault();
    const searchText = $('#headerSearch').find('.headerSearchInput');

    if(searchText.val().trim() === '') {
        alert('검색하실 상품을 입력해 주세요.');
    } else {
        // ajax를 통해 서버에서 데이터를 요청하고 받아온 데이터를 근거로 리스트 페이지를 상품 검색 페이지로 바꾸고 출력한다.
        alert('검색을 시도한 상품은 ' + searchText.val() + '입니다.');
    }
});

$('.cartInsert2').on('click', function(event){
	event.preventDefault();
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
	
});

$('.cartInsert').on('click', function(event){
	event.preventDefault();
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
	
});




	

