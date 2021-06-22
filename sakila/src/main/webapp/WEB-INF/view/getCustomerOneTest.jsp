<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer one</title>
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
$(document).ready(function(){
	console.log('hello!');
	
	//대여하기 버튼 click!
	$('#btn').click(function(){
		console.log('click!');
		
		let checkId = prompt("대여할 책의 inventory id를 입력하시오.");
		//대여 할 책의 정보 가져오기!
		$.ajax({
			type: 'get',
			url: '/getInventoryByRental',
			data: {inventoryId : checkId},
			success: function(jsonData){
				console.log('성공');
				let inventoryId = jsonData.inventoryId; //책의 인벤토리 번호
				let rating = jsonData.rating;//책의 등급
				let title = jsonData.title;//제목
				let rentalRate = jsonData.rentalRate;//가격
				let rentalDuration = jsonData.rentalDuration;//기간
				let state = jsonData.state;//빌리는 중인지 상태
				
				console.log(inventoryId);
				console.log(rating);
				console.log(title);
				console.log(rentalRate);
				console.log(rentalDuration);
				console.log(state);
				
				
				//재고가 존재하지 않을때
				if(title == undefined){
					alert('존재하지 않는 재고입니다.');
					return;
				}
				
				
				//대여중인 책이면 대여 못한다고 경고창
				if(state == false){
					alert(inventoryId+'번 '+title+'는 이미 대여중입니다.');
					return;
				}
				
				//성인 영화면 손님이 성인인지 확인
				if(rating == 'NC-17' || rating == 'R'){
					let checkedAge = confirm('손님의 나이가 성인입니까?')
					
					console.log(checkedAge);
					if(checkedAge == false){ //성인이 아니라고 대답한 경우
						alert('손님은 이 영화를 빌려 보실 수 없습니다.');
						return;
					}
				}
				//영화 빌릴건지 마지막 확인!
				let checked = confirm('영화 ' +title + '를 빌려보시곘습니까?\n가격은 ' +rentalRate+'$ 이고, 기간은 '+ rentalDuration+'일 입니다.');
				//확인 눌렀으면! 빌리로 가고 페이즌 새로고침한다.
				if(checked){
					console.log('영화 빌리기 gogo'); // 또 ajax 기술써서 영화 빌리로 가기!
					
					$.ajax({
						type: 'get',
						url: '/addRental',
						data: {inventoryId: inventoryId, customerId: $('#customerId').text(), rentalRate: rentalRate},
						success: function(jsonData){
							location.reload();// 페이지 새로고침
						}
					});	
				}	
			}	
		});		
	})
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
                            <h4>고객 상세정보</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                             <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                            <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getCustomerList">고객 목록</a></li>
                            <li class="breadcrumb-item active">고객 상세정보</li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
            	 <div class="row">
            	 	
            	 	<!-- 고객 정보 -->
            	 	<!-- 리스트 시작... -->
                	 <div class="col-lg-5">
                        <div class="card">
                        	<div class="card-header">
                                고객정보
                            </div>
                             <div class="card-body">
                                <div class="table ">			
                               		<table class="table table-hover table-responsive-sm">
										<tr>
											<th>회원번호</th>
											<td><span id="customerId">${customerOne.customerId}</span></td>
										</tr>
										<tr>
											<th>지점</th>
											<td>${customerOne.storeId}</td>
										</tr>
										<tr>
											<th>고객상태</th>
											<td>
												<c:if test="${customerOne.active == true}">
													활동 고객
												</c:if>
												
												<c:if test="${customerOne.active == false}">
													휴면고객
												</c:if>
											</td>
										</tr>
										<tr>
											<th>이름</th>
											<td>${customerOne.name}</td>
										</tr>
										<tr>
											<th>휴대폰번호</th>
											<td>${customerOne.phone}</td>
										</tr>
										<tr>
											<th>나라</th>
											<td>${customerOne.country}</td>
										</tr>
										<tr>
											<th>도시</th>
											<td>${customerOne.city}</td>
										</tr>
										<tr>
											<th>상세주소</th>
											<td>${customerOne.address}</td>
										</tr>
										<tr>
											<th>가입날짜</th>
											<td>${customerOne.createDate}</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>${customerOne.email}</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td>${customerOne.zipCode}</td>
										</tr>
										<tr>
											<th>총 대여금액</th>
											<td>${totalPayment}&#36;</td>
										</tr>
									</table>                                  
	                                  	
	                                </div>
	                            </div>                     
	                        </div>
	                     </div>
	                <!-- 리스트 끝 -->
	                
	                <!-- 리스트 시작... -->
                	 <div class="col-lg-7">
                        <div class="card">
                        	<div class="card-header">
                                고객 대여정보
                            </div>
                             <div class="card-body">
                             	<button id="btn" class="btn btn-rounded btn-outline-primary float-right">대여</button>
                                <div class="table">			
                               		<table class="table table-hover table-responsive-sm">
										<thead>
											<tr>
												<th>지점</th>
												<th>제목</th>
												<th>대여료</th>
												<th>상태</th>
												<th>대여날짜</th>
												<th>반납날짜</th>
											</tr>		
										</thead>
										<tbody>
											<c:forEach items="${rentalList}" var="r">
												<tr>
													<td>${r.storeId}</td>
													<td>${r.title}</td>
													<td>${r.amount}&#36;</td>
													<td>${r.state}</td>
													<td>${r.rentalDate}</td>
													<td>${r.returnDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>                                      	
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