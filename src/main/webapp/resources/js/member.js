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


// 회원가입
function validateForm() {
    var password = document.getElementById("password").value;
    var passwordConfirm = document.getElementById("password_confirm").value;
    var passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
   

    
    // 비밀번호 패턴 검사
    
    if (!passwordRegex.test(password)) {
        alert("비밀번호는 영어 대문자,소문자,숫자,특수문자  포함 8-16자를 입력해주세요.");
        return false;
    }

    // 비밀번호 일치 여부 검사
    if (password !== passwordConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

    // 모든 조건이 통과되면 폼이 제출됩니다.
    var member_birthday = $("#birth_year").val()+ $("#birth_month").val()+ $("#birth_day").val();
    var phone_num = $("#phone_prefix").val() + $("#phone_middle_number").val() + $("#phone_last_number").val();
    $("#member_birthday").val(member_birthday);
    $("#phone_num").val(phone_num);
    
    return true;
}

//화원가입 완료시 ajax에  정보 담기

$(document).ready(function() {
	var member_email = $("#email_local").val() + "@" + $("#email_domain").val();
	$("#member_email").val(member_email);

    
	$("#checkId").click(function() {
        var username = $("#username").val();  
        
        if (username.length < 6) {
            alert("아이디는 6글자 이상이어야 합니다.");
            return;
        }

        
        $.ajax({
            url: '../member/checkId',  
            type: 'post',             
            data: { memberId: username },  
            success: function(response) {
                if (response.resultId === 'idCheckOK') {
                		console.log(response.resultId);
                    alert("사용 가능한 아이디입니다.");
                } else {
                		console.log(response.resultId);
                    alert("이미 존재하는 아이디입니다.");
                }
            }
        });
    });	
	
    $("#emailCheck").click(function() {
    		var member_email = $("#email_local").val() + "@" + $("#email_domain").val();
    		$("#member_email").val(member_email);
        var userEmail = $("#member_email").val();  
        
        if ($("#email_local").val().trim() === '') {
            alert("이메일을 입력하세요");
            return false;
        }else if($("#email_domain").val().trim()=== ''){
        		alert("이메일 주소를 입력하세요");
            return false;
        }
        console.log(userEmail);
        $.ajax({
            url: '../member/checkEmail',  
            type: 'post',             
            data: { memberEmail: userEmail },  
            success: function(response) {
                if (response.resultEmail === 'emailCheckOK') {
                		console.log(response.resultEmail);
                    alert("사용 가능한 이메일 입니다.");
                }
                else  {
                		console.log(response.resultEmail);
                    alert("이미 존재하는 이메일 입니다.");
                    
                }
            }
        });
    });	
    
    $("#signupForm").submit(function(e) {
        if (validateForm()) {
        	  alert("회원가입이 완료되었습니다!");
            return true;
        } else {
        	
            return false;
        }
        
    });
    
    //회원정보 수정
    $("#editForm").submit(function(e) {
        if (validateForm()) {
        		alert("회원수정이 완료되었습니다!");
            return true;
        } else {
        	
            return false;
        }
        
    });
});


function showJoinAlert() {
    if (validateForm == true) {
        window.location.href = '../index.html';
    }
}

//아이디 비밀번호 찾기
$(document).ready(function() {
	var search = $('#searchType').val();
	  console.log(search);
      if (search === "id") {
          load("../member/memberIdSearch");
          $("#search-Id").addClass("active");
          $("#search-Pw").removeClass("active");
      } else if (search === "pw") {
          load("../member/memberPwSearch");
          $("#search-Pw").addClass("active");
          $("#search-Id").removeClass("active");
      }
    
    
    $(document).on('click', '#id-search-complete', function(e) {
        e.preventDefault();
        $("#search-Id").addClass("active");
        $("#search-Pw").removeClass("active");
        load("../member/memberIdSearchComplete");
    });
    
    $(document).on('click', '#pw-search-complete', function(e) {
        e.preventDefault();
        $("#search-Pw").addClass("active");
        $("#search-Id").removeClass("active");     
        load("../member/memberPwSearchComplete");
    });
    
    
    
    
    function load(url) {
        $.ajax({
	            url: url,
	            type: 'GET',
	            success: function(response) {
	            	
	                $("#msearch-form").html(response);
	            }
	        });
	    }

	});