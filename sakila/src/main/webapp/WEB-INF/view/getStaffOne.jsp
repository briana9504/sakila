<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		<h1>staffMap</h1>
		
		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<td>${staffMap.ID}</td>
			</tr>
			<tr>
				<th>name</th>
				<td>${staffMap.name}</td>
			</tr>
			<tr>
				<th>address</th>
				<td>${staffMap.address}</td>
			</tr>
			<tr>
				<th>zip code</th>
				<td>${staffMap.zipCode}</td>
			</tr>
			<tr>
				<th>phone</th>
				<td>${staffMap.phone}</td>
			</tr>
			<tr>
				<th>city</th>
				<td>${staffMap.city}</td>
			</tr>
			<tr>
				<th>country</th>
				<td>${staffMap.country}</td>
			</tr>
			<tr>
				<th>SID(근무 매장 번호)</th>
				<td>${staffMap.SID}</td>
			</tr>
		</table>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a>
	</div>
</body>
</html>