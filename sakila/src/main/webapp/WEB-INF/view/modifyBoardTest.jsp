<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify Board</title>
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
		console.log('ready');
		$('#btn').click(function(){
			if($('#boardPw').val().length < 4){
				 alert('boardPw는 4자이상 이어야 합니다');
				 $('#boardPw').focus();
			} else {
				$('#modifyForm').submit();	
			}
		}) ;
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
                            <h4>게시글 수정</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getBoardList">직원게시판</a></li>
                        	<li class="breadcrumb-item active">게시글수정</li>
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
                                	<form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyBoard" method="post">
										 <table class="table table-responsive-sm">
										      <tbody>
										         <tr>
										             <td>board_id :</td>
										             <td>
										             	<input type ="text" name="boardId" readonly="readonly" value="${map.boardId}">
										             </td>
										         </tr>
										         <tr>
										             <td>board_pw :</td>
										             <td><input type="password" name="boardPw" id="boardPw"></td>
										         </tr>
										         <tr>
										              <td>board_title :</td>
										              <td>
										          		<input id="boardTitle" name="boardTitle" type="text" value="${map.boardTitle}">
										              </td>
										          </tr>
										          <tr>
										               <td>board_content :</td>
										               <td>
										               	<textarea class="form-control" rows="10" cols="100" name="boardContent" id="boardContent">${map.boardContent}</textarea>
										               </td>
										          </tr>
										          <tr>
										               <td>username :</td>
										               <td>${map.username}</td>
										          </tr>
										          <tr>
										               <td>insert_date :</td>
										               <td>${map.insertDate}</td>
										          </tr>
										      </tbody>   
										</table>
										<div class="row text-right">
											<button type="button" id="btn" class="btn">수정</button>
										</div>
										
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