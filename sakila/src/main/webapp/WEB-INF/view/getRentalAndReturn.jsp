<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get rental and return</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#rentalBtn').click(function(){
		console.log('click');
		
		let phone = prompt("손님의 휴대폰 번호를 입력하세요");
		
		if(phone != null){
			let url = "/admin/getRentalPopup?phone="+phone;
			let name = "getRentalPopup";
			let option = "width = 800, height = 500, top = 100, left = 300, location = no";
			window.open(url, name, option);
		}
	})
	
	$('#returnBtn').click(function(){
		console.log('return click!');
		let inventoryId = prompt("빌려간 책의 inventory ID를 입력하세요.");
		
		if(inventoryId != null){
			console.log('내일 해야지~~~~~~');
		}
	})
});
</script>
</head>
<body>
<h1>대여/반남</h1>

<button id="rentalBtn">대여</button>
<button id="returnBtn">반납</button>

<h3>대여목록</h3>



<table border="1">
	<thead>
		<tr>
			<th>지점</th>
			<th>제목</th>
			<th>빌려간 날짜</th>
			<th>빌려간 손님ID</th>
			<th>상태</th>
			<th>연체료</th>
		</tr>
	</thead>
	<c:forEach items="${rentalList}" var="r">
		<tr>
			<td>${r.storeId}</td>
			<td>${r.title}</td>
			<td>${r.rentalDate}</td>
			<td>${r.customerId}</td>
			<td>${r.state}</td>
			<td>${r.overdue}</td>
		</tr>
	</c:forEach>
</table>
	<div>
		<!-- 페이징 -->
		<ul class="pager">
	        <c:if test="${currentPage > 1}">
            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getRentalAndReturn?currentPage=${currentPage-1}">이전</a></li>        
	        </c:if>
	       
	        <c:if test="${currentPage < lastPage}">
            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getRentalAndReturn?currentPage=${currentPage+1}">다음</a></li>        
	        </c:if>
	    </ul>
    </div>
</body>
</html>