<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add board</title>
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
        $('#addButton').click(function() {
        	//파일 검사 --> 각각 내용이 있는지 없는지
        	//파일들 중 하나라도 첨부되지 않으면 ck = true;
        	let ck = false;
        	let boardfile = $('.boardfile'); // 배열
        	//boardfile.each()를 사용하지 않는이유? break키워드를 사용하기 위해서 for 반복문 사용
        	for(let item of boardfile){// 자바의 (String s: arr)과 같음
        		if($(item).val() == ''){
        			ck = true;
        			console.log('첨부되지 않은 파일이 있습니다.');
        			break;
        		}
        	}
        	
        	if(ck){
        		alert('첨부되지 않은 파일이 있습니다.');
        	} else if($('#boardPw').val().length < 4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else if ($('#boardTitle').val() == '') {
                alert('boardTitle을 입력하세요');
                $('#boardTitle').focus();
            } else if ($('#boardContent').val() == '') {
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else if ($('#staffId').val() == '') {
                alert('staffId을 입력하세요');
                $('#boardUser').focus();
            } else {
                $('#addForm').submit();
            }
        });
        
        //파일추가 -> inputFile에 input type="file" 마지막에 추가
        $('#addFileBtn').click(function() {
			console.log('addFileBtn click!');
			$('#inputFile').append('<input type="file" name="boardfile" class="boardfile">')
		});
     	 //파일삭제 -> inputFile의 마지막 input type="file" 삭제
		 $('#delFileBtn').click(function() {
			 console.log('delFileBtn click!');
			 //#inputFile 자식 태그 중 마지막을 삭제
			 $('#inputFile').children().last().remove();
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
                            <h4>게시글 등록</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getBoardList">직원게시판</a></li>
                        	<li class="breadcrumb-item active">게시글등록</li>
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
                                <form id="addForm" action="${pageContext.request.contextPath}/admin/addBoard" method="post" enctype="multipart/form-data">
						            <div>
						            	<div>
						            		<button id="addFileBtn" type="button">파일추가</button>
						            		<button id="delFileBtn" type="button">파일삭제</button>
						            	</div>
						            	<div id="inputFile">
						            	</div>
						            </div>
						            <div class="form-group">
						                <label for="boardPw">boardPw :</label>
						                <input class="form-control"name="board.boardPw" id="boardPw" type="password" />
						            </div>
						            <div class="form-group">
						                <label for="boardPw">boardTitle :</label>
						                <input class="form-control" name="board.boardTitle" id="boardTitle" type="text" />
						            </div>
						            <div class="form-group">
						                <label for="boardContent">boardContent :</label>
						                <textarea class="form-control" name="board.boardContent" id="boardContent" rows="5" cols="50"></textarea>
						            </div>
						            <div class="form-group">
						                <label for="staffId">staffId :</label> <input class="form-control" name="board.staffId" id="staffId" type="text" />
						            </div>
						            <div>
						                <input class="btn btn-default" id="addButton" type="button" value="글입력" />
						                <input class="btn btn-default" type="reset" value="초기화" /> 
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