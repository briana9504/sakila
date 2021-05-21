<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addBoardfile</title>
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		console.log('ready');
		$('#btn').click(function(){
			console.log('btn click!');
			if($('#multipartFile').val() == ''){
				alert('파일을 첨부하세요');
			} else {
				$('#addForm').submit();
			}
			
		});
	});
</script>
</head>
<body>
	<h1>파일추가</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/admin/addBoardfile" method="post" enctype="multipart/form-data">
		<div>
			boardId:
			<input type="text" id="boardId" name="boardId" readonly="readonly" value="${boardId}">		
		</div>
		<div>
			<input type="file" name="multipartFile" id="multipartFile">
		</div>
		<div>
			<button id="btn" type="button">파일추가</button>
		</div>
	</form>
</body>
</html>