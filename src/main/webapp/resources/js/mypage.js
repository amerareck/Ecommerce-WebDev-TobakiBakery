$('delete-account').on('click', function() {    
	const userConfirmed = confirm("정말 탈퇴하시겠습니까?");
	
	if (userConfirmed) {
	   
	    alert("탈퇴가 완료되었습니다.");
	    
	} else {
	    
	}
});

function setDateRange(range) {
	const today = new Date();
	let startDate, endDate;

	endDate = today.toISOString().split('T')[0];

	if (range === 'today') {
		startDate = endDate;
	} else if (range === 'yesterday') {
		const yesterday = new Date(today);
		yesterday.setDate(today.getDate() - 1);
		startDate = yesterday.toISOString().split('T')[0];
		endDate = startDate;
	} else if (range === 'week') {
		const weekAgo = new Date(today);
		weekAgo.setDate(today.getDate() - 7);
		startDate = weekAgo.toISOString().split('T')[0];
	} else if (range === 'month') {
		const monthAgo = new Date(today);
		monthAgo.setMonth(today.getMonth() - 1);
		startDate = monthAgo.toISOString().split('T')[0];
	} else if (range === 'three-months') {
		const threeMonthsAgo = new Date(today);
		threeMonthsAgo.setMonth(today.getMonth() - 3);
		startDate = threeMonthsAgo.toISOString().split('T')[0];
	} else if (range === 'year') {
		const yearAgo = new Date(today);
		yearAgo.setFullYear(today.getFullYear() - 1);
		startDate = yearAgo.toISOString().split('T')[0];
	}

	document.getElementById('start-date').value = startDate;
	document.getElementById('end-date').value = endDate;
}
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            
            
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('address').value = addr;
            document.getElementById('address_detail').focus();
        }
    }).open();
}

document.querySelectorAll('.btn-delete').forEach(function(button) {
    button.addEventListener('click', function(event) {
        
        var row = event.target.closest('tr');
        
        
        row.remove();
        
       
        alert("후기가 삭제되었습니다.");
    });
});

$(document).ready(function () {
	$("footer").load("${pageContext.request.contextPath}/common/footer");
	$("header").load("${pageContext.request.contextPath}/common/header"); 
		});