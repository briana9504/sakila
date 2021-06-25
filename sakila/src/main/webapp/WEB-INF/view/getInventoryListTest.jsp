<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get Inventory List</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Summernote -->
    <link href="${pageContext.request.contextPath}/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<style>
	.verticalMargin{
		margin-top: 1%;
		margin-bottom: 1%;
	}
	
	.margin{
		margin: 1%;
	}
	
	nav{
		display: table;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	.btn{
		margin: 5px;
	}
	
</style>
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
                            <h4>재고 목록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                            <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getCustomerList">재고목록</a></li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
            	 <div class="row">
            	 	
            	 	<!-- 리스트 시작... -->
                	 <div class="col-lg-12">
                        <div class="card">
                        	<div class="card-header justify-content-end">
                                <a class="margin" href="${pageContext.request.contextPath}/admin/addInventory">재고추가</a>
								<a class="margin" href="${pageContext.request.contextPath}/admin/removeInventory">재고삭제</a>
                            </div>
                             <div class="card-body">
                                <div class="table">
                                		
										
                                		<table class="table table-hover table-responsive-sm text-center">
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
														<td class="text-left">${i.title}</td>
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
								
										
								
								
									<!-- 현재 페이지/ 마지막 페이지 -->
										<div class="text-center">
											${currentPage}/${lastPage}
										</div>
										
										 <nav>
		                                    <ul class="pagination pagination-gutter">
		                                    	<c:if test="${currentPage > 1}">
			                                        <li class="page-item page-indicator">
			                                            <a class="page-link" href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+-1}">
			                                                <i class="icon-arrow-left"></i></a>
			                                        </li>
		                                        </c:if>
		                                        
		                                         <c:if test="${currentPage < lastPage}">
			                                        <li class="page-item page-indicator">
			                                            <a class="page-link" href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}">
			                                                <i class="icon-arrow-right"></i></a>
			                                        </li>
		                                        </c:if>
		                                    </ul>
										</nav>
									    
									    <form id="searchAction" action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">
									    	<div class="row">
									    		<div class="col-sm-5"></div>
									    		<span id="target" class="verticalMargin">
													<input type="text" name="searchWord" id="searchWord" class="form-control">
												</span>
												<button type="button" id="btn" class="btn btn-light margin">검색</button>
									    	</div>													
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