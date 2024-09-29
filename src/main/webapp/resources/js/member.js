// member.js

// 다음 주소 검색 API 호출 함수
function execDaumPostcode() {
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
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('address').value = addr;
            document.getElementById('address_detail').focus();
        }
    }).open();
}

// 이메일 도메인 선택 시 처리 함수
function setEmailDomain() {
    var emailSelect = document.getElementById("email_select");
    var emailDomain = document.getElementById("email_domain");
    if (emailSelect.value === "") {
        emailDomain.value = "";
        emailDomain.readOnly = false;
    } else {
        emailDomain.value = emailSelect.value;
        emailDomain.readOnly = true;
    }
}


let userEmail = "";
$(document).ready(function() {
	

	
	function showModalToLogin(title, message) {
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
                location.href = '../member/loginForm';
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
	
	function showModalToMyPage(title, message) {
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
                location.href = '../mypage/myPageMain';
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
	
	
	// 회원가입 폼 유효성 검사 함수
	function validateForm() {
	    // 비밀번호 유효성 검사
	    var password = document.getElementById("password").value;
	    var passwordConfirm = document.getElementById("password_confirm").value;
	    var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
	    
	    if ($('#name').val() === '' || $('#name').val === null){
			showModal('이름 확인!', '이름을 입력해주세요.');
	    		return false;
	    }
	    
	    if (!passwordRegex.test(password)) {
	    		showModal('비밀번호 확인!', '비밀번호는 영문자와 숫자 포함 8-16자를 입력해주세요.');

	        return false;
	    }
	    

	    
	    if (password !== passwordConfirm) {
    			showModal('비밀번호 확인!', '비밀번호가 일치하지 않습니다.');


	        return false;
	    }
	    let address = $('#postcode').val() + $('#address').val();
	    console.log(address);
        if(address === '' || address ===null ){
			showModal('주소 확인!', '주소를 입력해 주세요.');
			return false;
        }
	    
	    // 핸드폰 번호 유효성 검사
        let prefix = $("#phone_prefix").val();
        let middleNumber = $("#phone_middle_number").val();
        let lastNumber = $("#phone_last_number").val();
        
        let memberAnswer = $("#member_a").val();
        
        
        
        if (prefix === "선택" || middleNumber.length  <3 || lastNumber.length !== 4) {
    			showModal('휴대폰 번호 확인!', '다시 입력해주세요.');
            return false;
        }

        let PhoneNumber = prefix + middleNumber + lastNumber;
        let phoneRegex = /^(01[0126789])([0-9]{3,4})([0-9]{4})$/;

        if (!phoneRegex.test(PhoneNumber)) {
        		showModal('휴대폰 번호 확인!', '다시 입력해주세요.');
            return false;
        }
        
        if(memberAnswer === '' || memberAnswer === null){
        		showModal('본인확인 답변 확인!', '본인확인 답변을 입력해 주세요.');
        		
        		return false;
        }
        

	    // 생년월일 및 핸드폰 번호 통합 처리
	    let birthMonth = $("#birth_month").val();
	    let birthDay = $("#birth_day").val();

	    if (birthMonth.length < 2) {
	        birthMonth = "0" + birthMonth;
	    }

	    if (birthDay.length < 2) {
	        birthDay = "0" + birthDay;
	    }
	    
		let member_email = $("#email_local").val() + "@" + $("#email_domain").val();
		$("#member_email").val(member_email);
		let userEmail = $("#member_email").val();  
		
        if($("#birth_year").val() === '' || $("#birth_year").val() === null || $("#birth_year").val() ==='선택'){
    		showModal('생년월일 확인!', '생년을 입력해 주세요.');
    		
    		return false;
        }
	    
        if(birthMonth === '' || birthMonth === null || birthMonth ==='선택'){
    		showModal('생년월일 확인!', '생월을 입력해 주세요.');
    		
    		return false;
        }
        
        if(birthDay === '' || birthDay === null || birthDay ==='선택'){
    		showModal('생년월일 확인!', '생일을 입력해 주세요.');
    		
    		return false;
        }
	    
	    let member_birthday = $("#birth_year").val() + birthMonth + birthDay;
	    $("#member_birthday").val(member_birthday);
	    $("#phone_num").val(PhoneNumber);

	    return true; // 모든 검사를 통과한 경우
	}
	
	
    $("#email_local, #email_domain").on("input change", function() {
        updateEmail(); // 이메일이 변경될 때마다 업데이트
    });

	
	
	
	let userCheck = false;
	
	$("#checkId").click(function() {
        let username = $("#username").val();  
        
        if (username.length < 5) {
			showModal('아이디 확인!', '아이디는 5글자 이상입니다.');

            return false;
        }


        
        $.ajax({
            url: '../member/checkId',  
            type: 'get',             
            data: { memberId: username },  
            success: function(response) {
                if (response.resultId === 'idCheckOK') {
                		console.log(response.resultId);
            			showModal('아이디 확인', '사용가능한 아이디 입니다.');
                    userCheck = true;
                } else {
                		console.log(response.resultId);
        				showModal('아이디 확인!', '이미 존재하는 아이디 입니다!');
                    userCheck = false;
                }
            }
        });
    });	
	
   // 이메일 업데이트 함수 정의
    function updateEmail() {
        userEmail = $("#email_local").val() + "@" + $("#email_domain").val();
        console.log("Updated Email: " + userEmail); // 업데이트된 이메일 출력
    }

	let emailCheck = false;
	
    $("#emailCheck").click(function() {
    		updateEmail(); // 현재 이메일 값 업데이트

         if (userEmail.trim() === "@") { // 이메일이 제대로 설정되지 않았을 경우
             showModal('이메일 확인!', '이메일을 입력하세요.');
             return false;
         }
         
 		if ($("#email_local").val().trim() === '') {
			showModal('이메일 확인!', '이메일을 입력하세요');
		    return false;
		}else if($("#email_domain").val().trim()=== ''){
			showModal('이메일 확인!', '이메일을 입력하세요');
		    return false;
		}
         
        console.log(userEmail);
        $.ajax({
            url: '../member/checkEmail',  
            type: 'get',             
            data: { memberEmail: userEmail },  
            success: function(response) {
                if (response.resultEmail === 'emailCheckOK') {
                		console.log(response.resultEmail);
                		showModal('이메일 확인!', '사용 가능한 이메일 입니다.');
                		emailCheck = true;
                }
                else  {
                		console.log(response.resultEmail);
                		showModal('이메일 확인!', '이미 존재하는 이메일 입니다.');
                		emailCheck = false;
                }
            }
        });
    });	
    

    
    $("#signupForm").submit(function(e) {
        if (!userCheck) {
    			showModal('아이디 확인!', '아이디 중복 체크를 해주세요.');
            e.preventDefault();
            return false;
        }
        
        if (!emailCheck) {
        		showModal('이메일 확인!', '이메일 중복 체크를 해주세요.');
            e.preventDefault();
            return false;
        }
    		
        if(!validateForm()){
        		return false;
        }
        let formData = $(this).serialize(); 
        
        $.ajax({
            url: '../member/join', 
            type: 'POST',
            data:formData,
            success: function(response) {
                if (response.success) {
                    showModalToLogin('가입 완료!', '회원가입이 완료되었습니다.');
                    $(document).on('click', '.tingle-modal__close', function() {
                        location.href = '../member/loginForm'; 
                    });
                } else {
                    showModalToLogin('가입 실패!', '회원가입에 실패했습니다.');
                    
                }
            }
        });
        e.preventDefault();
    });
    
    //회원정보 수정
    $("#editForm").submit(function(e) {

    if(!validateForm()){
    		return false;
    }
    let formData = $(this).serialize(); 
    
    $.ajax({
        url: '../member/edit', 
        type: 'POST',
        data:formData,
        success: function(response) {
            if (response.success) {
                showModalToMyPage('수정 완료!', '회원수정이 완료되었습니다.');
                $(document).on('click', '.tingle-modal__close', function() {
                    location.href = '../mypage/mypageMain'; 
                });
            } else {
                showModal('수정 실패!', '회원수정에 실패했습니다.');
                
            }
        }
    });
    e.preventDefault();
    });
    
  
        $('#memberDeleteForm').submit(function(e) {
            e.preventDefault(); 
            let memberId = $('#memberId').val();
            let memberPassword = $('#memberPassword').val();

            $.ajax({
                type: 'post',
                url: '../member/deleteMember', 
                data: {
                    memberId: memberId, 
                    memberPassword: memberPassword 
                },
                success: function(response) {
                    if (response.success) {
                    		console.log(response.success);
                			showModal('탈퇴 성공!', response.message);
                        
                        location.href = '../'; 
                    } else {
                    		showModal('탈퇴 실패!', response.message);
                        
                    }
                }
            });
        });
   

    
	
	
    //로그인 실패 시 알림 창
    const params = new URLSearchParams(location.search);

    if (params.has('error')) {
    		showModalToLogin('로그인 실패!','로그인에 실패했습니다.<br><br>아이디 또는 비밀번호를 확인해주세요!')
      
    }
    
    //로그 아웃
    $('#logout').on('click', function(e) {
        e.preventDefault();
        $('#logoutForm').submit(); 
    });
    
    
    //아이디 찾기 폼 제출 시
    $('#idSearchForm').submit(function(e) {
        // 이름 필드 검사
        let memberName = $("#memberName").val().trim();
        if (memberName === "") {
        		showModal('이름 확인!', '이름을 입력해주세요');
            e.preventDefault(); 
            return false;
        }

        // 답변 필드 검사
        let memberAnswer = $("#memberA").val().trim();
        if (memberAnswer === "") {
        		showModal('본인확인 답변 확인!', '본인확인 답변을 입력해 주세요');
            e.preventDefault(); 
            return false;
        }
        		return true;
        
	});
    
    //비밀번호 찾기 폼 제출 시
    $('#pwSearchForm').submit(function(e) {
        
        let memberId = $("#memberId").val().trim();
        let memberName = $("#memberName").val().trim();
        let memberAnswer = $("#memberA").val().trim();

        if(memberId.length < 5) {
        		showModal('아이디 확인!', '아이디는 5글자 이상이어야 합니다.');
            e.preventDefault(); 
            return false;
        } 
        if (memberName === "") {
        		showModal('이름 확인!', '이름을 입력해 주세요.');
            e.preventDefault(); 
            return false;
        }
        // 답변 필드 검사
        if (memberAnswer === "") {
        		showModal('본인확인 답변 확인!', '답변을 입력해 주세요.');
            e.preventDefault(); 
            return false;
        }
        		return true;
        
	});
    
});


