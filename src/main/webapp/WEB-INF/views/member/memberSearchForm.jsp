<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search-style.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="container">

 <!-- Breadcrumbs 영역 시작-->
 <nav class="breadcrumb-container">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"><i class="fas fa-home"></i></a></li>
         <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/member/memberSearchForm">아이디 / 비밀번호 찾기</a></li>
         <li class="breadcrumb-item active" aria-current="page">${breadcrumb}</li>
     </ol>
 </nav>
<!-- Breadcrumbs 영역 끝 -->

<br>
      <!-- 컨텐츠 래퍼 시작 -->
<div class="content-wrapper">
    <h1><b>        
    		<c:if test="${searchType == 'idSearch'}">아이디찾기</c:if>
    		<c:if test="${searchType == 'idSearchComplete'}">아이디찾기</c:if>
        <c:if test="${searchType == 'pwSearch'}">비밀번호 찾기</c:if>
        <c:if test="${searchType == 'pwSearchComplete'}">비밀번호 찾기</c:if>
    	</b></h1>
    <br>

    <!-- 탭 메뉴 시작 -->
    <div class="tabs">
        <a href="${pageContext.request.contextPath}/member/memberSearchForm?type=idSearch" id="search-Id"class="tab-button <c:if test="${searchType == 'idSearch'}">active</c:if><c:if test="${searchType == 'idSearchComplete'}">active</c:if>">아이디찾기</a>
        <a href="${pageContext.request.contextPath}/member/memberSearchForm?type=pwSearch" id="search-Pw" class="tab-button <c:if test="${searchType == 'pwSearch'}">active</c:if><c:if test="${searchType == 'pwSearchComplete'}">active</c:if>">비밀번호 찾기</a>
    </div>
    <!-- 탭 메뉴 끝 -->

    <br>

    	
    </div>
       <!-- 폼 불러 옴 -->
		<div id="msearch-form">
				<c:if test="${searchType== 'idSearch'}" >
					<%-- 아이디 찾기 폼 호출  --%>
					<jsp:include page="/WEB-INF/views/member/memberIdSearchForm.jsp" />
				</c:if>
				<c:if test="${searchType == 'pwSearch'}" >
					<%-- 비밀번호 찾기 폼 호출  --%>
					<jsp:include page="/WEB-INF/views/member/memberPwSearchForm.jsp" />
				</c:if>
				<c:if test="${searchType == 'idSearchComplete'}" >
					<%-- 비밀번호 찾기 폼 호출  --%>
					<jsp:include page="/WEB-INF/views/member/memberIdSearchComplete.jsp" />
				</c:if>
				<c:if test="${searchType == 'pwSearchComplete'}" >
					<%-- 비밀번호 찾기 폼 호출  --%>
					<jsp:include page="/WEB-INF/views/member/memberPwSearchComplete.jsp" />
				</c:if>
		</div>
         <!-- 추가 안내 문구 시작 -->
         <p class="info">입력하신 정보는 본인확인을 위한 정보로만 사용되며, 본인확인 용도 외에는 사용되거나 저장되지 않습니다.
         <br>위 방법으로 정보를 찾으실 수 없는 고객님께서는 고객센터로 문의해주시기 바랍니다.</p>
         <!-- 추가 안내 문구 끝 -->

        </div>
        <!-- 컨텐츠 래퍼 끝 -->
  
    
       
<%@ include file="/WEB-INF/views/common/footer.jsp" %>