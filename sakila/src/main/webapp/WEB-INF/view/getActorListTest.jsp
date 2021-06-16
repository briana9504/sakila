<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actor list</title>
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
	console.log('ready!');

	
	
	$('#btn').click(function(){
		console.log('btn.click!')
		if(!$('.search').val()){ //"", null, undefined, 0, NaN 는 false를 리턴한다.
			alert('검색어를 입력하시오');
			$('.search').focus();
		} else {
			$('#searchAction').submit();
		}
		
	});
	
	$('#searchOption').change(function(){
		console.log('change!');
		if($('#searchOption').val() == 'name'){
			console.log('name!');
			$('#target').empty();
			$('#target').append('<input type="text" name="searchWord" placeholder="name" class="search">');
		} else if($('#searchOption').val() == 'film'){
			console.log('film!');
			$('#target').empty();
			$('#target').append('<input type="text" name="searchFilm" placeholder="film" class="search">');
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
                            <h4>배우 목록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getActorList">배우목록</a></li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
            	 <div class="row">
            	 
            	 	<!-- 리스트 시작... -->
                	 <div class="col-lg-12">
                        <div class="card">
                        	<div class="card-header">
                               
                            </div>
                             <div class="card-body">
                                <div class="table">							
                               		<table class="table table-hover table-responsive-sm">
										<thead class="text-center">
											<tr>
												<td>name</td>
												<td>filmInfo </td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${actorList}" var="a">
												<tr>
													<td>${a.name}</td>
													<!-- filmInfo 깔끔하게 보는방법? -->
													<td>${a.filmInfo}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>		
								
									<!-- 현재 페이지/ 마지막 페이지 -->
										<div class="text-center">
											${currentPage}/${lastPage}
										</div>
										
										<div>
											<!-- 페이징 -->
											<ul class="pager">
										        <c:if test="${currentPage > 1}">
									            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage-1}&searchWord=${searchWord}&searchFilm=${searchFilm}">이전</a></li>        
										        </c:if>
										       
										        <c:if test="${currentPage < lastPage}">
									            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage+1}&searchWord=${searchWord}&searchFilm=${searchFilm}">다음</a></li>        
										        </c:if>
										    </ul>
									    </div>
										
										<!-- 검색어 -->
										<form action="${pageContext.request.contextPath}/admin/getActorList" id="searchAction" method="get">
											<div class="row text-center">
												<select id="searchOption">
													<option value="name">이름</option>
													<option value="film">영화</option>
												</select>
												
												<span id="target">
													<input type="text" name="searchWord" placeholder="name" class="search">
												</span>
												
												<button type="button" id="btn">검색</button>
											</div>
										</form>
										<!-- 배우추가 창으로 가는 버튼 -->
										<div class="text-right">
											<a href="${pageContext.request.contextPath}/admin/addActor">
												배우등록
											</a>
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