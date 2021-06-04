<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function() {
		console.log('click!');
		$('#hAction').submit();
	});
});
</script>
</head>
<body>
	<h1>재고 삭제</h1>
	<form id="Action" action="${pageContext.request.contextPath}/admin/removeInventory" method="post">
		<div>
			인벤토리 아이디:
			<input type="text" name="inventoryId" id="inventoryId">
		</div>
		<div>
			<button id="btn">삭제</button>
		</div>
	</form>
</body>
</html>