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
	<h1>재고리스트</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>inventory_id</th>
				<th>store_id</th>
				<th>title</th>
				<th>재고현황</th>
				<th>대여중인 고객ID</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${inventoryList}" var="i">
				<tr>
					<td>${i.inventoryId}</td>
					<td>${i.storeId}</td>
					<td>${i.title}</td>
					<td>${i.stockStatus}</td>
					<td>${i.customerId}</td>
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