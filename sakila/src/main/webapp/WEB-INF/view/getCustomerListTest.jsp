<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getCustomerList</title>
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
                            <h4>고객 목록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                             <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                            <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getCustomerList">고객목록</a></li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
                <div class="row">
                <!-- 리스트 시작... -->
                	 <div class="col-lg-12">
                        <div class="card">
                             <div class="card-body">
                                <div class="table-responsive">
                                	
                                	<div>
										<a href="${pageContext.request.contextPath}/admin/getCustomerList">전체</a>
										<a href="${pageContext.request.contextPath}/admin/getCustomerList?storeId=1">1호점</a>
										<a href="${pageContext.request.contextPath}/admin/getCustomerList?storeId=2">2호점</a>
									</div>
                                	
                                	<table class="table table-hover table-responsive-sm">
										<thead>
											<tr>
												<th>store id</th>
												<th>name</th>
												<th>phone</th>
												<th>black&vip</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${customerList}" var="c">
												<tr>
													<td>${c.storeId}</td>
													<td><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${c.customerId}">${c.name}</a></td>
													<td>${c.phone}</td>
													<td>${c.blackAndVip}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<!-- 고객등록 -->
									<div>
										<a href="${pageContext.request.contextPath}/admin/addCustomer">고객등록</a>
									</div>
									
									
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