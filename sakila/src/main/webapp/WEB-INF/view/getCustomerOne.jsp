<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getCustomerOne</title>
</head>
<body>
	<h1>고객 상세정보</h1>
	
	<table border="1">
		<tr>
			<th>회원번호</th>
			<td>${customerOne.customerId}</td>
		</tr>
		<tr>
			<th>지점</th>
			<td>${customerOne.storeId}</td>
		</tr>
		<tr>
			<th>고객상태</th>
			<td>
				<c:if test="${customerOne.active == true}">
					활동 고객
				</c:if>
				
				<c:if test="${customerOne.active == false}">
					휴면고객
				</c:if>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${customerOne.name}</td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td>${customerOne.phone}</td>
		</tr>
		<tr>
			<th>나라</th>
			<td>${customerOne.country}</td>
		</tr>
		<tr>
			<th>도시</th>
			<td>${customerOne.city}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${customerOne.address}</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>${customerOne.createDate}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${customerOne.email}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${customerOne.zipCode}</td>
		</tr>
		<tr>
			<th>총 대여금액</th>
			<td>${totalPayment}&#36;</td>
		</tr>
	</table>
	
	<h3>대여 목록</h3>
	<table border="1">
		<thead>
			<tr>
				<th>지점</th>
				<th>제목</th>
				<th>대여료</th>
				<th>상태</th>
				<th>대여날짜</th>
				<th>반납날짜</th>
			</tr>		
		</thead>
		<tbody>
			<c:forEach items="${rentalList}" var="r">
				<tr>
					<td>${r.storeId}</td>
					<td>${r.title}</td>
					<td>${r.amount}&#36;</td>
					<td>${r.state}</td>
					<td>${r.rentalDate}</td>
					<td>${r.returnDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>