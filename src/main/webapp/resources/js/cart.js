
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

//수량 증가/감소 공통 함수
function updateCartQuantity(button, isIncrement) {
    const row = button.closest('tr');
    const productId = row.querySelector('input[name="productId"]').value;
    const quantityInput = row.querySelector('input[type="text"]');
    let quantity = parseInt(quantityInput.value);

    if (isIncrement) {
        if (quantity < 10) quantity++;
        else alert("최대 수량은 10개입니다.");
    } else {
        if (quantity > 1) quantity--;
        else alert("최소 수량은 1개입니다.");
    }

    

// 수량 증가 버튼
document.querySelectorAll('.quantity-plus').forEach(function(button) {
    button.addEventListener('click', function() {
        updateCartQuantity(this, true);
    });
});

// 수량 감소 버튼
document.querySelectorAll('.quantity-minus').forEach(function(button) {
    button.addEventListener('click', function() {
        updateCartQuantity(this, false);
    });
});




// 선택상품 주문하기 버튼 기능 & 유효성 체크
document.querySelector('.btns_order .btn-outline-danger').addEventListener('click', function () {
    const checkedItems = document.querySelectorAll('#cartTable tbody input[type="checkbox"]:checked');
    
    if (checkedItems.length > 0) {
        window.location.href = '../mypage/mypage-order';
    } else {
        alert("선택된 제품이 없습니다.");
    }
});

//전체선택/해제
document.getElementById('select-all').addEventListener('click', function(){
	const isChecked = this.checked;
	const checkboxes = document.querySelectorAll('#cartTable tbody input[type="checkbox"]');
	checkboxes.forEach(function (checkbox){
		checkbox.checked = isChecked;
	});
});
}

document.querySelectorAll('.btn-delete').forEach(function(button) {
    button.addEventListener('click', function(event) {
        
        var row = event.target.closest('tr');
        
        
        row.remove();
        
        alert("삭제되었습니다.");
    });
});
