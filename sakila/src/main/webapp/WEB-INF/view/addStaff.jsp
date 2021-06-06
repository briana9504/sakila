<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready!');
	
	$('#countryId').change(function cityList(){
		console.log('city 목록');
		$.ajax({
			type:'get',
			url:'/getCityList',
			data:{countryId : $('#countryId').val()},
			success: function(jsonData) {
				$('#cityId').empty();
				$(jsonData).each(function(index, item) {
					$('#cityId').append(
						'<option value="'+item.cityId+'">'+item.city+'</option>'
					);
				});
				$('#target').empty();
				$('#target').append('<input type="text" name="city" id="city" placeholder="city">');
				$('#target').append('<button id="cityBtn" type="button">도시추가</button>');
				
				
				$('#cityBtn').click(function(){
					console.log('도시추가');
					$.ajax({
						type: 'get',
						url: '/addCity',
						data: {city : $('#city').val(), countryId : $('#countryId').val()},
						success: function(jsonData){
							console.log('도시추가 성공');
							
							cityList();
						}
					});
				});
				
			}		
		}); 	
	});

	
	$('#btn').click(function(){
		console.log('click!');
		
		//유효성 검사 만들기
		$('#action').submit();
	});
	
});
</script>
</head>
<body>
	<h1>직원 등록</h1>
	
	<form id="action" method="post" action="${pageContext.request.contextPath}/admin/addStaff" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>name</th>
				<td>
					<div>first_name : <input type="text" id="firstName" name="staff.firstName"></div>
					<div>last_name : <input type="text" id="lastName" name="staff.lastName"></div>
				</td>
			</tr>
			<tr>
				<th>username</th>
				<td><input type="text" id="username" name="staff.username"></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="text" id="password" name="staff.password"></td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="email" id="email" name="staff.email"></td>
			</tr>
			<tr>
				<th>address</th>
				<td>
					<div>
						<select name="countryId" id="countryId">
							<c:forEach items="${countryList}" var="c">
								<option value="${c.countryId}">${c.country}</option>
							</c:forEach>	
						</select>
					</div>
					<div>
						<select name="address.cityId" id="cityId"></select>
						
							<span id="target"></span>
						
						<div>
							<input id="address" name="address.address" type="text" placeholder="address">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>address2</th>
				<td><input type="text" id="address2" placeholder="address2" name="address.address2"></td>
			</tr>
			
			<tr>
				<th>district</th>
				<td><input id="district" type="text" placeholder="district" name="address.district"></td>
			</tr>
			<tr>
				<th>postal_code</th>
				<td><input id="postalCode" type="text" placeholder="postalCode" name="address.postalCode"></td>
			</tr>
			
			<tr>
				<th>phone</th>
				<td>
					<input id="phone" type="text" placeholder="phone" name="address.phone">
				</td>
			</tr>
			<tr>
				<th>store</th>
				<td>
					<select name="staff.storeId" id="storeId">
						<option value="1">1호점</option>
						<option value="2">2호점</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>picture</th>
				<td>
					<input type="file" name="picture" id="picture">
				</td>
			</tr>
		</table>
		
		<button id="btn" type="button">직원등록</button>
	</form>
</body>
</html>