<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify Film One</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		console.log('click!');
		
		if($('#title').val() == ''){
			alert('제목을 입력하세요');
			$('#title').focus();
		} else {
			$('#Action').submit();
		}
	});
});
</script>
</head>
<body>
	<h1>영화 정보 수정</h1>
	
	<form method="post" action="${pageContext.request.contextPath}/admin/modifyFilmOne" id="Action">
		<input type="hidden" name="film.filmId" value="${filmOne.filmId}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="film.title" id="title" value="${filmOne.title}">		
				</td>
			</tr>
			<tr>
				<td>장르</td>
				<td>
					<select name="category.categoryId" id ="categoryId" class="form-control">
                     <c:forEach var="c" items="${categoryList}">
                     	<c:if test="${c.name == filmOne.category}">
                     		<option value="${c.categoryId}" selected="selected">${c.name}</option>
                     	</c:if>
                     	<c:if test="${c.name != filmOne.category}">
                     		<option value="${c.categoryId}">${c.name}</option>
                     	</c:if>
                        
                     </c:forEach>
                  </select>
				</td>
			</tr>
			<tr>
				<td>개봉년도</td>
				<td>
					<input type="text" name="film.releaseYear" id="releaseYear" class="form-control" value="${filmOne.releaseYear}">		
				</td>
			</tr>
			<tr>
				<td>줄거리</td>
				<td>
					<textarea rows="5" cols="100" name="film.description" id="description" class="form-control">${filmOne.description}</textarea>
				</td>
			</tr>
			<tr>
				<td>대여료</td>
				<td>
					 <input type="text" name="film.rentalRate" id="rentalRate" class="form-control" value="${filmOne.price}">
					 &#36;
				</td>
			</tr>
			<tr>
				<td>상영시간</td>
				<td>
					<input type="text" name="film.length" id="length" class="form-control" value="${filmOne.length}">
					 분
				</td>
			</tr>
			<tr>
				<td>등급</td>
				<td>
					 <select name="film.rating" id ="rating" class="form-control">
	                    <option value="G" ${filmOne.rating == 'G'? 'selected="selected"': ''}>G</option>
	                    <option value="PG" ${filmOne.rating == 'PG'? 'selected="selected"': ''}>PG</option>
	                    <option value="PG-13" ${filmOne.rating == 'PG-13'? 'selected="selected"': ''}>PG-13</option>
	                    <option value="R" ${filmOne.rating == 'R'? 'selected="selected"': ''}>R</option>
	                    <option value="NC-17" ${filmOne.rating == 'NC-17'? 'selected="selected"': ''}>NC-17</option>
	                 </select>
				</td>
			</tr>
			<tr>
				<td>출연배우</td>
				<td>
					${filmOne.actors}
					<a href="${pageContext.request.contextPath}/admin/getFilmActorListByFilm?filmId=${filmOne.filmId}">
						배우추가
					</a>
				</td>
			</tr>
			<tr>
				<td>사용언어</td>
				<td>
					<select name="film.languageId" id ="language" class="form-control">
                    	<c:forEach var="lang" items="${languageList}">
                     		<c:if test="${lang.name == filmOne.languageName}">
                     			<option value="${lang.languageId}" selected="selected">${lang.name}</option>
                     		</c:if>
                     	
                     		<c:if test="${lang.name != filmOne.languageName}">
                     			<option value="${lang.languageId}">${lang.name}</option>
                     		</c:if>                       
                		</c:forEach>
                	</select>
				</td>
			</tr>
			<tr>
				<td>원어</td>
				<td>
					<select name="film.originalLanguageId" id ="originalLanguage" class="form-control">
                    	<c:forEach var="lang" items="${languageList}">
                     		<c:if test="${lang.languageId == filmOne.originalLanguageId}">
                     			<option value="${lang.languageId}" selected="selected">${lang.name}</option>
                     		</c:if>
                     	
                     		<c:if test="${lang.languageId != filmOne.originalLanguageId}">
                     			<option value="${lang.languageId}">${lang.name}</option>
                     		</c:if>                       
                		</c:forEach>
                	</select>
				</td>
			</tr>
			
			<tr>
				<td>대여기간</td>
				<td>
					<input type="text" name="film.rentalDuration" id="rentalDuration" class="form-control" value="${filmOne.rentalDuration}">
					일
				</td>
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
				<td> 	
					<input type="text" name="film.replacementCost" id="replacementCost" class="form-control" value="${filmOne.replacementCost}">
					&#36;
				</td>
			</tr>
			<tr>
				<td>specialFeatures</td>
				<td>		
	                <input type="checkbox" name="specialFeatures" value="Trailers" ${filmOne.specialFeatures.contains('Trailers')? 'checked="checked"':'' }>Trailers&nbsp;
	                <input type="checkbox" name="specialFeatures" value="Commentaries" ${filmOne.specialFeatures.contains('Commentaries')? 'checked="checked"':'' }>Commentaries&nbsp;
	                <input type="checkbox" name="specialFeatures" value="Deleted Scenes" ${filmOne.specialFeatures.contains('Deleted Scenes')? 'checked="checked"':'' }>Deleted Scenes&nbsp;
	                <input type="checkbox" name="specialFeatures" value="Behind the Scenes" ${filmOne.specialFeatures.contains('Behind the Scenes')? 'checked="checked"':'' }>Behind the Scenes          
				</td>
			</tr>
		</table>
		<div>
			<button id="btn">영화정보 수정</button>
		</div>
	</form>
</body>
</html>