<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>staffList</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Summernote -->
    <link href="${pageContext.request.contextPath}/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/chartjs/chartUpload/3.3.2"></script>
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
                            <h4>직원 목록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a></li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
            	 <div class="row">
            	 	<!-- 리스트 시작 -->
            	 	<div class="col-lg-12">
                        <div class="card">
                        	<div class="card-header">
                                
                            </div>
                             <div class="card-body">
                                <div class="table">
                                		
										<table class="table table-responsive-sm text-center">
											<thead>
												<tr>
													<th>ID</th>
													<th>name</th>
													<th>SID(근무 매장 번호)</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="s" items="${staffList}">
													<tr>
														<td>${s.ID}</td>
														<td>
															<a href="${pageContext.request.contextPath}/admin/getStaffOne?ID=${s.ID}">${s.name}</a>	
														</td>
														<td>${s.SID}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										
										<div>
											<a href="${pageContext.request.contextPath}/admin/addStaff">직원등록</a>
										</div>
									                                  	                                  	
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