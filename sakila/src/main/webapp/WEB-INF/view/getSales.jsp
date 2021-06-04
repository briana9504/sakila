<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function(){
	
	//차트 그리기 위한 정보
	$.ajax({
		type: 'get',
		url: '/getSalesByFilmCategory',
		success: function(jsonData){
			console.log('성공!');
			
			let labels =  new Array();
			let datas = new Array();
			

			$(jsonData).each(function(index, item){
				labels.push(item.category);
				datas.push(item.totalSales);
			});
			
			console.log(labels);
			console.log(datas);
			
			
			
			const data = {
					  labels: labels,
					  datasets: [
					    {
					      label: 'Dataset 1',
					      data: datas,
					      backgroundColor: [ 'rgb(255, 99, 132)',
					          'rgb(75, 192, 192)',
					          'rgb(255, 205, 86)',
					          'rgb(201, 203, 207)',
					          'rgb(54, 162, 235)',
					          'rgb(255,215,0)',
					          'rgb(0,128,0)',
					          'rgb(127,255,212)',
					          'rgb(138,43,226)',
					          'rgb(255,255,224)',
					          'rgb(240,255,255)',
					          'rgb(139,69,19)',
					          'rgb(255,182,193)',
					          'rgb(72,61,139)',
					          'rgb(127,255,212)',
					          'rgb(128,128,0)'] ,
					    }
					  ]
					};
			
			const config = {
					  type: 'pie',
					  data: data,
					  options: {
					    responsive: true,
					    plugins: {
					      legend: {
					        position: 'top',
					      },
					      title: {
					        display: true,
					        text: 'Chart.js Pie Chart'
					      }
					    }
					  },
					};
			 var myChart = new Chart(
					    document.getElementById('myChart'),
					    config
					  );

		}
	})
	
	
});
</script>
</head>
<body>
	<h1>카테고리별 매출집계</h1>
	
	<div>
		 <canvas id="myChart" width="10" height="50"></canvas>
	</div>
	
	

</body>
</html>