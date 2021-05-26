<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFilmOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div>
				<a href="${pageContext.request.contextPath}/">
					홈
				</a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/admin/getFilmList">
					영화 리스트
				</a>
			</div>
		</div>
		
		<h1>Film One</h1>
		
		<table  class="table table-striped">
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
				<td>${releaseYear}</td>
			</tr>
			<tr>
				<td>줄거리</td>
				<td>${filmOne.description}</td>
			</tr>
			<tr>
				<td>대여료</td>
				<td>${filmOne.price} &#36;</td>
			</tr>
			<tr>
				<td>상영시간</td>
				<td>${filmOne.length} 분</td>
			</tr>
			<tr>
				<td>등급</td>
				<td>${filmOne.rating}</td>
			</tr>
			<tr>
				<td>출연배우</td>
				<td>
					${filmOne.actors}
					<a href="${pageContext.request.contextPath}/admin/modifyFilmActor?filmId=${filmOne.filmId}">
						배우추가
					</a>
				</td>
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
				<td>분실값</td>
				<td>${filmOne.replacementCost} 	&#36;</td>
			</tr>
			<tr>
				<td>specialFeatures</td>
				<td>${filmOne.specialFeatures}</td>
			</tr>
		</table>
	</div>
</body>
</html>