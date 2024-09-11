// 삭제 버튼 클릭 시 해당 행 삭제
document.querySelectorAll('.btn-danger.btn-sm').forEach(function(button) {
    button.addEventListener('click', function() {
        const row = this.closest('tr');
        row.remove(row);
        updateTotalPrice();
    });
});
// 선택삭제 버튼 기능
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



// 수량 증가 함수
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
//삭제 버튼 클릭 시 AJAX로 서버에 삭제 요청
document.querySelectorAll('.btn-danger.btn-sm').forEach(function(button) {
    button.addEventListener('click', function() {
        const row = this.closest('tr');
        const productId = row.querySelector('<a href="/product/productDetail?productId=123">').getAttribute('/product/productDetail?productId=123').split('=')[1];

        fetch('${pageContext.request.contextPath}/cart/delete', {
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
                row.remove();
                updateTotalPrice();
            } else {
                alert('상품 삭제에 실패했습니다.');
            }
        })
        .catch(error => console.error('Error:', error));
    });
});	



// 결제 예정가 수정 함수
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
        const price = parseInt(priceText.replace(/[^0-9]/g, ''), 10);
        totalPrice += price;
    });
    document.querySelector('.basket_totalprice strong').innerText = totalPrice.toLocaleString() + '원';
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

//상품 리스트에서 장바구니 추가 버튼 클릭 시 AJAX 요청 보내기
document.querySelectorAll('.cart-overlay').forEach(function(button) {
    button.addEventListener('click', function() {
        const productElement = this.closest('.item_elem');
        const productId = productElement.querySelector('<a href="/product/productDetail?productId=123">').getAttribute('/product/productDetail?productId=123').split('=')[1];
        const productName = productElement.querySelector('.prd_title a').innerText;
        const productPriceText = productElement.querySelector('.prd_price').innerText;
        const productPrice = parseInt(productPriceText.replace(/[^0-9]/g, ''));

        // AJAX 요청 보내기
        fetch('${pageContext.request.contextPath}/cart/add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                productId : productId,
                productName : productName,
                product_price: productPrice,
                cart_count: 1 // 기본 수량 1로 설정
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('상품이 장바구니에 추가되었습니다.');
            } else {
                alert('장바구니 추가에 실패했습니다.');
            }
        })
        .catch(error => console.error('Error:', error));
    });
});
document.querySelector('.prd-btn button[type="button"]').addEventListener('click', function() {
    const productId = document.querySelector('input[name="productId"]').value;
    const productName = document.querySelector('.tit-prd').innerText;
    const productPriceText = document.querySelector('.price b').innerText;
    const productPrice = parseInt(productPriceText.replace(/[^0-9]/g, ''));
    const quantity = document.querySelector('select[id="exampleSelect1"]').value;

    // AJAX 요청 보내기
    fetch('${pageContext.request.contextPath}/cart/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            productId: productId,
            productName: productName,
            productPrice: productPrice,
            cartCount: quantity
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('상품이 장바구니에 추가되었습니다.');
        } else {
            alert('장바구니 추가에 실패했습니다.');
        }
    })
    .catch(error => console.error('Error:', error));
});

document.querySelectorAll('.add-to-cart').forEach(function(button) {
    button.addEventListener('click', function() {
        var productId = this.getAttribute('data-product-id');  // 상품 ID 가져오기
        var cartCount = 1;  // 기본 수량 설정 (필요 시 사용자 선택 가능)

        // AJAX 요청으로 장바구니에 상품 추가
        fetch('${pageContext.request.contextPath}/cart/add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                productId: productId,
                quantity: quantity
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('상품이 장바구니에 추가되었습니다.');
                window.location.href = '${pageContext.request.contextPath}/order/orderCart';  // 장바구니 페이지로 이동
            } else {
                alert('상품 추가에 실패했습니다.');
            }
        })
        .catch(error => console.error('Error:', error));
    });
});
