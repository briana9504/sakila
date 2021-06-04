<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready');
	
	//$('#film').select2();
	
	$('#btn').click(function(){
		console.log('ready!');
	})
});
</script>
</head>
<body>
	<h1>재고 추가하기</h1>
	
	<form id="action" action="${pageContext.request.contextPath}/admin/addInventory" method="post">
	<div>
		매장 : 
		<select name="storeId">
			<option value="1">1호점</option>
			<option value="2">2호점</option>
		</select>
	</div>
	
	<div>
		영화: 
		<input list="film" name="filmId">
		<datalist id="film">
			<c:forEach items="${filmList}" var="f">
				<option value="${f.filmId}">${f.title}</option>
			</c:forEach>
		</datalist>
	</div>
	
	<div>
		수량: 
		<input type="text" name="volume">
	</div>
	
	<div>
		<button id="btn">재고추가</button>
	</div>
	</form>

</body>
</html>