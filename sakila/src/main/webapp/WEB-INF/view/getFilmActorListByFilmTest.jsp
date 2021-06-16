<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify film actor</title>
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
		console.log('btn click!');
		$('#addFilmAction').submit();
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
                            <h4>(${filmId} 번)영화 출연자 수정</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getStaffList">출연자수정</a></li>
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
                                <form id="addFilmAction" action="${pageContext.request.contextPath}/admin/modifyFilmActor" method="post">
									<div>
										<button id="btn" type="button">출연진 추가</button>
									</div>
										
									<input type="hidden" name="filmId" value="${filmId}" readonly="readonly">
									
									<c:forEach var="m" items="${actorList}">
										&nbsp;
										<!-- 첫문자로 그룹핑하여 보여줌 -->
										<c:if test="${preFirstStr != m.name.substring(0, 1)}">
											<c:set var="preFirstStr" value="${m.name.substring(0, 1)}"/>
											<hr>
											<div><span class="text-danger">${m.name.substring(0, 1)}</span></div>
										</c:if>
										
										<span>${m.name.substring(0, 1)}</span>${m.name.substring(1)}&nbsp;
										
										<c:if test="${m.ck == 'X'}">
											<input type="checkbox" name="actorId" value="${m.actorId}">
										</c:if>
										<c:if test="${m.ck == 'O'}">
											<input type="checkbox" name="actorId" checked="checked" value="${m.actorId}">
										</c:if>
										&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>						
								</form>
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