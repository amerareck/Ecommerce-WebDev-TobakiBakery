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

	document.getElementById('startDate').value = startDate;
	document.getElementById('endDate').value = endDate;
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

/*document.querySelectorAll('.btn-delete').forEach(function(button) {
    button.addEventListener('click', function(event) {
        
        var row = event.target.closest('tr');
        
        
        row.remove();
        
       
        alert("삭제되었습니다.");
    });
});*/

$(document).ready(function () {
	
	function showModal(title, message) {
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

	    // 모달 내용 설정
	    modal.setContent('<h2>' + title + '</h2><h5>' + message + '</h5>');

	    // 모달 하단에 버튼 추가
	    modal.addFooterBtn('닫기', 'tingle-btn tingle-btn--default', function() {
	        modal.close();
	    });

	    // 모달 열기
	    modal.open();
	}
	
	 $('#date-search-button').click(function() {
         let startDate = $('#startDate').val();
         let endDate = $('#endDate').val();

        
         var container = $('#orderDeliveryData');
         var showModalFlag  = container.data('show-modal'); 
         var modalTitle = "검색 결과 없음!"
         var modalMessage = "날짜를 선택해주세요."
         
         
         // startDate와 endDate가 비어있지 않을 때만 URL 이동
         if (startDate && endDate) {
             let url = "../mypage/searhOrderDate?startDate=" + startDate + "&endDate=" + endDate;
             location.href = url; 
         } else {
        	        showModal(modalTitle, modalMessage);
        	    
        	 	}
         

     });
		});