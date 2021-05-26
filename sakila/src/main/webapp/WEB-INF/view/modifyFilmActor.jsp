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
	<h1>addFilmActor</h1>
	
	<form id="addFilmAction" action="${pageContext.request.contextPath}/admin/modifyFilmActor" method="post">
		<input type="hidden" name="filmId" value="${filmId}">
		<table border="1">
			<tbody>
				<c:forEach items="${actorList}" var="a">
					<tr>
						<td>
							${a.name}
							<c:if test="${a.ck == 'X'}">
								<input type="checkbox" name="actorId" value="${a.actorId}">
							</c:if>
							
							<c:if test="${a.ck == 'O'}">
								<input type="checkbox" name="actorId" checked="checked" value="${a.actorId}">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<button id="btn" type="button">배우추가</button>
	</form>
</body>
</html>