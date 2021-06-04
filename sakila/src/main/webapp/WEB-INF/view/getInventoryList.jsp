<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function() {
		console.log('click!');
		$('#searchAction').submit();
	});
});
</script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/admin/addInventory">재고추가</a>
	<a href="${pageContext.request.contextPath}/admin/removeInventory">재고삭제</a>

	<h1>재고리스트</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>title</th>
				<th>1호점 재고</th>
				<th>2호점 재고</th>
				<th>전체 재고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${inventoryList}" var="i">
				<tr>
					<td>${i.filmId}</td>
					<td>${i.title}</td>
					<td>
						<c:if test="${i.store1 == null}">
							0
						</c:if>
						${i.store1}
					</td>
						
					<td>
						<c:if test="${i.store2 == null}">
							0
						</c:if>
						${i.store2}
					</td>
					<td>
						<c:if test="${i.totalStock == null}">
							0
						</c:if>
						${i.totalStock}
					</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	
	<form id="searchAction" action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">

		<span id="target">
			<input type="text" name="searchWord" id="searchWord">
		</span>
		<button type="button" id="btn">검색</button>
	</form>
	
	
	<!-- 현재 페이지/ 마지막 페이지 -->
		<div class="text-center">
			${currentPage}/${lastPage}
		</div>
		
		<div>
			<!-- 페이징 -->
			<ul class="pager">
		        <c:if test="${currentPage > 1}">
	            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+-1}">이전</a></li>        
		        </c:if>
		       
		        <c:if test="${currentPage < lastPage}">
	            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}">다음</a></li>        
		        </c:if>
		    </ul>
	    </div>
</body>
</html>