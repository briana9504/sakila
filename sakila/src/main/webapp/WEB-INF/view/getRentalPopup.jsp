<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function click(customerId){
	console.log(customerId);
}

$(document).ready(function() {
	console.log('bye');
	
	
	/*
	$('#phone').on("change keyup paste", function(){
	    $.ajax({
	    	type:'get',
	    	url:'/getCustomerListByPhone',
	    	data: {phone: $('#phone').val()},
	    	success: function(jsonData){
	    		console.log('성공');
	    		//console.log(jsonData);
	    		$('#target').empty();
	    		//item.customerId  ,, $('#target').append('<td><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId='+item.customerId+'">'+item.name+'</a></td>');
	    		$(jsonData).each(function(index,item){
	    			$('#target').append('<tr>');
	    			$('#target').append('<td onclick="click('+item.customerId+')">'+item.name+'</td>');
	    			$('#target').append('<td>'+item.phone+'</td>');
	    			$('#target').append('</tr>');	    			
	    		});
	    		  		
	    	}
	    })
	})
	*/
	
	$('#btn').click(function(){
		
		let rePhone = prompt("손님의 휴대폰 번호를 입력하세요");
		
		let url = "/admin/getRentalPopup?phone="+rePhone;
		let name = "getRentalPopup";
		let option = "width = 800, height = 500, top = 100, left = 300, location = no";
		window.open(url, name, option);
		
	});
});

//<a href="javascript:opener.document.location.href='이동할 경로';window.close();" ></a>

</script>
</head>
<body>
	
	<p>손님 선택</p>
	
	<button id="btn">재검색</button>
	<table border="1">
		<thead>
			<tr>
				<th onclick="click()">이름</th>
				<th>휴대폰번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${customerList}">
				<tr>
					<td><a href="javascript:opener.document.location.href='${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${c.customerId}';window.close();" >${c.name}</a></td>
					<td>${c.phone}</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>