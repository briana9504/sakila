<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFilmList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
let hidden = '${f.description}';
$(document).ready(function(){
	//console.log('ready!');
	//console.log($('#category').val());
	/*
	$('#btn').click(function(){
		console.log('btn click!')
		$('#searchWordAction').submit();
	});
	*/
	
	$('#getListBtn').click(function(){
		console.log('btn click!')
		$('#getFilmListAction').submit();
	});
	/*
	//카테고리 선택하는 순간 변경
	$('#category').change(function(){
		console.log($('#category').val());
		$('#categoryAction').submit();
	});
	
	//등급 선택하는 순간 변경
	$('.rating').change(function(){
		$('#ratingAction').submit();
	});
	
	//가격선택
	$('#price').change(function(){
		console.log($('#price').val());
		$('#priceAction').submit();
	});
	
	//게시물 수
	$('#rowPerPage').change(function(){
		console.log($('#rowPerPage').val());
		$('#rowPerPageAction').submit();
	});
	
	
	//등급 체크박스
	$('#ratingBtn').click(function name() {
		console.log('checkboxClick!');
		$('#ratingCheckboxAction').submit();
	});
	
	*/
	
	//검색어: 제목, 배우 변경	
	$('#searchOption').change(function(){
		console.log($('#searchOption').val());
	
		if($('#searchOption').val() == 'title'){
			$('#target').empty()
			console.log('제목');
			$('#target').append('<input type="text" name="searchWord" id="searchWord">');
		} else if($('#searchOption').val() == 'actor'){
			$('#target').empty()
			console.log('배우');
			$('#target').append('<input type="text" name="searchActor" id="searchActor">');
		} else if($('#searchOption').val() == 'description'){
			$('#target').empty()
			$('#target').append('<input type="text" name="searchDescription" id="searchDescription">');
		} else{
			$('#target').empty()
			$('#target').append('<input type="text" name="titleAndDescription" id="titleAndDescription">');
		}
	});
	
});

</script>
</head>
<body>
	<div class="container">
		<div>
			<a href="${pageContext.request.contextPath}/">
				홈으로
			</a>
		</div>
		
		<br>
		<form id="getFilmListAction" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
			<div>
				게시물 수
				<select id="rowPerPage" name="rowPerPage">
					<c:forEach begin="10" step="10" end="30" var="r">
						<c:if test="${r.equals(rowPerPage)}">
							<option selected="selected" value="${r}">${r}</option>
						</c:if>
						<c:if test="${!r.equals(rowPerPage)}">
							<option value="${r}">${r}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			
			
			<div>
				카테고리
				<select id="category" name="category">
					<option value="all">all</option>
					<c:forEach var="c" items="${categoryList}">
						<c:if test="${c.equals(category)}">
							<option selected="selected" value="${c}">${c}</option>
						</c:if>
						<c:if test="${!c.equals(category)}">
							<option value="${c}">${c}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			
			<div>
				등급
				<c:if test="${rating.equals('teenager')}">
					<input type="radio" class="rating" name="rating" value="teenager" checked="checked">청소년 관람 가능
				</c:if>
				<c:if test="${!rating.equals('teenager')}">
					<input type="radio" class="rating" name="rating" value="teenager">청소년 관람 가능
				</c:if>
				
				<c:if test="${rating.equals('adult')}">
					<input type="radio" class="rating" name="rating" value="adult" checked="checked">청소년 관람 불가
				</c:if>
				<c:if test="${!rating.equals('adult')}">
					<input type="radio" class="rating" name="rating" value="adult">청소년 관람 불가
				</c:if>
				
				<c:if test="${rating.equals('all')}">
					<input type="radio" class="rating" name="rating" value="all" checked="checked">모두 보기
				</c:if>
				<c:if test="${!rating.equals('all')}">
					<input type="radio" class="rating" name="rating" value="all">모두 보기
				</c:if>
			</div>

			
			<div>
				가격
				<select id="price" name="price">
					<option value="0">all</option>
					<c:if test="${price == 0.99}">
						<option value="0.99" selected="selected">0.99</option>
					</c:if>
					<c:if test="${price != 0.99}">
						<option value="0.99">0.99</option>
					</c:if>
					
					<c:if test="${price == 2.99}">
						<option value="2.99" selected="selected">2.99</option>
					</c:if>
					<c:if test="${price != 2.99}">
						<option value="2.99">2.99</option>
					</c:if>
					
					<c:if test="${price == 4.99}">
						<option value="4.99" selected="selected">4.99</option>
					</c:if>
					<c:if test="${price != 4.99}">
						<option value="4.99">4.99</option>
					</c:if>
				</select>
			</div>
			
			
			<div>
				검색
				<select id="searchOption">
		    		<option value="title">제목</option>
		    		<option value="actor">배우</option>
		    		<option value="description">줄거리</option>
		    		<option value="titleAndDescription">제목+줄거리</option>
		    	</select>
		    	
		    	<span id="target">
		    		<input type="text" name="searchWord" id="searchWord">
		    	</span>
			</div>
					
			<!--
				<div>
					<input type="checkbox" name="rating" value="G">G
					<input type="checkbox" name="rating" value="PG">PG
					<input type="checkbox" name="rating" value="PG-13">PG-13
					<input type="checkbox" name="rating" value="R">R
					<input type="checkbox" name="rating" value="NC-17">NC-17
				</div>
			
			 -->		
	    	
			<br>
			<button type="button" id="getListBtn">검색</button>
		</form>	
		
		<h1>FilmList</h1>
		
		<!-- film List -->
		<table class="table table-striped">
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
						<td>${f.price}</td>
						<td>${f.length}</td>
						<td>${f.rating}</td>
						
						<!-- ajax 배우면 고치기 -->
						<td>
							${f.actors}
	
						</td>
						<!-- ajax 배우면 고치기 -->
						<td>
							${f.description}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 현재 페이지/ 마지막 페이지 -->
		<div class="text-center">
			${currentPage}/${lastPage}
		</div>
		
		<div>
			<!-- 페이징 -->
			<ul class="pager">
		        <c:if test="${currentPage > 1}">
	            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&searchWord=${searchWord}&category=${category}&rating=${rating}&searchActor=${searchActor}&rowPerPage=${rowPerPage}&price=${price}&searchDescription=${searchDescription}&titleAndDescription=${titleAndDescription}">이전</a></li>        
		        </c:if>
		       
		        <c:if test="${currentPage < lastPage}">
	            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&searchWord=${searchWord}&category=${category}&rating=${rating}&searchActor=${searchActor}&rowPerPage=${rowPerPage}&price=${price}&searchDescription=${searchDescription}&titleAndDescription=${titleAndDescription}">다음</a></li>        
		        </c:if>
		    </ul>
	    </div>
    </div>
    
</body>
</html>