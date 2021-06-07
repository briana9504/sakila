<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	console.log('ready!');
	$('#btn').click(function() {
		console.log('btn click!');
		
		if($('#email').val() == ''){
			 alert('email을 입력해 주세요.');
			 $('#email').focus();
		} else if($('#password').val().length < 4){
			 alert('password는 4자이상 이어야 합니다');
			 $('#password').focus();
		} else {
			$('#loginForm').submit();
		}
		
	});
	
	
});
</script>
</head>
<body>
	<h1>Home</h1>
	<!-- 로그인 되었을 때 -->
	<c:if test="${loginStaff == null}">
		<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
			<div>email: </div>
			<div><input type="text" id="email" name="email" value="mike@gd.com"></div>
			<div>password: </div>
			<div><input type="password" id="password" name="password" value="1234"></div>
			<br>
			<div>
				<button id="btn" type="button">로그인</button>
			</div>
		</form>
	
	</c:if>
	<!-- 로그인 안되었을때...-->
	<c:if test="${loginStaff != null}">
		<a href="${pageContext.request.contextPath}/admin/getBoardList">게시판</a>
		<a href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a>
		<a href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>		
		<a href="${pageContext.request.contextPath}/admin/getActorList">배우목록</a>		
		<a href="${pageContext.request.contextPath}/admin/getCustomerList">손님목록</a>
		<a href="${pageContext.request.contextPath}/admin/getInventoryList">재고목록</a>	
		<a href="${pageContext.request.contextPath}/admin/getSales">매출목록</a>
		<a href="${pageContext.request.contextPath}/admin/">대여/대출</a>
		<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
		<!-- 로그인 화면 넣을것임... -->
	
	</c:if>
	
</body>
</html>