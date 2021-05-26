<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getActorList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready!');
	
	$('#btn').click(function(){
		console.log('btn.click!')
		$('#searchAction').submit();
	});
	
	$('#searchOption').change(function(){
		console.log('change!');
		if($('#searchOption').val() == 'name'){
			console.log('name!');
			$('#target').empty();
			$('#target').append('<input type="text" name="searchWord" placeholder="name">');
		} else if($('#searchOption').val() == 'film'){
			console.log('film!');
			$('#target').empty();
			$('#target').append('<input type="text" name="searchFilm" placeholder="film">');
		}
	});
});
</script>
</head>
<body>
	<h1>Actor List</h1>
	
	<table border="1">
		<thead>
			<tr>
				<td>name</td>
				<td>filmInfo </td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${actorList}" var="a">
				<tr>
					<td>${a.name}</td>
					<td>${a.filmInfo}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		${currentPage}/${lastPage}
	</div>
	
	<div>
		<!-- 페이징 -->
		<ul class="pager">
	        <c:if test="${currentPage > 1}">
            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>        
	        </c:if>
	       
	        <c:if test="${currentPage < lastPage}">
            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>        
	        </c:if>
	    </ul>
    </div>
	
	
	<form action="${pageContext.request.contextPath}/admin/getActorList" id="searchAction">
		<select id="searchOption">
			<option value="name">이름</option>
			<option value="film">영화</option>
		</select>
		<div id="target">
			<input type="text" name="searchWord" placeholder="name">
		</div>
		
		<button type="button" id="btn">검색</button>
	</form>
	
	<div>
		<a href="${pageContext.request.contextPath}/admin/addActor">
			배우추가
		</a>
	</div>
</body>
</html>