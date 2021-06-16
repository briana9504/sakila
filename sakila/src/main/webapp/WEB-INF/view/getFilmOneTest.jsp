<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>film one</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Summernote -->
    <link href="${pageContext.request.contextPath}/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                            <h4>영화 상세정보</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                           <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a></li>
                        	<li class="breadcrumb-item active">영화상세정보</li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
            	 <div class="row">
            	 	
            	 	<!-- 리스트 시작... -->
                	 <div class="col-lg-12">
                        <div class="card">
                        	<div class="card-header">
                                <p></p>
                            </div>
                             <div class="card-body">                             
                                <div class="table-responsive">
                                	
                                	<table class="table table-hover table-responsive-sm">
                                		<tr>
											<td>제목</td>
											<td>${filmOne.title}</td>
										</tr>
										<tr>
											<td>장르</td>
											<td>${filmOne.category}</td>
										</tr>
										<tr>
											<td>개봉년도</td>
											<td>${filmOne.releaseYear}</td>
										</tr>
										<tr>
											<td>줄거리</td>
											<td>${filmOne.description}</td>
										</tr>
										<tr>
											<td>대여료</td>
											<td>${filmOne.price} &#36;</td>
										</tr>
										<tr>
											<td>상영시간</td>
											<td>${filmOne.length} 분</td>
										</tr>
										<tr>
											<td>등급</td>
											<td>${filmOne.rating}</td>
										</tr>
										<tr>
											<td>출연배우</td>
											<td>
												${filmOne.actors}
												<a href="${pageContext.request.contextPath}/admin/getFilmActorListByFilm?filmId=${filmOne.filmId}">
													배우추가
												</a>
											</td>
										</tr>
										<tr>
											<td>사용언어</td>
											<td>${filmOne.languageName}</td>
										</tr>
										<tr>
											<td>원어</td>
											<td>${filmOne.originalLanguageId}</td>
										</tr>
										<tr>
											<td>대여기간</td>
											<td>${filmOne.rentalDuration}일</td>
										</tr>
										<tr>
											<td>1번store 재고</td>
											<td>${countInvetory1}</td>
										</tr>
										<tr>
											<td>2번store 재고</td>
											<td>${countInvetory2}</td>
										</tr>
										<tr>
											<td>분실값</td>
											<td>${filmOne.replacementCost} 	&#36;</td>
										</tr>
										<tr>
											<td>specialFeatures</td>
											<td>${filmOne.specialFeatures}</td>
										</tr>
									</table>
									<div>
										<a href="${pageContext.request.contextPath}/admin/modifyFilmOne?filmId=${filmOne.filmId}">영화 수정</a>
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