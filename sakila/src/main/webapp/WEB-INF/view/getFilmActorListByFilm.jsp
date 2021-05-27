<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>addFilmActor</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
	<div class="container">

		<h1>(${filmId} 번)영화 출연자 수정</h1>
		
		<form id="addFilmAction" action="${pageContext.request.contextPath}/admin/modifyFilmActor" method="post">
		<div>
			<button id="btn" type="button">출연진 추가</button>
		</div>
			
			<input type="hidden" name="filmId" value="${filmId}" readonly="readonly">
			
			<h3>A</h3>
			
			<c:forEach var="i" begin="0" end="${actorList.size()-1}" step="1">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="color:red;">${actorList.get(i).name.substring(0,1)}</span><span>${actorList.get(i).name.substring(1)}</span>	
								
				<c:if test="${actorList.get(i).ck == 'X'}">
					<input type="checkbox" name="actorId" value="${actorList.get(i).actorId}">
				</c:if>
				
				<c:if test="${actorList.get(i).ck == 'O'}">
					<input type="checkbox" name="actorId" checked="checked" value="${actorList.get(i).actorId}">
				</c:if>
			
				<c:if test="${(i!=0) && actorList.get(i).name.substring(0,1) != actorList.get(i+1).name.substring(0,1)}">
					<div></div>
					<h3>${actorList.get(i+1).name.substring(0,1)}</h3>
					<div></div>
				</c:if>
			</c:forEach>
			
		</form>
	</div>
</body>
</html>