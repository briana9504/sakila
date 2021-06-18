<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board one</title>
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
$(document).ready(function() {
	console.log('ready');
	
	$('#btn').click(function() {
		console.log('btn.click!');
		if ($('#username').val() == '') {
			 alert('username을 입력하세요');
			 $('#username').focus();
		} else if ($('#commentContent').val() == ''){
			 alert('commentContent를 입력하세요');
			 $('#commentContent').focus();
		} else{
			$('#addCommentForm').submit();
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
                            <h4>게시글 상세보기</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                            <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getBoardList">직원게시판</a></li>
                       		<li class="breadcrumb-item active">게시글 상세보기</li>
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
                                		
										<table class="table table-responsive-sm">
											<tbody>
									             <tr>
									                <td class="col-sm-2">board_id :</td>
									                <td>${boardMap.boardId}</td>
									       	    </tr>
									            <tr>
									                 <td>board_title :</td>
									                 <td>${boardMap.boardTitle}</td>
									            </tr>
									            <tr>
									                  <td>board_content :</td>
									                  <td>${boardMap.boardContent}</td>
									            </tr>
									            <tr>
									                 <td>username :</td>
									                 <td>${boardMap.username}</td>
									            </tr>
									          	<tr>
									                 <td>insert_date :</td>
									                 <td>${insertDate}</td>
									            </tr>
									            <!-- 업로드한 파일 출력 -->
												<tr>
								                   <td>boardfile :</td>
								                   <td>
								                   		<div>
								                   			<c:if test="${sessionUsername == boardMap.username}"><!-- 로그인한 유저네임과 글쓴이가 같아야만 파일 추가가 뜬다. -->
								                   				<a href="${pageContext.request.contextPath}/admin/addBoardfile?boardId=${boardMap.boardId}&username=${boardMap.username}">
								                   					<button type="button">파일추가</button>
								                   				</a>
								                   			</c:if>         			
								                   		</div>
								                   		<!-- 여러개일 수 있으니 출력하는 반복문 코드 구현 -->
								                   		<c:forEach items="${boardfileList}" var="f">
								                   			<div>
								                   				<a href ="${pageContext.request.contextPath}/resource/${f.boardfileName}">${f.boardfileName}</a>
								                   				<c:if test="${sessionUsername == boardMap.username}">
									                   				<a href="${pageContext.request.contextPath}/admin/removeBoardfile?boardfileId=${f.boardfileId}&boardId=${f.boardId}&boardfileName=${f.boardfileName}">
									                   					<button type="button">파일삭제</button>
									                   				</a>
								                   				</c:if>
								                   			</div>
								                 			<div>
								                 				<img src="${pageContext.request.contextPath}/resource/${f.boardfileName}" height="100" width="100">
								                 			</div>
								                   		</c:forEach>
								                   </td>
									            </tr>
									        </tbody>
										</table>
										
										<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">수정</a>
   										<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">삭제</a>
										
									                                  	                                  	
	                             </div>
	                           </div>                        
	                        </div>
	                     </div>	                
	                <!-- 리스트 끝 -->
	                
	                
	                
	                <!-- 댓글 시작 -->
            	 	<div class="col-lg-12">
                        <div class="card">
                        	<div class="card-header">
                                전체 댓글수 : ${commentList.size()}
                            </div>
                             <div class="card-body">
                                <div>
							   		<div><!-- 댓글 남기기 -->
							   			<form id="addCommentForm" action="${pageContext.request.contextPath}/admin/addComment" method="post">
							   				<input name="boardId" type="hidden" value="${boardMap.boardId}">
							   				<input id="username" type="text" name="username" value="${sessionUsername}" readonly="readonly">
							   				<div>
							   					<textarea id="commentContent" name="commentContent" rows="5" cols="80" placeholder="commentContent"></textarea>
							   				</div>
							   				<button id="btn" type="button">댓글 남기기</button>
							   			</form>
							   		</div>
							   		<br>
							   		<table class="table table-responsive-sm">
							   			<c:forEach items="${commentList}" var="c">
								   			<tr>
								   				<td class="col-sm-9">${c.commentContent}</td>
								   				<td id="commentUsername" class="col-sm-1">${c.username}</td>
								   				<td>${c.insertDate.substring(0,10)}</td>
								   				<td id="commentDelete">
								   				<!-- 로그인 아이디와 commentName이 같은 경우에만 삭제 버튼이 나온다. -->
								   					<c:if test="${sessionUsername == c.username}">
								   						<a href="${pageContext.request.contextPath}/admin/removeComment?commentId=${c.commentId}&boardId=${boardMap.boardId}&username=${c.username}">삭제</a>
								   					</c:if>		
								   				</td>
								   			</tr>
							   			</c:forEach>
							   		</table>
							   	</div>
	                           </div>                        
	                        </div>
	                     </div>	                
	                <!-- 댓글 끝 -->
            	 
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