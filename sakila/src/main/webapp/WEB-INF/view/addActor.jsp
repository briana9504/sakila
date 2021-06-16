<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addActor</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready!');
	
	$('#btn').click(function(){
		console.log('btn.click!');
		
		if($('#firstName').val() == ''){
			alert('firstName을 입력하시오.');
			$('#firstName').focus();
			
		} else if($('#lastName').val() == ''){
			alert('lastName을 입력하시오.');
			$('#lastName').focus();
			
		} else{
			$('#addActionForm').submit();
		}
		
	});
});
</script>
</head>
<body>
	<div class="container">
		<h1>addActor</h1>
		<br>
		<form id="addActionForm" action="${pageContext.request.contextPath}/admin/addActor" method="post">
			<div class="row">
				<div class="col-sm-2">
					<input id="firstName" name="firstName" type="text"placeholder="firstName"> 
				</div>
				<div class="col-sm-2">
					<input id="lastName" name="lastName"type="text" placeholder="lastName">
				</div>
		
				<div class="col-sm-1">
					<button type="button" id="btn">등록</button>
				</div>
			</div>
			
		</form>
	</div>
</body>
</html>