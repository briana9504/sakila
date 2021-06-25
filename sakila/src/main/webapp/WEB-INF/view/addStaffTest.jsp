<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add staff</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Summernote -->
    <link href="${pageContext.request.contextPath}/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
//첫글자 대문자로 만드기
function name (name){
	name = name.slice(0,1).toUpperCase() + name.slice(1).toLowerCase();
	return name;
}


$(document).ready(function(){
	console.log('ready!');
	
	$('#countryId').change(function cityList(){
		console.log('city 목록');
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/getCityList',
			data:{countryId : $('#countryId').val()},
			success: function(jsonData) {
				$('#cityId').empty();
				$(jsonData).each(function(index, item) {
					$('#cityId').append(
						'<option value="'+item.cityId+'">'+item.city+'</option>'
					);
				});
				
				$('#target').empty();
				$('#target').append('<input type="text" name="city" id="city" placeholder="city"  class="form-control input-default col-sm-4">');
				$('#target').append('<button id="cityBtn" type="button" class="btn">도시추가</button>');
				
				
				$('#cityBtn').click(function(){
					console.log('도시추가');
					
					//시티 앞 글자만 대문자로 바꾸기...!
					let str = $('#city').val();
					//공백에 따라 잘라서 배열에 저장
					let words = str.split(' ');
					console.log(words);
					//배열의 앞 글자를 대문자 뒷 글자를 소문자로 변경
					let concat = words.map(item => item.slice(0,1).toUpperCase() + item.slice(1).toLowerCase());

					console.log(concat);
					//배열을 하나의 문자열로 합친다.
					let cityName = concat.reduce(function(pre, currnet) {					
						return pre+' '+currnet;
					})
					
					console.log(cityName);
					
					$.ajax({
						type: 'get',
						url: '${pageContext.request.contextPath}/addCity',
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

	
	$('#btn').click(function(){
		//console.log('click!');
		//fist name 과 last name을 모두 첫글자 대문자 나머지 소문자로 바꾸기
		
		let first = name($('#firstName').val());
		console.log(first);
		$('#firstName').val(first);
		
		//console.log($('#firstName').val());

		
		let last = name($('#lastName').val());
		console.log(last);
		$('#lastName').val(last);
		
		//console.log($('#lastName').val());
		
		//유효성 검사 만들기
		if($('#firstName').val() == ''){
			
			alert('first name을 입력하시오.');
			$('#firstName').focus();
			
		} else if($('#lastName').val() == ''){
			
			alert('last name을 입력하시오.');
			$('#lastName').focus();
			
		} else if($('#username').val() == ''){
			
			alert('username을 입력하시오.');
			$('#username').focus();
			
		} else if($('#password').val() == ''){
			
			alert('password를 입력하시오.');
			$('#password').focus();
			
		} else if($('#email').val() == ''){
			
			alert('email를 입력하시오.');
			$('#email').focus();
			
		} else if($('#password').val() == ''){
			
			alert('password를 입력하시오.');
			$('#password').focus();
			
		} else if($('#address').val() == ''){
			
			alert('address를 입력하시오.');
			$('#address').focus();
			
		} else {
			$('#action').submit();
		}		
	});	
});
</script>
</head>
<body>
	<div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
     <div id="main-wrapper">
     <!-- 메뉴 -->
    	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
     	
     	
     	<div class="content-body">
            <div class="container-fluid">
            
            <!-- 제목 -->
	            <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>직원 등록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                            <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a></li>
                            <li class="breadcrumb-item active">직원등록</li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
            	 <div class="row">
            	 	
            	 	<!-- 리스트 시작 -->
            	 	<div class="col-lg-12">
                        <div class="card">
                        	<div class="card-header">
                                <p>등록할 직원 정보를 입력해 주세요.</p>
                            </div>
                             <div class="card-body">
                                <div class="table">
                                	<form id="action" method="post" action="${pageContext.request.contextPath}/admin/addStaff" enctype="multipart/form-data">	
										<table class="table table-hover table-responsive-sm">
											<tr>
												<th>name</th>
												<td>
													<div>first_name : <input type="text" id="firstName" name="staff.firstName" class="form-control input-default col-sm-4"></div>
													<div>last_name : <input type="text" id="lastName" name="staff.lastName" class="form-control input-default col-sm-4"></div>
												</td>
											</tr>
											<tr>
												<th>username</th>
												<td><input type="text" id="username" name="staff.username" class="form-control input-default col-sm-4"></td>
											</tr>
											<tr>
												<th>password</th>
												<td><input type="password" id="password" name="staff.password" class="form-control input-default col-sm-4"></td>
											</tr>
											<tr>
												<th>email</th>
												<td><input type="email" id="email" name="staff.email" class="form-control input-default col-sm-4"></td>
											</tr>
											<tr>
												<th>address</th>
												<td>
													<div class="row">
														<div class="col-sm-5">
															<select name="countryId" id="countryId" class="form-control">
																<c:forEach items="${countryList}" var="c">
																	<option value="${c.countryId}">${c.country}</option>
																</c:forEach>	
															</select>
														</div>
														<div class="col-sm-5">
															<select name="address.cityId" id="cityId" class="form-control col-sm-5"></select>																																																						
														</div>														
													</div>
													
													<div>
														<span id="target"></span>		
													</div>
													<div>
														<input id="address" name="address.address" type="text" placeholder="address" class="form-control input-default col-sm-5">
													</div>
												</td>
											</tr>
											<tr>
												<th>address2</th>
												<td><input type="text" id="address2" placeholder="address2" name="address.address2" class="form-control input-default col-sm-5"></td>
											</tr>
											
											<tr>
												<th>district</th>
												<td><input id="district" type="text" placeholder="district" name="address.district" class="form-control input-default col-sm-4"></td>
											</tr>
											<tr>
												<th>postal_code</th>
												<td><input id="postalCode" type="text" placeholder="postalCode" name="address.postalCode" class="form-control input-default col-sm-4"></td>
											</tr>
											
											<tr>
												<th>phone</th>
												<td>
													<input id="phone" type="text" placeholder="phone" name="address.phone" class="form-control input-default col-sm-4">
												</td>
											</tr>
											<tr>
												<th>store</th>
												<td>
													<select name="staff.storeId" id="storeId" class="form-control input-default col-sm-4">
														<option value="1">1호점</option>
														<option value="2">2호점</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>picture</th>
												<td>
													<input type="file" name="picture" id="picture" class="form-control cols-sm-2">
												</td>
											</tr>
										</table>
										
										<button id="btn" type="button" class="btn btn-outline-primary float-right">직원등록</button>
									 </form>                                 	                                  	
	                             </div>
	                           </div>                        
	                        </div>
	                     </div>	                
	                <!-- 리스트 끝 -->
            	 
            	 
            	 
            	 </div>
            </div>
         </div>
     	     
      	<!-- footer -->
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
     </div>
    <script src="${pageContext.request.contextPath}/vendor/global/global.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/quixnav-init.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
    <!-- Summernote -->
    <script src="${pageContext.request.contextPath}/vendor/summernote/js/summernote.min.js"></script>
    <!-- Summernote init -->
    <script src="${pageContext.request.contextPath}/js/plugins-init/summernote-init.js"></script>
</body>
</html>