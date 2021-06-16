<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add Customer</title>
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
				
				
				//도시추가 --> 도시이름의 앞 글자를 다 대문자로 바꾸기....
				$('#cityBtn').click(function(){
					console.log('도시추가');
					
					//시티 앞 글자만 대문자로 바꾸기...!
					let str = $('#city').val();
					
					let words = str.split(' ');
					console.log(words);

					let concat = words.map(item => item.slice(0,1).toUpperCase() + item.slice(1).toLowerCase());

					console.log(concat);

					let cityName = concat.reduce(function(pre, currnet) {
						
						return pre+' '+currnet;
					})
					
					console.log(cityName);
					
					$.ajax({
						type: 'get',
						url: '/addCity',
						data: {city : cityName, countryId : $('#countryId').val()},
						success: function(jsonData){
							console.log('도시추가 성공');
							
							cityList();
						}
					});
					
				});
				
			}		
		}); 	
	});
	
	//휴대폰 유효성 검사
	let ck = 0;
	$('#phoneCheckBtn').click(function() {
		console.log('click');
		
		$.ajax({
			type: 'get',
			url: '/getPhoneByCustomer',
			data: {phone: $('#phone').val()},
			success: function(jsonData){
				console.log(jsonData);
				
				if(jsonData == ''){
					console.log('가입 gogo');
					$('#phoneTarget').empty();
					$('#phoneTarget').append('중복 검사 성공!');
					ck = 1;
					
				} else {
					console.log('휴대폰 있음....');
					$('#phoneTarget').empty();
					$('#phoneTarget').append('중복된 휴대폰 번호가 있어요');
				}
			}
		});
	});
	//유효성 검사 만들기
	$('#btn').click(function(){
		console.log('click!');
		
		if($('#firstName').val() == ''){
			
			alert('first name을 입력하시오.');
			$('#firstName').focus();
			
		} else if ($('#lastName').val() == ''){
			
			alert('last name을 입력하시오.');
			$('#lastName').focus();
			
		}  else if ($('#email').val() == ''){
			
			alert('email을 입력하시오.');
			$('#email').focus();
			
		} else if ($('#cityId').val() == ''){
			
			alert('cityId을 입력하시오.');
			$('#cityId').focus();
			
		} else if (ck == 0){
			
			alert('휴대폰 유효성 검사를 해주세요.');
			$('#phone').focus();
			
		} else {
			
			$('#addCustomerAction').submit();
		}	
	});
});
</script>
</head>
<body>
	<h1>고객 등록</h1>
	
	<form id="addCustomerAction" action="${pageContext.request.contextPath}/admin/addCustomer" method="post">
		<table border="1">
			<tr>
				<th>등록 지점</th>
				<td>
					<select name="customer.storeId" id="storeId">
						<option value="1">1호점</option>
						<option value="2">2호점</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>name</th>
				<td>
					<div>first_name : <input type="text" id="firstName" name="customer.firstName" placeholder="first name"></div>
					<div>last_name : <input type="text" id="lastName" name="customer.lastName" placeholder="last name"></div>
				</td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="email" id="email" name="customer.email" placeholder="email"></td>
				
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
					<button type="button" id="phoneCheckBtn">중복검사</button>
					<span id="phoneTarget">중복 검사를 해주세요.</span>
				</td>
			</tr>			
		</table>
		
		<div>
			<button id="btn" type="button">등록</button>
		</div>
	</form>
</body>
</html>