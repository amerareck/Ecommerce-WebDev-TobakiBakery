<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${isAlert}">
	<script>
		window.onload = function(){
			showModal('${alert}');
			var redirect = '${redirect}';
			if(redirect !== '') {
				location.href='${redirect}';			
			}
		}
	</script>
</c:if>