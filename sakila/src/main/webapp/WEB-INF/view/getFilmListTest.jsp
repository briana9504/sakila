<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmList</title>
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
let hidden = '${f.description}';
$(document).ready(function(){
	
	$('#getListBtn').click(function(){
		console.log('btn click!')
		$('#getFilmListAction').submit();
	});
	
	//검색어: 제목, 배우 변경	
	$('#searchOption').change(function(){
		console.log($('#searchOption').val());
	
		if($('#searchOption').val() == 'title'){
			$('#target').empty()
			console.log('제목');
			$('#target').append('<input type="text" name="searchWord" id="searchWord">');
		} else if($('#searchOption').val() == 'actor'){
			$('#target').empty()
			console.log('배우');
			$('#target').append('<input type="text" name="searchActor" id="searchActor">');
		} else if($('#searchOption').val() == 'description'){
			$('#target').empty()
			$('#target').append('<input type="text" name="searchDescription" id="searchDescription">');
		} else{
			$('#target').empty()
			$('#target').append('<input type="text" name="titleAndDescription" id="titleAndDescription">');
		}
	});
	
	/*
	$('.btn').click(function(){
		console.log('btn click!');
		//  클릭한 id가져오기
		let clickedId = $(this).attr("id"); -> 클릭한 버튼의 id 가져오기
		})	
	});
	*/	
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
                            <h4>영화 목록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a></li>
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
											<thead>
												<tr>
													<th>category</th>
													<th>title</th>
													<th>price</th>
													<th>LENGTH</th>
													<th>rating</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="f" items="${filmList}">
													<tr>
														<td>${f.category}</td>
														<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${f.flimId}">${f.title}</a></td>
														<td>${f.price}</td>
														<td>${f.length}</td>
														<td>${f.rating}</td>
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
									            	<li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&searchWord=${searchWord}&category=${category}&rating=${rating}&searchActor=${searchActor}&rowPerPage=${rowPerPage}&price=${price}&searchDescription=${searchDescription}&titleAndDescription=${titleAndDescription}">이전</a></li>        
										        </c:if>
										       
										        <c:if test="${currentPage < lastPage}">
									            	<li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&searchWord=${searchWord}&category=${category}&rating=${rating}&searchActor=${searchActor}&rowPerPage=${rowPerPage}&price=${price}&searchDescription=${searchDescription}&titleAndDescription=${titleAndDescription}">다음</a></li>        
										        </c:if>
										    </ul>
									    </div>
									    
									     <form id="getFilmListAction" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
											<div>
												게시물 수
												<select id="rowPerPage" name="rowPerPage">
													<c:forEach begin="10" step="10" end="30" var="i">
														<c:if test="${i.equals(rowPerPage)}">
															<option selected="selected" value="${i}">${i}</option>
														</c:if>
														<c:if test="${!i.equals(rowPerPage)}">
															<option value="${i}">${i}</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
											
											
											<div>
												카테고리
												<select id="category" name="category">
													<option value="all">all</option>
													<c:forEach var="c" items="${categoryList}">
														<c:if test="${(c.name).equals(category)}">
															<option selected="selected" value="${c.name}">${c.name}</option>
														</c:if>
														<c:if test="${!(c.name).equals(category)}">
															<option value="${c.name}">${c.name}</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
											
											<div>
												등급
												<c:if test="${rating.equals('teenager')}">
													<input type="radio" class="rating" name="rating" value="teenager" checked="checked">청소년 관람 가능
												</c:if>
												<c:if test="${!rating.equals('teenager')}">
													<input type="radio" class="rating" name="rating" value="teenager">청소년 관람 가능
												</c:if>
												
												<c:if test="${rating.equals('adult')}">
													<input type="radio" class="rating" name="rating" value="adult" checked="checked">청소년 관람 불가
												</c:if>
												<c:if test="${!rating.equals('adult')}">
													<input type="radio" class="rating" name="rating" value="adult">청소년 관람 불가
												</c:if>
												
												<c:if test="${rating.equals('all')}">
													<input type="radio" class="rating" name="rating" value="all" checked="checked">모두 보기
												</c:if>
												<c:if test="${!rating.equals('all')}">
													<input type="radio" class="rating" name="rating" value="all">모두 보기
												</c:if>
											</div>
								
											
											<div>
												가격
												<select id="price" name="price">
													<option value="0">all</option>
													<c:if test="${price == 0.99}">
														<option value="0.99" selected="selected">0.99</option>
													</c:if>
													<c:if test="${price != 0.99}">
														<option value="0.99">0.99</option>
													</c:if>
													
													<c:if test="${price == 2.99}">
														<option value="2.99" selected="selected">2.99</option>
													</c:if>
													<c:if test="${price != 2.99}">
														<option value="2.99">2.99</option>
													</c:if>
													
													<c:if test="${price == 4.99}">
														<option value="4.99" selected="selected">4.99</option>
													</c:if>
													<c:if test="${price != 4.99}">
														<option value="4.99">4.99</option>
													</c:if>
												</select>
											</div>
											
											
											<div>
												검색
												<select id="searchOption">
										    		<option value="title">제목</option>
										    		<option value="actor">배우</option>
										    		<option value="description">줄거리</option>
										    		<option value="titleAndDescription">제목+줄거리</option>
										    	</select>
										    	
										    	<span id="target">
										    		<input type="text" name="searchWord" id="searchWord">
										    	</span>
											</div>	
									    	
											<br>
											<button type="button" id="getListBtn">검색</button>
										</form>	
									    
									    
									    <!-- 영화 추가 버튼 -->
									    <div>
									    	<a href="${pageContext.request.contextPath}/admin/addFilm">영화등록</a>
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