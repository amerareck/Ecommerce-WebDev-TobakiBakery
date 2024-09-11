<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<c:if test="${isAlert}" >
	<script>
		alert('${alert}');
		var redirect = '${redirect}';
		if(redirect !== '') {
			location.href='${redirect}';			
		}
	</script>
</c:if>