<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFilmList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready!');
	console.log($('#category').val());
	$('#btn').click(function(){
		console.log('btn click!')
		if($('#searchWord').val() != ''){
			$('#searchWordAction').submit();
		}
	});
	
	
	$('#category').change(function(){
		console.log($('#category').val());
		$('#categoryAction').submit();
	});
	
	$('.rating').change(function(){
		$('#ratingAction').submit();
	});
	
	$('#searchOption').change(function(){
		console.log($('#searchOption').val());
		$('#searchWord').remove()
		
		if($('#searchOption').val() == 'title'){
			console.log('제목');
			$('#target').append('<input type="text" name="searchWord" id="searchWord">');
		} else{
			console.log('배우');
			$('#target').append('<input type="text" name="searchWord" id="searchWordActor">');
		}
	});
	
});

</script>
</head>
<body>
	 <form id="categoryAction" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
		<select id="category" name="category">
			<option value="all">all</option>
			<c:forEach var="c" items="${categoryList}">
				<c:if test="${c.equals(category)}">
					<option selected="selected" value="${c}">${c}</option>
				</c:if>
				<option value="${c}">${c}</option>
			</c:forEach>
		</select>
	</form>
	
	<!-- 등급 -->
	<form id="ratingAction" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
		<input type="radio" class="rating" name="rating" value="teenager">청소년 관람 가능
		<input type="radio" class="rating" name="rating" value="adult">청소년 관람 불가
		<input type="radio" class="rating" name="rating" value="all">모두 보기
	</form>
	
	<h1>FilmList</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>category</th>
				<th>title</th>
				<th>price</th>
				<th>LENGTH</th>
				<th>rating</th>
				<th>actors</th>
				<th>description</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="f" items="${filmList}">
				<tr>
					<td>${f.category}</td>
					<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${f.flimId}">${f.title}</a></td>
					<td>${f.rentalRate}</td>
					<td>${f.length}</td>
					<td>${f.rating}</td>
					<td>
						<c:if test="${f.actors.length()<=30}">
							${f.actors}
						</c:if>
						<c:if test="${f.actors.length()>30}">
							${f.actors.substring(0,30)}...
						</c:if>
					</td>
					<td>
						<c:if test="${f.description.length()<=50}">
							${f.description}
						</c:if>
						<c:if test="${f.description.length()>50}">
							${f.description.substring(0,50)}...
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&searchWord=${searchWord}&category=${category}&rating=${rating}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&searchWord=${searchWord}&category=${category}&rating=${rating}">다음</a></li>
        </c:if>
    </ul>
    
    <!-- 검색 -->
    <form id="searchWordAction" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
    	<select id="searchOption">
    		<option value="title">제목</option>
    		<option value="actor">배우</option>
    	</select>
    	<input type="hidden" name="category" value="${category}">
    	<span id="target">
    		<input type="text" name="searchWord" id="searchWord">
    	</span>
    	
    	<button type="button" id="btn">찾기</button>
    </form>
</body>
</html>