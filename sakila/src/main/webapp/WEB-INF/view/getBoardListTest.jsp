<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                            <h4>직원게시판</h4>
                            <p class="mb-0"><!-- 쓸거 있으면 쓰기... --></p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getBoardList">직원게시판</a></li>
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
                                	<table class="table table-hover table-responsive-sm text-center">
											<thead>
									            <tr>
									                <th>boardId</th>
									                <th>boardTitle</th>
									                <th>insertDate</th>
									            </tr>
									        </thead>
									        <tbody>
									            <c:forEach var="b" items="${boardList}">
									                <tr>
									                    <td class="col-sm-2">${b.boardId}</td>
									                    <td class="col-sm-7 text-left"> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
									                    	<a href="${pageContext.request.contextPath}/admin/getBoardOne?boardId=${b.boardId}">${b.boardTitle}</a>
									                    </td>
									                    <td class="col-sm-4">${b.insertDate.substring(0,10)}</td>
									                </tr>
									            </c:forEach>
									        </tbody>
										</table>
								
										
								
								
									<!-- 현재 페이지/ 마지막 페이지 -->
										<div class="text-center">
											${currentPage}/${lastPage}
										</div>
										
										<!-- 페이징 -->
										<ul class="pager">
									        <c:if test="${currentPage > 1}">
									            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getBoardList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
									        </c:if>
									        <c:if test="${currentPage < lastPage}">
									            <li class="next"><a href="${pageContext.request.contextPath}/admin/getBoardList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
									        </c:if>
									    </ul>
									    
									    <!-- 검색어 입력창 -->
									    <div class="text-center">
										    <form action="${pageContext.request.contextPath}/admin/getBoardList" method="get">
										        <label for="searchWord">검색어(제목) :</label> 
										        <input name="searchWord" type="text">
										        <button type="submit">검색</button>
										    </form>	
									    </div>
	                                  
	                                  	<!-- 게시글 입력 -->
	                                  	<div>
									        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addBoard">게시글 등록</a>
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