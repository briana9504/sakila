<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getCustomerList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function() {
		console.log('click!');
		$('#searchAction').submit();
	});
	
	$('#searchOption').change(function(){
		console.log('change!');
		
		if($('#searchOption').val() == 'phone'){
			$('#target').empty();
			$('#target').append('<input type="text" name="searchPhone" id="searchPhone">');
		} else if($('#searchOption').val() == 'name'){
			$('#target').empty();
			$('#target').append('<input type="text" name="searchName" id="searchName">');
		}
		
	});
});
</script>
</head>
<body>
	<div>
		<a href="${pageContext.request.contextPath}/admin/getCustomerList">전체</a>
		<a href="${pageContext.request.contextPath}/admin/getCustomerList?storeId=1">1호점</a>
		<a href="${pageContext.request.contextPath}/admin/getCustomerList?storeId=2">2호점</a>
	</div>
	<h1>getCustomerList</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>store id</th>
				<th>name</th>
				<th>phone</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${customerList}" var="c">
				<tr>
					<td>${c.storeId}</td>
					<td>${c.name}</td>
					<td>${c.phone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<form id="searchAction" action="${pageContext.request.contextPath}/admin/getCustomerList" method="get">
		<select id="searchOption">
			<option value="name">이름</option>
	    	<option value="phone">휴대폰번호</option>
		</select>
		<span id="target">
			<input type="text" name="searchName" id="searchName">
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
	            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage-1}&searchName=${searchName}&searchPhone=${searchPhone}">이전</a></li>        
		        </c:if>
		       
		        <c:if test="${currentPage < lastPage}">
	            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage+1}&searchName=${searchName}&searchPhone=${searchPhone}">다음</a></li>        
		        </c:if>
		    </ul>
	    </div>
</body>
</html>