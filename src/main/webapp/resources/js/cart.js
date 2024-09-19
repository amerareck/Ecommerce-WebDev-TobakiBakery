
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
//삭제 버튼 클릭 시 해당 행 삭제
document.querySelectorAll('.btn-danger.btn-sm').forEach(function(button) {
    button.addEventListener('click', function() {
        const row = this.closest('tr');
        const productId = row.querySelector('input[name="productId"]').value;

        // AJAX 요청 보내기
        fetch('${pageContext.request.contextPath}/order/deleteCartItem', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                productId: productId
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 성공적으로 삭제된 경우 화면에서 해당 행 삭제
                row.remove();
                updateTotalPrice();
            } else {
                alert('상품 삭제에 실패했습니다.');
            }
        })
        .catch(error => console.error('Error:', error));
    });
    
//선택삭제 버튼 기능
document.querySelector('.btns_order .btn-outline-secondary:nth-child(1)').addEventListener('click', function () {
    const checkedItems = document.querySelectorAll('#cartTable tbody input[type="checkbox"]:checked');
    checkedItems.forEach(function (item) {
        const row = item.closest('tr');
        const productName = row.querySelector('.tb_title a').innerText;

        // AJAX 요청 보내기
        fetch('${pageContext.request.contextPath}/cart/delete', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                product_name: productName
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                row.remove();
                updateTotalPrice();
            } else {
                alert('상품 삭제에 실패했습니다.');
            }
        })
        .catch(error => console.error('Error:', error));
    });
});
//수량 증가 함수
document.querySelectorAll('.quantity-control button:last-child').forEach(function(button) {
    button.addEventListener('click', function() {
        let currentValue = parseInt(this.previousElementSibling.value);
         
        if (currentValue < 10) {
            this.previousElementSibling.value = currentValue + 1;
        } else {
            alert("최대 수량은 10개입니다.");
        }
        
        updateItemPrice(this);
        updateTotalPrice();
    });
});


// 수량 감소 함수
document.querySelectorAll('.quantity-control button:first-child').forEach(function(button) {
    button.addEventListener('click', function() {
        let currentValue = parseInt(this.nextElementSibling.value);
        
        if (currentValue > 1) {
            this.nextElementSibling.value = currentValue - 1;
        } else {
            alert("최소 수량은 1개입니다.");
        }
        
        updateItemPrice(this);
        updateTotalPrice();
    });
});
document.querySelectorAll('.quantity-control button').forEach(function(button) {
	button.addEventListener('click', function() {
		const row = this.closest('tr');
		const productId = row.querySelector('<a href="/product/productDetail?productId=123">').getAttribute('/product/productDetail?productId=123').split('=')[1];
        let cartCount = parseInt(row.querySelector('input[type="text"]').value, 10);
        
     // 수량이 변경된 경우 AJAX로 서버에 업데이트 요청
        fetch('${pageContext.request.contextPath}/cart/update', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                productId: productId,
                cartCount: cartCount
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 성공적으로 업데이트된 경우 처리
                updateTotalPrice();
            } else {
                alert('수량 업데이트에 실패했습니다.');
            }
        })
        .catch(error => console.error('Error:', error));
    });
});

//결제 예정가 수정 함수
function updateItemPrice(button) {
    const row = button.closest('tr');
    const priceElement = row.querySelector('.currentPrice');
    const unitPriceText = priceElement.dataset.unitPrice;
    const quantity = parseInt(row.querySelector('input[type="text"]').value, 10);

    const unitPrice = parseInt(unitPriceText.replace(/[^0-9]/g, ''), 10);
    const newPrice = unitPrice * quantity;

    priceElement.innerText = newPrice.toLocaleString() + '원';
}


// 총금액 수정 함수
function updateTotalPrice() {
    let totalPrice = 0;
    const rows = document.querySelectorAll('#cartTable tbody tr');
    rows.forEach(function (row) {
        const priceText = row.querySelector('.currentPrice').innerText;
        console.log("price text: ",priceText);
        const price = parseInt(priceText.replace(/[^0-9]/g, ''), 10);
        totalPrice += price;
    });
    console.log("총 결제금액: ",totalPrice);
    document.querySelector('.basket_totalprice strong').innerText = totalPrice.toLocaleString() + '원';
    const totalPriceElement = document.querySelector('.basket_totalprice strong');
    console.log(totalPriceElement);  // null 이 아닌지 확인

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
});
