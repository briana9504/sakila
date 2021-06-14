<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get rental and return</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#phone').on("change keyup paste", function(){
		console.log('change');
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
	    			$('#target').append('<td>'+item.customerId+'</td>');
	    			$('#target').append('<td><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId='+item.customerId+'">'+item.name+'</a></td>');
	    			$('#target').append('<td>'+item.phone+'</td>');
	    			$('#target').append('</tr>');	    			
	    		});
	    		  		
	    	}
	    })
	})
	
	/*
	$('#inventoryId').on("change keyup paste", function(){
		//$('#rentalTarget').empty();
		
		$('#rentalTarget').append('<tr>');
		$('#rentalTarget').append('<td>hello</td>');
		$('#rentalTarget').append('</tr>');
	})
	*/
	
	
	$('#inventoryId').on("change keyup paste", function(){
		console.log('change');
		console.log($('#inventoryId').val());
	    $.ajax({
	    	type:'get',
	    	url:'/getRentalListByInventoryId',
	    	data: {inventoryId: $('#inventoryId').val()},
	    	success: function(jsonData){
	    		console.log('성공');
	    		//console.log(jsonData);
	    		
	    		$('#rentalTarget').empty();
	    		
	    		$(jsonData).each(function(index,item){
	    			
	    			$('#rentalTarget').append('<tr>');
	    			$('#rentalTarget').append('<td class="searchInvetoryId">'+item.inventoryId+'</td>');
	    			$('#rentalTarget').append('<td>'+item.title+'</td>');
	    			$('#rentalTarget').append('<td>'+item.state+'</td>');
	    			$('#rentalTarget').append('<td><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId='+item.customerId+'">'+item.customerId+'</a></td>');
	    			$('#rentalTarget').append('<td><button class="returnBtn">반납</button></td>');
	    			$('#rentalTarget').append('</tr>'); 
	    			
	    		});
	    		
	    		$('.returnBtn').click(function(){
	    			
	    			//리턴id 구하기
	    			let index = $('.returnBtn').index(this);
	    			//console.log(index);//배열 위치 구하기
	    			//console.log($('.searchInvetoryId').eq(index).text());
	    			//console.log(this);
	    			//console.log(jsonData[index]);
	    			//console.log(jsonData[index].rentalId);
	    			console.log(jsonData[index].overdue);
	    			console.log(jsonData[index].rentalRate);
	    			//console.log(jsonData[index].overdue+jsonData[index].rentalRate);
	    			let amount = jsonData[index].overdue+jsonData[index].rentalRate;
	    			console.log(amount);
	    			if(isNaN(amount)){
	    				amount = jsonData[index].rentalRate;
	    			}
	    			console.log(amount);
	    			
	    			if(jsonData[index].state == '연체'){
	    				console.log('연체입니다.');
	    				alert('연체입니다.');
	    				//alert('연체료는 ' + jsonData[index].overdue + '$ 입니다.');
	    				
	    				//연체료 알림창!
	    				let overdueConfirm = confirm('연체료는 ' +jsonData[index].overdue+ '$ 입니다.');
	    				console.log(overdueConfirm);
	    				
	    				if(overdueConfirm == false){
	    					alert('연체료를 내주는 착한 손님이 됩시다.');
	    					return;
	    				}
	    				
	    				$.ajax({
	    					type: 'get',
	    					url: '/modifyRentalAndPayment',
	    					data: {rentalId: jsonData[index].rentalId, amount: amount},	
	    					success: function(jsonData){
	    						console.log('됬을까???');
	    					}
	    				})
	    				
	    			}

	    		})
	    	}
	    })
	})
	
	
	
});
</script>
</head>
<body>
<div class="container">

	<h1>대여/반남</h1>
	
	<!-- 대여버튼 -->
	<button type="button" data-toggle="modal" data-target="#rental">
   		 대여
    </button>

  <!-- The Modal -->
  <div class="modal" id="rental">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">대여</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<h6>대여하는 손님의 휴대폰 번호를 적어주세요</h6>
        	
         	<div>
         		<input id="phone" type="text">
      			
         	</div>
         	
         	<table class="table">
         		<thead>
         			<tr>
         				<th>ID</th>
         				<th>이름</th>
         				<th>번호</th>
         			</tr>
         		</thead>
         		
         		<tbody id="target">
         			
         		</tbody>
         		
         	</table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <!-- 대여 끝 -->
	
	
	
	
	<!-- 반납버튼 -->
	<button type="button" data-toggle="modal" data-target="#myModal">
   		 반납
    </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">반납</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	<p> 반납할 영화의 inventory ID를 적어주세요. </p>
         	<div>
         		<input type="text" id="inventoryId">
         	</div>
         	
         	<table class="table" id="rentalTable">
         		<thead>
         			<tr>
         				<th>인벤토리ID</th>
         				<th>제목</th>
         				<th>상태</th>
         				<th>손님ID</th>
         				<th></th>
         			</tr>
         		</thead>
         		<tbody id="rentalTarget"></tbody>
         		
         	</table>
         	
         	
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <!-- 반납 버튼 끝 -->
	
	<h3>대여목록</h3>
	
	<table class="table">
		<thead>
			<tr>
				<th>지점</th>
				<th>제목</th>
				<th>빌려간 날짜</th>
				<th>빌려간 손님ID</th>
				<th>상태</th>
				<th>연체료</th>
			</tr>
		</thead>
		<c:forEach items="${rentalList}" var="r">
			<tr>
				<td>${r.storeId}</td>
				<td>${r.title}</td>
				<td>${r.rentalDate}</td>
				<td>${r.customerId}</td>
				<td>${r.state}</td>
				<td>${r.overdue}</td>
			</tr>
		</c:forEach>
	</table>
		<div>
			<!-- 페이징 -->
			<ul class="pager">
		        <c:if test="${currentPage > 1}">
	            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getRentalAndReturn?currentPage=${currentPage-1}">이전</a></li>        
		        </c:if>
		       
		        <c:if test="${currentPage < lastPage}">
	            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getRentalAndReturn?currentPage=${currentPage+1}">다음</a></li>        
		        </c:if>
		    </ul>
    </div>
</div>

</body>
</html>