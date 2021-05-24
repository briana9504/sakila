<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Film One</h1>
	
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${filmOne.title}</td>
		</tr>
		<tr>
			<td>장르</td>
			<td>${filmOne.category}</td>
		</tr>
		<tr>
			<td>개봉년도</td>
			<td>${filmOne.releaseYear}</td>
		</tr>
		<tr>
			<td>줄거리</td>
			<td>${filmOne.description}</td>
		</tr>
		<tr>
			<td>대여료</td>
			<td>${filmOne.price}</td>
		</tr>
		<tr>
			<td>상영시간</td>
			<td>${filmOne.length}</td>
		</tr>
		<tr>
			<td>등급</td>
			<td>${filmOne.rating}</td>
		</tr>
		<tr>
			<td>출연배우</td>
			<td>${filmOne.actors}</td>
		</tr>
		<tr>
			<td>사용언어</td>
			<td>${filmOne.languageName}</td>
		</tr>
		<tr>
			<td>대여기간</td>
			<td>${filmOne.rentalDuration}일</td>
		</tr>
		<tr>
			<td>1번store 재고</td>
			<td>${countInvetory1}</td>
		</tr>
		<tr>
			<td>2번store 재고</td>
			<td>${countInvetory2}</td>
		</tr>
		<tr>
			<td>replacementCost</td>
			<td>${filmOne.replacementCost}</td>
		</tr>
		<tr>
			<td>specialFeatures</td>
			<td>${filmOne.specialFeatures}</td>
		</tr>
	</table>
</body>
</html>