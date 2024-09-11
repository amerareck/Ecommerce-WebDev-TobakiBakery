<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<c:if test="${isAlert}" >
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${isAlert}">
>>>>>>> branch 'master' of https://github.com/AnJungGeon/tobaki-bakery.git
	<script>
		window.onload = function(){
			alert('${alert}');
			var redirect = '${redirect}';
			if(redirect !== '') {
				location.href='${redirect}';			
			}
		}
	</script>
</c:if>