src="https://code.jquery.com/jquery-3.6.0.min.js"

$('#cartButton').on('click', function(event){
	$('#productDetailForm').attr('action', '../order/addCartForm');
    $('#productDetailForm').submit();
});

$('#buyButton').on('click', function(event){
	$('#productDetailForm').attr('action', '../order/instantOrder');
    $('#productDetailForm').submit();
});