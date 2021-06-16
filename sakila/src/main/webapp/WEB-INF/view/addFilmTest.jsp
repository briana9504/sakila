<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add film</title>
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
	$('#btn').click(function(){
		console.log('click!');
		
		if($('#title').val() == ''){
			alert('제목을 입력하세요');
			$('#title').focus();
		} else {
			$('#addFilmAction').submit();
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
                            <h4>영화 등록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a></li>
                             <li class="breadcrumb-item active">영화등록</li>
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
                                	<form method="post" action="${pageContext.request.contextPath}/admin/addFilm" id="addFilmAction">	
										<table class="table table-responsive-sm">
											<tr>
								               <td>title</td>
								               <td>
								                  <input type="text" name="film.title" id="title" class="form-control">
								               </td>
								            </tr>
								            <tr>
								               <td>category</td>
								               <td>
								                  <select name="category.categoryId" id ="categoryId" class="form-control">
								                     <c:forEach var="c" items="${categoryList}">
								                        <option value="${c.categoryId}">${c.name}</option>
								                     </c:forEach>
								                  </select>
								               </td>
								            </tr>
								            <tr>
								               <td>description</td>
								               <td>
								                  <textarea rows="5" cols="100" name="film.description" id="description" class="form-control"></textarea>
								               </td>
								            </tr>
								            <tr>
								               <td>releaseYear</td>
								               <td>
								                  <input type="text" name="film.releaseYear" id="releaseYear" class="form-control">
								               </td>
								            </tr>
								            <tr>
								               <td>language</td>
								               <td>
								                  <select name="film.languageId" id ="language" class="form-control">
								                     <c:forEach var="lang" items="${languageList}">
								                        <option value="${lang.languageId}">${lang.name}</option>
								                     </c:forEach>
								                  </select>
								               </td>
								            </tr>
								            <tr>
								               <td>originalLanguage</td>
								               <td>
								                  <select name="film.originalLanguageId" id ="originalLanguage" class="form-control">
								                     <c:forEach var="lang" items="${languageList}">
								                        <option value="${lang.languageId}">${lang.name}</option>
								                     </c:forEach>
								                  </select>
								               </td>
								            </tr>
								            <tr>
								               <td>rentalDuration</td>
								               <td>
								                  <input type="text" name="film.rentalDuration" id="rentalDuration" class="form-control" value="3">               
								               </td>
								            </tr>
								            <tr>
								               <td>rentalRate</td>
								               <td>
								                  <input type="text" name="film.rentalRate" id="rentalRate" class="form-control" value="4.99">
								               </td>
								            </tr>
								            <tr>
								               <td>length</td>
								               <td>
								                  <input type="text" name="film.length" id="length" class="form-control">
								               </td>
								            </tr>
								            <tr>
								               <td>replacementCost</td>
								               <td>
								                  <input type="text" name="film.replacementCost" id="replacementCost" class="form-control" value="19.99">
								               </td>
								            </tr>
								            <tr>
								               <td>rating</td>
								               <td>
								                  <select name="film.rating" id ="rating" class="form-control">
								                     <option value="G" selected="selected">G</option>
								                     <option value="PG">PG</option>
								                     <option value="PG-13">PG-13</option>
								                     <option value="R">R</option>
								                     <option value="NC-17">NC-17</option>
								                  </select>
								               </td>
								            </tr>
								            <tr>
								               <td>specialFeatures</td>
								               <td>
								                  <input type="checkbox" name="specialFeatures" value="Trailers">Trailers&nbsp;
								                  <input type="checkbox" name="specialFeatures" value="Commentaries">Commentaries&nbsp;
								                  <input type="checkbox" name="specialFeatures" value="Deleted Scenes">Deleted Scenes&nbsp;
								                  <input type="checkbox" name="specialFeatures" value="Behind the Scenes">Behind the Scenes
								               </td>
								            </tr>
										</table>
									</form>
									<div>
										<button id="btn" class="btn btn-secondary">영화등록</button>
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