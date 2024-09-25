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



$(document).ready(function() {

	// 회원가입 폼 유효성 검사 함수
	function validateForm() {
	    // 비밀번호 유효성 검사
	    var password = document.getElementById("password").value;
	    var passwordConfirm = document.getElementById("password_confirm").value;
	    var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

	    if (!passwordRegex.test(password)) {
	        alert("비밀번호는 영문자와 숫자 포함 8-16자를 입력해주세요.");
	        return false;
	    }

	    if (password !== passwordConfirm) {
	        alert("비밀번호가 일치하지 않습니다.");
	        return false;
	    }

	    // 핸드폰 번호 유효성 검사
        let prefix = $("#phone_prefix").val();
        let middleNumber = $("#phone_middle_number").val();
        let lastNumber = $("#phone_last_number").val();
        
        let memberAnswer = $("#member_a").val();
        
        
        
        if (prefix === "선택" || middleNumber.length !== 4 || lastNumber.length !== 4) {
            alert("유효한 핸드폰 번호를 입력해주세요.");
            return false;
        }

        let PhoneNumber = prefix + middleNumber + lastNumber;
        let phoneRegex = /^(01[016789]{1})[0-9]{4}[0-9]{4}$/;

        if (!phoneRegex.test(PhoneNumber)) {
            alert("유효하지 않은 핸드폰 번호입니다.");
            return false;
        }
        
        if(memberAnswer === '' || memberAnswer === null){
        		alert("본인확인 답변을 입력해 주세요.");
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
		
		if ($("#email_local").val().trim() === '') {
		    alert("이메일을 입력하세요");
		    return false;
		}else if($("#email_domain").val().trim()=== ''){
				alert("이메일 주소를 입력하세요");
		    return false;
		}
	    
	    
	    let member_birthday = $("#birth_year").val() + birthMonth + birthDay;
	    $("#member_birthday").val(member_birthday);
	    $("#phone_num").val(PhoneNumber);

	    return true; // 모든 검사를 통과한 경우
	}
	
	
	
	
	
	
	let userCheck = false;
	
	$("#checkId").click(function() {
        let username = $("#username").val();  
        
        if (username.length < 5) {
            alert("아이디는 5글자 이상이어야 합니다.");
            return false;
        }


        
        $.ajax({
            url: '../member/checkId',  
            type: 'post',             
            data: { memberId: username },  
/*            beforeSend: function(security) {
                // CSRF 토큰을 요청 헤더에 추가
                security.setRequestHeader(csrfHeader, csrfToken);
            },*/
            success: function(response) {
                if (response.resultId === 'idCheckOK') {
                		console.log(response.resultId);
                    alert("사용 가능한 아이디입니다.");
                    userCheck = true;
                } else {
                		console.log(response.resultId);
                    alert("이미 존재하는 아이디입니다.");
                    userCheck = false;
                }
            }
        });
    });	
	

	let emailCheck = false;
	
    $("#emailCheck").click(function() {

        console.log(userEmail);
        $.ajax({
            url: '../member/checkEmail',  
            type: 'post',             
            data: { memberEmail: userEmail },  
/*            beforeSend: function(security) {
                // CSRF 토큰을 요청 헤더에 추가
                security.setRequestHeader(csrfHeader, csrfToken);
            },*/
            success: function(response) {
                if (response.resultEmail === 'emailCheckOK') {
                		console.log(response.resultEmail);
                    alert("사용 가능한 이메일 입니다.");
                		emailCheck = true;
                }
                else  {
                		console.log(response.resultEmail);
                    alert("이미 존재하는 이메일 입니다.");
                		emailCheck = false;
                }
            }
        });
    });	
    

    
    //회원가입 최종
    $("#signupForm").submit(function(e) {
        // 아이디 중복 체크 검사
        if (!userCheck) {
            alert("아이디 중복 체크를 해주세요.");
            e.preventDefault();
            return false;
        }
        
        // 이메일 중복 체크 검사
        if (!emailCheck) {
            alert("이메일 중복 체크를 해주세요.");
            e.preventDefault();
            return false;
        }
    	
        // 추가적인 폼 검증
        if (validateForm()) {
            alert("회원가입이 완료되었습니다!");
            return true; // 폼 제출 진행
        } else {
            alert("회원가입에 실패했습니다.");
            e.preventDefault();
            return false; // 폼 제출 방지
        }
    });
    
    //회원정보 수정
    $("#editForm").submit(function(e) {

            // 추가적인 폼 검증
            if (validateForm()) {
                alert("회원수정이 완료되었습니다!");
                return true; // 폼 제출 진행
            } else {
                alert("회원수정에 실패했습니다.");
                e.preventDefault();
                return false; // 폼 제출 방지
            }
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
                        alert(response.message);
                        location.href = '../'; 
                    } else {
                        alert(response.message); 
                    }
                }
            });
        });
   

    
	
	
    //로그인 실패 시 알림 창
    const params = new URLSearchParams(location.search);

    if (params.has('error')) {
        alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.');
        
        history.back();
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
            alert("이름을 입력해 주세요.");
            e.preventDefault(); 
            return false;
        }

        // 답변 필드 검사
        let memberAnswer = $("#memberA").val().trim();
        if (memberAnswer === "") {
            alert("답변을 입력해 주세요.");
            e.preventDefault(); 
            return false;
        }
        		return true;
        
	});
    
    //비밀번호 찾기 폼 제출 시
    $('#pwSearchForm').submit(function(e) {
        // 아이디 필드 검사
        let memberId = $("#memberId").val().trim();
        let memberName = $("#memberName").val().trim();
        let memberAnswer = $("#memberA").val().trim();

        if(memberId.length < 5) {
            alert("아이디는 5글자 이상이어야 합니다.");
            e.preventDefault(); 
            return false;
        } 
        if (memberName === "") {
            alert("이름을 입력해 주세요.");
            e.preventDefault(); 
            return false;
        }
        // 답변 필드 검사
        if (memberAnswer === "") {
            alert("답변을 입력해 주세요.");
            e.preventDefault(); 
            return false;
        }
        		return true;
        
	});
    
});
function showJoinAlert() {
    if (validateForm == true) {
        window.location.href = '../index.html';
    }
}

