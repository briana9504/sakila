<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Summernote -->
    <link href="${pageContext.request.contextPath}/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	console.log('ready!');
	$('#btn').click(function() {
		console.log('btn click!');
		
		if($('#email').val() == ''){
			 alert('email을 입력해 주세요.');
			 $('#email').focus();
		} else if($('#password').val().length < 4){
			 alert('password는 4자이상 이어야 합니다');
			 $('#password').focus();
		} else {
			$('#loginForm').submit();
		}
		
	});
	
	
});
</script>
</head>
<body class="h-100">


    <!--*******************
        Preloader start
    ********************-->
   
    <!--*******************
        Preloader end
    ********************-->
	<!-- 로그인 되었을 때 -->
	<c:if test="${loginStaff == null}">
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">Sign in</h4>
                                   <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                                        <div class="form-group">
                                        	
                                            <label><strong>Email</strong></label>
                                            <input type="email" id="email" name="email" class="form-control" value="mike@gd.com">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Password</strong></label>
                                            <input type="password" id="password" class="form-control" name="password" value="1234">
                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                                <div class="form-check ml-2">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button id="btn" type="button" class="btn btn-primary btn-block">Sign me in</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	</c:if>
	<!-- 로그인 안되었을때...-->
	<c:if test="${loginStaff != null}">
	
	<div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
		<div id="main-wrapper"><!-- 메뉴 -->
			<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
			
			<!-- 몸체 -->
			 <div class="content-body">
	            <div class="container-fluid">
	                <div class="row page-titles mx-0">
	                    <div class="col-sm-6 p-md-0">
	                        <div class="welcome-text">
	                            <h4>Hi, welcome back!</h4>
	                            <p class="mb-0">sakila 영화대여점 관리사이트입니다.</p>
	                        </div>
	                    </div>
	                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
	                        <ol class="breadcrumb">
	                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
	                        </ol>
	                    </div>
	                </div>
	                
	            </div>
	        </div>
			
			
			<!-- footer -->
			<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
		</div>
	</c:if>
	
	<script src="${pageContext.request.contextPath}/vendor/global/global.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/quixnav-init.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
    

    <!-- Summernote -->
    <script src="${pageContext.request.contextPath}/vendor/summernote/js/summernote.min.js"></script>
    <!-- Summernote init -->
    <script src="${pageContext.request.contextPath}/js/plugins-init/summernote-init.js"></script>
</body>
</html>