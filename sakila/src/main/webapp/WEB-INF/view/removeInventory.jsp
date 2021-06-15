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
		
		if($('#inventoryId').val() == ''){
			alert('inventoryID를 입력하시오');
			return;
		}
		$.ajax({
			type: 'get',
			url: '/getFilmTitleByInventoryId',
			data: {inventoryId: $('#inventoryId').val()},
			success: function(jsonData){
				console.log(jsonData);
				
				let checked = confirm('영화' + jsonData + '의 ' + $('#inventoryId').val() + '번 재고를 삭제하겠습니까?');
				
				if(checked == false){
					return;
				}
				
				$('#Action').submit();
			}
		})
		//$('#Action').submit();
	});
});
</script>
</head>
<body>
	<h1>재고 삭제</h1>
	<form id="Action" action="${pageContext.request.contextPath}/admin/removeInventory" method="post">
		<div>
			inventory ID:
			<input type="text" name="inventoryId" id="inventoryId">
		</div>
		<div>
			<button type="button" id="btn">삭제</button>
		</div>
	</form>
</body>
</html>