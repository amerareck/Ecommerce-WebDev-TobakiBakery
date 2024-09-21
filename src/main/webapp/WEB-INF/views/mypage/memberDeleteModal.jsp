<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- 주문 상세 호출 모달 시작 --%>
<div class="modal fade" id="memberDeleteModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
            <!-- Modal Header -->
			<div class="modal-header" >
			    <h3 class="modal-title">회원 탈퇴</h3>
			    <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
                
            <!-- Modal body -->
            <div class="modal-body">
				<div class="modal-content-1">
				
			<form id="memberDeleteForm" method="post">
<%-- 	          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 --%>                <!-- 아이디 찾기 입력 테이블 시작 -->
          		 <table class="table" style="width: 750px;">
	   
	               <tbody>
	                   <tr>
	                       <td>주의 사항</td>
	                       <td>
	                       	토박이 베이커리는 실명제를 기반으로 운영되기 때문에 본인 확인이 되어야 해지 처리됩니다.<br><br>
	                       	<span class="text-danger">아래의 정보를 정확히 입력하셔야 탈퇴처리가 됩니다. 탈퇴 후에는 복구가 불가능 합니다.</span>
	                       </td>
	                   </tr>               		
	                   <!-- 이름 입력 필드 시작 -->
	                   <tr>
	                       <td>아이디</td>
	                       <td><input type="text" class="form-control input-small" name="memberId" id="memberId" required></td>
	                   </tr>
	                   <!-- 이름 입력 필드 끝 -->
	
	                   <!-- 질문 선택 필드 시작 -->
	                   <tr>
	                       <td>비밀번호</td>
	                       <td><input type="password" class="form-control input-small" name="memberPassword" id="memberPassword" required></td>
	                   </tr>
	               </tbody>
	           </table>
		           <!-- 아이디 찾기 입력 테이블 끝 -->
		           <!-- 확인 버튼 시작 -->
		           <button id="id-search-complete" class="btn btn-danger">탈퇴</button>
                   <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
		           <!-- 확인 버튼 끝 -->
           </form>
           <br>
				</div>
<!-- 모달컨텐츠영역 end-->
            </div>
        </div>
    </div>
</div>    
<!-- 모달 끝 -->