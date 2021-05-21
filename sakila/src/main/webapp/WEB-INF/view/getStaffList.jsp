<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getStaffList</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>
	 th {
   text-align:center
}
	td{
   text-align:center
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<a href="${pageContext.request.contextPath}/">HOME</a>
		</div>
		<h1>직원 목록</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>name</th>
					<th>SID(근무 매장 번호)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${staffList}">
					<tr>
						<td>${s.ID}</td>
						<td>
							<a href="${pageContext.request.contextPath}/admin/getStaffOne?ID=${s.ID}">${s.name}</a>
							
						</td>
						<td>${s.address}</td>
						<td>${s.SID}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
</body>
</html>