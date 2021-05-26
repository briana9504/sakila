<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getActorList</title>
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
		console.log('btn.click!')
		if(!$('.search').val()){ //"", null, undefined, 0, NaN 는 false를 리턴한다.
			alert('검색어를 입력하시오');
			$('.search').focus();
		} else {
			$('#searchAction').submit();
		}
		
	});
	
	$('#searchOption').change(function(){
		console.log('change!');
		if($('#searchOption').val() == 'name'){
			console.log('name!');
			$('#target').empty();
			$('#target').append('<input type="text" name="searchWord" placeholder="name" class="search">');
		} else if($('#searchOption').val() == 'film'){
			console.log('film!');
			$('#target').empty();
			$('#target').append('<input type="text" name="searchFilm" placeholder="film" class="search">');
		}
	});
});
</script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Actor List</h1>
		
		<!-- 배우 리스트 -->
		<table class="table table-striped">
			<thead class="text-center">
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
		
		<div class="text-center">
			${currentPage}/${lastPage}
		</div>
		
		<div>
			<!-- 페이징 -->
			<ul class="pager">
		        <c:if test="${currentPage > 1}">
	            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage-1}&searchWord=${searchWord}&searchFilm=${searchFilm}">이전</a></li>        
		        </c:if>
		       
		        <c:if test="${currentPage < lastPage}">
	            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage+1}&searchWord=${searchWord}&searchFilm=${searchFilm}">다음</a></li>        
		        </c:if>
		    </ul>
	    </div>
		
		<!-- 검색어 -->
		<form action="${pageContext.request.contextPath}/admin/getActorList" id="searchAction" method="get">
			<div class="row text-center">
				<select id="searchOption">
					<option value="name">이름</option>
					<option value="film">영화</option>
				</select>
				
				<span id="target">
					<input type="text" name="searchWord" placeholder="name" class="search">
				</span>
				
				<button type="button" id="btn">검색</button>
			</div>
		</form>
		<!-- 배우추가 창으로 가는 버튼 -->
		<div class="text-right">
			<a href="${pageContext.request.contextPath}/admin/addActor">
				배우추가
			</a>
		</div>
	
	</div>
</body>
</html>